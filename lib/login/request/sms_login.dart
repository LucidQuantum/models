import 'package:models/login/checker/phone.dart';
import 'package:models/login/checker/sms.dart';

import '../../request/request.dart';

class SmsLogin extends Request {
  SmsLogin(ValidSms sms, ValidPhone phone)
      : super.create(
          RequestType.smsLogin,
          data: {"sms_code": sms.value, "phone": phone.value},
        );
}
