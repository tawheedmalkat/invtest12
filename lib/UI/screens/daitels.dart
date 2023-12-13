import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserModel extends GetxController {
  var entityId = ''.obs;
  var entityName = ''.obs;

  UserModel({required this.entityId, required this.entityName});
}

class DetaliesPage extends StatelessWidget {
  final UserModel userModel;

  DetaliesPage( this.userModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserModel>(
        init: userModel,
        builder: (userModel) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Entity ID: ${userModel.entityId}'),
              Text('Entity Name: ${userModel.entityName}'),
            ],
          );
        },
      ),
    );
  }
}
