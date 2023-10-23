import 'dart:convert';

class RegisterResponseModel {
  final String message;
  final Data? data;

  RegisterResponseModel({
    required this.message,
    this.data, // Make data nullable
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  static RegisterResponseModel fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return RegisterResponseModel.fromJson(json);
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
