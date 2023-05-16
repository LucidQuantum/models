import 'package:models/Refuse.dart';
import 'package:models/format_checker.dart';

class ValidPhone extends FormatChecker<String> {
  ValidPhone(super.value);

  @override
  check() {
    final RegExp pattern = RegExp(r'^1\d{10}$');
    if (!pattern.hasMatch(value)) throw Refuse("错误的手机号格式，手机号应为11位的纯数字，并以1开头");
  }
}
