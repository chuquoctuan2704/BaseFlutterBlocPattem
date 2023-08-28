import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'userId')
  int? userId;

  @JsonKey(name: 'jwt')
  String? jwt;

  @JsonKey(name: 'expiresIn')
  int? expiresIn;

  LoginResponse({this.userId, this.jwt, this.expiresIn});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
