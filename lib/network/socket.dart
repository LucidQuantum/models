import 'dart:convert';
import 'dart:io';

import 'package:models/network/request/request.dart';
import 'package:models/network/response/response.dart';

extension SendMessageExtension on WebSocket {
  void sendRequest(Request request) => add(jsonEncode(request.toJson()));
  void sendResponse(Response response) => add(jsonEncode(response.toJson()));
}
