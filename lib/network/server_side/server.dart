import 'dart:io';
import 'package:models/network/network.dart';

import '../../business/user/user.dart';

class Server {
  // 单例模式
  Server._internal();
  static final _singleton = Server._internal();
  factory Server() => _singleton;

  // 维持中的所有连接
  List<Client> clients = [];

  late Command? Function(Server server, Client client, Request request)
      getCommand;

  Future launch(
    Command? Function(Server server, Client client, Request request) getCommand,
  ) async {
    // 3. 绑定
    this.getCommand = getCommand;

    // 1. 开放端口
    final _server = await HttpServer.bind(InternetAddress.anyIPv4, 1209);
    print("正在监听${_server.address.address}:${_server.port}");

    // 2. 等待WebSocket请求
    await for (HttpRequest httpRequest in _server) {
      if (WebSocketTransformer.isUpgradeRequest(httpRequest)) {
        WebSocketTransformer.upgrade(httpRequest).then(handleWebSocket); // 升级连接
      } else {
        httpRequest.response.statusCode = HttpStatus.badRequest;
        httpRequest.response.write('不支持HTTP/HTTPS协议，请使用WebSocket');
        httpRequest.response.close();
      }
    }
  }

  handleWebSocket(WebSocket socket) {
    final client = Client(socket, this, getCommand);
    clients.add(client);
  }

  void sendOperation(User user, Operation operation) {
    // 寻找所有符合的client
    final List<Client> userClients =
        clients.where((client) => client.user?.id == user.id).toList();

    // 向这些client发送Operation
    for (final client in userClients) {
      client.sendOperation(operation);
    }
  }
}
