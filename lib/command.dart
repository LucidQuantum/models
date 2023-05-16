import 'dart:io';

import 'package:models/json.dart';
import 'package:models/serializable.dart';
import 'package:models/user/user.dart';

abstract class Command implements Serializable {
  final String name;
  final Json? data;

  Command(this.name, {this.data});

  /// 如果不报错就是成功，也可能会返回一些数据
  Future execute();
}

/// 要求登录才能执行的指令
abstract class LoginRequiredCommand extends Command {
  late final User user;
  LoginRequiredCommand(String name, {required User? user, required super.data})
      : super(name) {
    if (user == null) throw WebSocketException("无法找到用户，请先登录");
    this.user = user;
  }
}
