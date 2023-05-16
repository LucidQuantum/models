import '../../request/request.dart';

class SendSmsRequest extends Request {
  SendSmsRequest(String phone)
      : super.create(
          RequestType.sendSms,
          data: {"phone": phone},
        );
}
