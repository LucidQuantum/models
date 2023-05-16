abstract class FormatChecker<T> {
  T value;
  FormatChecker(this.value);

  /// 如果有问题，需要直接throw [Refuse]
  check();
}
