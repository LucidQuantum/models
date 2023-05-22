import 'package:meta/meta.dart';
import 'dart:io';
import 'package:models/network/network.dart';

import '../../business/user/user.dart';

/// 由于使用WebSocket连接，所以需要此class来维护[Client]
/// 它的作用相当于[Client]的数据库，只不过不需要持久化保存
class Server {
  /// 维持中的所有连接
  List<Client> _clients = [];

  static final _singleton = Server._internal();
  factory Server() => _singleton;
  Server._internal();

  late Command? Function(Client client, Request request) getCommand;

  /// 通常在main.dart中使用，其他地方都是不合法的
  @protected
  Future launch(
    Command? Function(Client client, Request request) getCommand,
  ) async {
    // 3. 绑定
    this.getCommand = getCommand;

    // 1. 开放1209端口
    final _server = await HttpServer.bind(InternetAddress.anyIPv4, 1209);
    print("正在监听${_server.address.address}:${_server.port}");

    // 2. 等待请求
    await for (HttpRequest httpRequest in _server) {
      if (WebSocketTransformer.isUpgradeRequest(httpRequest)) {
        // 如果是WebSocket，则升级连接
        final socket = await WebSocketTransformer.upgrade(httpRequest);

        // 注册并维持连接
        final client = Client(socket, getCommand);
        _clients.add(client);

        // 当连接关闭时，移除连接
        socket.done.then((_) {
          _clients.remove(client);
        });
      } else {
        // 如果是http请求，则拒绝
        httpRequest.response.statusCode = HttpStatus.badRequest;
        httpRequest.response.write('不支持HTTP/HTTPS协议，请使用WebSocket');
        httpRequest.response.close();
      }
    }
  }

  void pushOperation(User user, Operation operation) {
    // 寻找所有符合的client
    final List<Client> userClients =
        _clients.where((client) => client.user?.id == user.id).toList();

    // 向这些client发送Operation
    for (final client in userClients) {
      client.sendOperation(operation);
    }
  }
}
