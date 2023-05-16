import '../../network/request/request.dart';

class SendSmsRequest extends Request {
  SendSmsRequest(String phone)
      : super.create(command: "send_sms", data: {
          "phone": phone,
        });
}
