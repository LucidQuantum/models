import '../../request/request.dart';
import '../checker/phone.dart';

class SendSmsRequest extends Request {
  SendSmsRequest(ValidPhone phone)
      : super.create(
          RequestType.sendSms,
          data: {"phone": phone.value},
        );
}
