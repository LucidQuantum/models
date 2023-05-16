import '../../request/request.dart';

class SmsLogin extends Request {
  SmsLogin(String code, String phone)
      : super.create(
          RequestType.smsLogin,
          data: {"sms_code": code, "phone": phone},
        );
}
