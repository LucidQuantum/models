import '../../network/request/request.dart';

class SmsLogin extends Request {
  SmsLogin(String code, String phone)
      : super.create(command: "sms_login", data: {
          "code": code,
          "phone": phone,
        });
}
