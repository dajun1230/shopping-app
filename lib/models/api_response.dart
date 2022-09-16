import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  int code;
  String? msg;
  T data;

  ApiResponse({required this.code, this.msg, required this.data});

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$ApiResponseFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseToJson<T>(this, toJsonT);
}
