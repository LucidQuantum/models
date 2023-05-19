import 'package:models/business/business.dart';
import 'package:models/database/mongo_dao.dart';
import 'package:tools/json.dart';

class Dives extends MongoDAO<Dive> {
  Dives(super.collection);

  @override
  Dive Function(Json json) get unserialize => Dive.fromJson;
}
