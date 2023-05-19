import 'package:models/business/business.dart';
import 'package:models/database/mongo_dao.dart';
import 'package:tools/json.dart';

class Users extends MongoDAO<User> {
  Users(super.collection);

  @override
  User Function(Json json) get unserialize => User.fromJson;

  Future<User> findOrCreate(String phone) async {
    User? user = await findOne({"phone": phone});
    if (user == null) {
      user = User.create(phone);
      await insert(user);
    }

    return user;
  }
}
