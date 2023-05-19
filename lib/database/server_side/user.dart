import 'package:models/business/business.dart';
import 'package:models/database/mongo_dao.dart';
import 'package:tools/json.dart';

class Users extends MongoDAO<User> {
  Users(super.collection);

  @override
  User Function(Json json) get unserialize => User.fromJson;
}
