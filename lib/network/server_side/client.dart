import 'dart:io';

import 'package:models/business/business.dart';
import 'package:tools/error_handling/app_error.dart';
import 'package:models/network/network.dart';

import 'server.dart';

/// 用于和客户端收发信息
/// 1. 当接受的信息为[Request]格式时，返回的信息为[Response]（在绝大部分情况下，它们的id会一一对应）
/// 2. 当推送消息时，客户端会主动向用户发送[Operation]操作，用于指导客户端修改服务器的数据
class Client {
  /// 当[user]为null时，即未登录
  User? user;
  final WebSocket _socket;
  final Server server;

  /// 由于[getCommand]可能会频繁修改，所以最好放在客户端
  Client(
    this._socket,
    this.server,
    Command? Function(Server server, Client client, Request request) getCommand,
  ) {
    // 发送一条连接成功作为回应
    final hello = Response(accept: true, message: "连接成功，请登录");
    _socket.send(hello);

    // 等待请求
    _socket.listen((message) async {
      Request? request;
      late final Response response;

      try {
        // 解析
        request = Request.parse(message);

        // 找到对应的指令
        final Command? command = getCommand(server, this, request);
        if (command == null) throw AppError("无法识别指令");

        // 执行指令，并回复结果
        // ignore: invalid_use_of_protected_member
        response = await command.run();
      } on AppError catch (error) {
        // 预期内的错误
        response = Response.refuse(error.reason);
      } catch (error, stackTrace) {
        // 预期外的错误，记录信息，方便找原因
        final filteredTrace = stackTrace.toString().split('\n').where((line) {
          return line.contains('bitotus');
        }).join('\n');
        final errorDetails = error.toString();
        response = Response.refuse(
            "发生预期外的错误：【$errorDetails】\n相关代码位置:\n$filteredTrace（嗨，如果你愿意向我反馈此问题，我将尽快修复它，非常感谢！我的微信号是：lucid_quantum）。");
      }

      // 回复请求
      response.id = request?.id;
      _socket.send(response);
    });
  }

  void sendOperation(Operation operation) => _socket.send(operation);
}
