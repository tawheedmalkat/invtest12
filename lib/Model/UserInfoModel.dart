import 'dart:convert';
import 'package:http/http.dart' as http;

class UserInfoModel {
  int? userId;
  String? userEmail;
  int? userLevel;
  int? promoterId;
  String? start_date;
  int? pass_status;
  int? user_status;
  int? client;

  UserInfoModel({this.userId, this.userEmail, this.userLevel, this.promoterId});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userEmail = json['email'];
    userLevel = json['user_level'];
    promoterId = json['promoter_id'];
    start_date = json['start_date'];
    pass_status = json['pass_status'];
    user_status = json['user_status'];
    client = json['client'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.userEmail;
    data['user_level'] = this.userLevel;
    data['promoter_id'] = this.promoterId;
    data['start_date'] = this.start_date;
    data['pass_status'] = this.start_date;
    data['user_status'] = this.start_date;
    data['client'] = this.start_date;

    return data;
  }

  // Helper method to create a UserModel from the response.
  factory UserInfoModel.fromResponse(Map<String, dynamic> responseData) {
    return UserInfoModel.fromJson(responseData['user']);
  }
}