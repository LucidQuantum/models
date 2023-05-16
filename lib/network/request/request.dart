import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:tools/json.dart';
import 'package:tools/generator.dart';
import 'package:tools/refuse.dart';

import '../../database/document.dart';
import '../response/response.dart';

part 'request.g.dart';

@JsonSerializable()
class Request implements Serializable {
  final String id;
  final String command;
  final Json? data;

  const Request({required this.id, required this.command, required this.data});

  Request.create({required this.command, this.data}) : id = Generator.id();

  factory Request.fromJson(Json json) => _$RequestFromJson(json);
  Json toJson() => _$RequestToJson(this);

  factory Request.parse(String string) {
    final json = string.toJson();

    json.ensure<String>("command");
    json.ensure<Json>("data", nullable: true);

    return Request.fromJson(json);
  }

  /// 等待回复
  /// 根据id识别，一旦收到了准确的回复，就会关闭监听
  Future<Response> waitForReply(Stream broadcast) async {
    assert(broadcast is! WebSocket);

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

  /// 服务端

  /// 从Request的dada中稳定获取一个数值，否则报错
  T extract<T>(String key) {
    if (data == null) throw Refuse("data为空，请补充");
    return data!.extract<T>(key);
  }

  reply(WebSocket socket, Response response) {
    response.id = id;
    socket.add(jsonEncode(response.toJson()));
  }
}

// /// 等待回复
// /// 根据id识别，一旦收到了准确的回复，就会关闭监听
// Future<Response> waitForReply(Stream broadcast) async {
//   assert(broadcast is! WebSocket);

//   final completer = Completer<String>();
//   late StreamSubscription subscription;

//   subscription = broadcast.listen((data) {
//     final response = Response.fromJson(jsonDecode(data));
//     bool isReplyForThis = response.id == id;
//     if (isReplyForThis && !completer.isCompleted) {
//       completer.complete(data);
//       subscription.cancel();
//     }
//   });

//   final json = await completer.future;
//   final response = Response.fromJson(jsonDecode(json));

//   return response;
// }

