import '../../request/request.dart';

class SendSmsRequest extends Request {
  final String phone;
  SendSmsRequest(this.phone)
      : super.create(
          RequestType.sendSms,
          data: {"phone": phone},
        );
}
