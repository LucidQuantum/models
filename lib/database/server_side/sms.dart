import 'package:models/database/mongo_dao.dart';
import 'package:models/login/sms/sms.dart';
import 'package:tools/json.dart';

class Smses extends MongoDAO<Sms> {
  Smses(super.collection);

  @override
  Sms Function(Json json) get unserialize => Sms.fromJson;
}
