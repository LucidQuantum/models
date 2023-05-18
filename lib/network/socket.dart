import 'dart:convert';
import 'dart:io';

import 'package:models/database/document.dart';

extension SendMessageExtension on WebSocket {
  void send(Serializable object) => (add(jsonEncode(object.toJson())));
}
