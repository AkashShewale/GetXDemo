import 'dart:convert';

LoginResponce loginResponceFromJson(String str) => LoginResponce.fromJson(json.decode(str));

class LoginResponce {

  LoginResponce({
    this.status,
    this.message,
  });

  int status;
  String message;

  factory LoginResponce.fromJson(Map<String, dynamic> json) => LoginResponce(
    status: json["status"],
    message: json["message"],
  );
}