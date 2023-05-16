import '../../request/request.dart';

class SmsLogin extends Request {
  final String sms;
  final String phone;

  SmsLogin(this.sms, this.phone)
      : super.create(
          RequestType.smsLogin,
          data: {"sms_code": sms, "phone": phone},
        );
}
