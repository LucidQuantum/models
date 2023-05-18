import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/error_handling/app_error.dart';
import 'package:tools/generator.dart';
import 'package:tools/json.dart';

import '../../database/document.dart';

part 'token.g.dart';

@JsonSerializable()
class Token implements Document {
  final String deviceId;
  final String userId;
  final String token;

  Token({
    required this.deviceId,
    required this.userId,
    required this.token,
  });

  Json toJson() => _$TokenToJson(this);
  factory Token.fromJson(Json json) => _$TokenFromJson(json);

  factory Token.create(String userId) {
    // 创建一个设备id
    final deviceId = Generator.id();
    // 生成加密的token
    final claimSet = JwtClaim(
        issuer: "bitotus.com",
        subject: userId,
        issuedAt: DateTime.now(),
        maxAge: Duration(days: 30),
        otherClaims: <String, dynamic>{
          'device_id': deviceId,
        });
    final token = issueJwtHS256(claimSet, _secret);

    return Token(deviceId: deviceId, userId: userId, token: token);
  }

  factory Token.parseWithVerify(String token) {
    try {
      final decClaimSet = verifyJwtHS256Signature(token, _secret);

      final userId = decClaimSet.subject!;
      final deviceId = decClaimSet['device_id']!;
      return Token(deviceId: deviceId, userId: userId, token: token);
    } on JwtException catch (e) {
      // 捕获JwtException
      if (e.message.contains("expired")) {
        // 检查异常消息是否包含"expired"
        throw AppError("token已过期");
      }
      throw AppError("token检验失败，请重新登录");
    } catch (e) {
      throw AppError("token检验失败，请重新登录");
    }
  }

  @override
  late Map<String, dynamic> finder = {"token": token};
}

const _secret = "酸性量子2022, 浙江金华";
