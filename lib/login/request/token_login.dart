import 'package:models/request/request.dart';

class TokenLoginRequest extends Request {
  TokenLoginRequest(String token)
      : super.create(
          RequestType.tokenLogin,
          data: {"token": token},
        );
}
