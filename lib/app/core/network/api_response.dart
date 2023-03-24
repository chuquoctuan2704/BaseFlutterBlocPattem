import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? messages;

  @JsonKey(name: 'data')
  T? data;

  ApiResponse({this.status, this.messages, this.data});

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(T Function(Object? json) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
