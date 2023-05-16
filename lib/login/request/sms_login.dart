import '../../network/request/request.dart';

class SmsLoginRequest extends Request {
  SmsLoginRequest(String code, String phone)
      : super.create(command: "sms_login", data: {
          "code": code,
          "phone": phone,
        });
}
