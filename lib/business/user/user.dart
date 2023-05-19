import 'package:json_annotation/json_annotation.dart';
import 'package:models/database/document.dart';
import 'package:models/business/business.dart';
import 'package:tools/json.dart';
import 'package:tools/generator.dart';

part 'user.g.dart';

@JsonSerializable()
class User implements Document {
  final String id;
  String phone;
  CurrentTarget? currentTarget;

  User({
    required this.id,
    required this.phone,
    required this.currentTarget,
  });

  factory User.fromJson(Json json) => _$UserFromJson(json);
  Json toJson() => _$UserToJson(this);

  factory User.create(String phone) => User(
        id: Generator.id(),
        phone: phone,
        currentTarget: null,
      );

  @override
  late Map<String, dynamic> finder = {"id": id};
}
