import '../network/request/request.dart';

/// 服务端使用，定义了处理某种Request的方式
abstract class Executor<T extends Request> {
  final T request;
  Executor(this.request);

  Future execute();
}
