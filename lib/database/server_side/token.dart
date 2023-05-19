import 'package:models/database/mongo_dao.dart';
import 'package:models/login/token/token.dart';
import 'package:tools/json.dart';

class Tokens extends MongoDAO<Token> {
  Tokens(super.collection);

  @override
  Token Function(Json json) get unserialize => Token.fromJson;
}
