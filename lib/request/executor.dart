import 'package:meta/meta.dart';
import 'package:models/request/request.dart';
import 'package:models/refuse.dart';

/// 服务端使用，定义了处理某种Request的方式
///
/// 如果执行没有问题，并且不需要返回任何数据，那么只需要服务器滴一下就可以了
/// 如果遇到问题，那么直接抛出[Refuse]（这会由服务器默认捕捉，然后用它自己的方式返回）
abstract class Executor<T extends Request> {
  final T request;
  Executor(this.request);

  /// 1. 检查输入是否符合格式
  void inputCheck();

  /// 2. 检查是否满足执行条件
  Future prerequisiteCheck();

  /// 3. 执行并返回数据
  Future<dynamic> execute();

  /// 由服务器统一调用，开发者只需要指定前3个function即可
  @protected
  Future<dynamic> run() async {
    inputCheck();
    await prerequisiteCheck();
    final result = await execute();
    return result;
  }
}
