import 'package:json_annotation/json_annotation.dart';
import 'package:models/serializable.dart';

import '../../json.dart';

part 'request.g.dart';

@JsonSerializable()
class Request implements Serializable {
  final String command;
  final Json? data;

  const Request({required this.command, required this.data});

  factory Request.fromJson(Json json) => _$RequestFromJson(json);
  Json toJson() => _$RequestToJson(this);

  /// 从Request中稳定获取一个数值，否则报错
  T extract<T>(String key) {
    if (data == null) throw Exception("data为空，请补充");
    if (!data!.containsKey(key)) throw Exception("数据中缺少$key");
    if (data![key] is! T) throw Exception("数据$key的格式不正确，应该为${T.toString()}");

    return data![key];
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

