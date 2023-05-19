import 'package:models/business/business.dart';
import 'package:models/database/mongo_dao.dart';
import 'package:tools/json.dart';

class Targets extends MongoDAO<Target> {
  Targets(super.collection);

  @override
  Target Function(Json json) get unserialize => Target.fromJson;
}
