import 'package:json_annotation/json_annotation.dart';
import 'package:models/database/document.dart';
import 'package:models/business/business.dart';
import 'package:tools/json.dart';
import 'package:tools/generator.dart';

part 'user.g.dart';

@JsonSerializable()
class User implements TrackableDocument {
  final String id;
  String phone;
  CurrentTarget? currentTarget;
  @override
  DateTime lastModified;

  User({
    required this.id,
    required this.phone,
    required this.currentTarget,
    required this.lastModified,
  });

  factory User.fromJson(Json json) => _$UserFromJson(json);
  Json toJson() => _$UserToJson(this);

  factory User.create(String phone) => User(
        id: Generator.id(),
        phone: phone,
        currentTarget: null,
        lastModified: DateTime.now(),
      );

  @override
  late Map<String, dynamic> finder = {"id": id};
}
