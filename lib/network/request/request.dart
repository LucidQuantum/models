import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:models/serializable.dart';
import 'package:tools/generator.dart';

import '../response/response.dart';

part 'request.g.dart';

@JsonSerializable()
class Request implements Serializable {
  /// 如果有id，就是某个特定的回复，如果没有id，那就是通用的回复
  final String? id;
  final String command;
  final Map<String, dynamic>? data;

  const Request({this.id, required this.command, required this.data});
  factory Request.create(
          {required String command, Map<String, dynamic>? data}) =>
      Request(id: Generator.id(), command: command, data: data);

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);
  Map<String, dynamic> toJson() => _$RequestToJson(this);

  /// 从Request中稳定获取一个数值，否则报错
  T extract<T>(String key) {
    if (data == null) throw Exception("data为空，请补充");
    if (!data!.containsKey(key)) throw Exception("数据中缺少$key");
    if (data![key] is! T) throw Exception("数据$key的格式不正确，应该为${T.toString()}");

    return data![key];
  }

  Future<Response> waitForReply(Stream broadcast) async {
    final completer = Completer<String>();
    late StreamSubscription subscription;

    subscription = broadcast.listen((data) {
      final response = Response.fromJson(jsonDecode(data));
      bool isReplyForThis = response.id == id;
      if (isReplyForThis && !completer.isCompleted) {
        completer.complete(data);
        subscription.cancel();
      }
    });

    final json = await completer.future;
    final response = Response.fromJson(jsonDecode(json));

    return response;
  }

  reply(WebSocket socket, Response response) {
    response.id = id;
    socket.add(jsonEncode(response.toJson()));
  }
}
