import '../../request/request.dart';
import '../checker/phone.dart';

class SendSmsRequest extends Request {
  final ValidPhone phone;

  SendSmsRequest(this.phone)
      : super.create(
          RequestType.sendSms,
          data: {"phone": phone.value},
        );
}
