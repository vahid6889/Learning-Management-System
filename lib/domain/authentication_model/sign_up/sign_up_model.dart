// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);
import 'dart:convert';

class SignUpModel {
  SignUpModel({
    required this.code,
    required this.data,
    required this.message,
    required this.status,
  });

  final int code;
  final Data data;
  final String message;
  final bool status;

  factory SignUpModel.fromRawJson(String str) =>
      SignUpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        code: json["code"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  Data({
    required this.id,
    required this.userName,
  });

  final String id;
  final String userName;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
      };
}
