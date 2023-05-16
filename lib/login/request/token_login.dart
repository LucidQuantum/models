import 'package:models/request/request.dart';

class TokenLoginRequest extends Request {
  final String token;
  TokenLoginRequest(this.token)
      : super.create(
          RequestType.tokenLogin,
          data: {"token": token},
        );
}
