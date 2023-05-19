import 'package:meta/meta.dart';
import 'package:models/business/business.dart';
import 'package:models/network/network.dart';
import 'package:tools/error_handling/app_error.dart';

/// 服务端使用，定义了处理某种Request的方式
///
/// 如果执行没有问题，并且不需要返回任何数据，那么只需要服务器滴一下就可以了
/// 如果遇到问题，那么直接抛出[Refuse]（这会由服务器默认捕捉，然后用它自己的方式返回）
abstract class Command {
  final Request request;
  final Client client;

  Command(this.client, this.request);

  bool get requireLogin;
  User get user {
    if (!requireLogin) throw AppError("开发错误：在没有要求登录的Command中请求用户信息");
    return client.user!;
  }

  /// 检查输入是否符合格式
  void inputCheck();

  /// 检查是否满足执行条件
  Future prerequisiteCheck();

  /// 执行并返回数据
  Future<Response> execute();

  /// 由服务器统一调用，开发者只需要指定前3个function即可
  @protected
  Future<Response> run() async {
    if (requireLogin && client.user == null) {
      return Response.refuse("请先登录");
    }

    inputCheck();
    await prerequisiteCheck();
    final result = await execute();
    return result;
  }
}
