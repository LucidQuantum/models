import 'package:models/json.dart';
import 'package:models/serializable.dart';

abstract class Command implements Serializable {
  final String name;
  final Json? data;

  Command(this.name, {this.data});

  Future execute();
}
