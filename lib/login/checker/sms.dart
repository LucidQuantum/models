import 'package:models/Refuse.dart';
import '../../format_checker.dart';

class ValidSms extends FormatChecker<String> {
  ValidSms(super.value);

  @override
  check() {
    final RegExp pattern = RegExp(r'^\d{4}$');
    if (!pattern.hasMatch(value)) throw Refuse("错误的短信验证码格式，应为4位数字");
  }
}
