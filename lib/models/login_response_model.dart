import 'dart:convert';

class LoginResponseModel {
  final String message;
  final Data data;

  LoginResponseModel({
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }

  static LoginResponseModel fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return LoginResponseModel.fromJson(json);
  }
}

class Data {
  final String username;
  final String email;
  final String date;
  final int id;

  Data({
    required this.username,
    required this.email,
    required this.date,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      username: json['username'],
      email: json['email'],
      date: json['date'],
      id: json['id'],
    );
  }
}
