
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserModel {
  int? entityId;
  String? entityName;

  UserModel({this.entityId, this.entityName});

  UserModel.fromJson(Map<String, dynamic> json) {
    entityId = json['entity_id'];
    entityName = json['entity_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['entity_id'] = this.entityId;
    data['entity_name'] = this.entityName;
    return data;
  }
}

