import 'dart:convert';
import 'dart:io';

import 'package:models/database/document.dart';

import 'client_side/request/request.dart';
import 'server_side/response/response.dart';

extension SendMessageExtension on WebSocket {
  void sendRequest(Request request) => add(jsonEncode(request.toJson()));
  void sendResponse(Response response) => add(jsonEncode(response.toJson()));
  void send(Serializable object) => (add(jsonEncode(object.toJson())));
}
