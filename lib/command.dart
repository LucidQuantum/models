abstract class Command {
  final String name;
  final Map<String, dynamic>? data;

  Command(this.name, {this.data});

  Future execute();
}
