import 'package:models/json.dart';

abstract class Command {
  final String name;
  final Json? data;

  Command(this.name, {this.data});

  Future execute();
}
