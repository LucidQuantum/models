import 'dart:io';

import 'package:models/network/socket.dart';
import 'package:tools/error_handling/app_error.dart';

import '../../user/user.dart';
import '../client_side/request/request.dart';
import 'command.dart';
import 'response/response.dart';

/// 对于服务器来说，一个连接就是一个客户端
/// 连接成功后，每收到一个请求，就需要将它转化为可执行的命令，并给予一个返回的Response
/// 如果该命令涉及到数据的变化，那就要以Push的形式推送给客户端
class Client {
  User? user;
  final WebSocket _socket;

  /// [getCommand]：由于可能会频繁修改，所以最好放在客户端
  Client(
    this._socket,
    Command? Function(Client client, Request request) getCommand,
  ) {
    // 发送一条连接成功作为回应
    final hello = Response(accept: true, message: "连接成功，请登录");
    _socket.send(hello);

    // 等待请求
    _socket.listen((message) async {
      // 解析，通常在产品中这一步不会出错
      late final Request request;
      try {
        request = Request.parse(message);
      } on AppError catch (error) {
        final warning = Response.refuse(error.reason);
        _socket.send(warning);
      }

      // 得到回复
      late final Response response;
      try {
        // 找到对应的指令
        final Command? command = getCommand(this, request);
        if (command == null) throw AppError("无法识别指令");

        // 执行指令，并回复结果
        response = await command.execute();
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
      response.id = request.id;
      _socket.send(response);
    });
  }
}
