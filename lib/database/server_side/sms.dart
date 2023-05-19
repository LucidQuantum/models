import 'package:models/database/mongo_dao.dart';
import 'package:models/login/sms/sms.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:tools/error_handling/app_error.dart';
import 'package:tools/json.dart';

class Smses extends MongoDAO<Sms> {
  Smses(super.collection);

  @override
  Sms Function(Json json) get unserialize => Sms.fromJson;

  /// 只有最新的验证码才有用，其他其实都算失效了
  Future<Sms?> findLast(String phone) async {
    // 最新的放在最前面
    final selector =
        where.eq('phone', phone).sortBy("createAt", descending: true);
    Json? result = await collection.findOne(selector);

    if (result != null) {
      return Sms.fromJson(result);
    } else {
      return null;
    }
  }

  Future<Sms> findLastOrRefuse(String phone) async {
    Sms? sms = await findLast(phone);
    if (sms == null) throw AppError("数据库中没有验证码，请先发送验证码");
    return sms;
  }

  /// 统计今天发送的短信数量
  Future<int> countToday(String phone) async {
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day);
    DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    final selector = where
        .eq("phone", phone)
        .gte('create_at', startOfDay.toIso8601String())
        .lte('create_at', endOfDay.toIso8601String());

    int count = await collection.count(selector);

    return count;
  }

  /// 清理过期的验证码
  Future cleanExpired() async {
    DateTime now = DateTime.now();
    SelectorBuilder selector = where.lte(
        'create_at', now.subtract(Duration(days: 1)).toIso8601String());
    await collection.remove(selector);
  }
}
