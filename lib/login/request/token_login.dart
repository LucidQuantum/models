import '../../network/request/request.dart';

class TokenLoginRequest extends Request {
  TokenLoginRequest(String token)
      : super.create(
          command: "token_login",
          data: {"token": token},
        );
}
