import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/UserModel.dart';

abstract class PostDataController extends GetxController {
  postData(String id, String token, BuildContext context);
}

class PostDataControllerImp extends PostDataController {
  late BuildContext context;
  RxBool isLoading = false.obs;
  String selectedValue = 'Select an investment';

  @override
  Future<void> postData(String id, String token, BuildContext context) async {
    isLoading.value = true;
    update();

    var client = http.Client();
    var url = Uri.parse('https://dev.invoport.lu/api/interface.php');

    try {
      var response = await client.post(
        url,
        body: {
          'investor_id': id,
          'token': token,
        },
      );

      var responseData = json.decode(response.body);

      if (responseData is List && responseData.isNotEmpty) {
        List<Map<String, dynamic>> listOfMaps = List<Map<String, dynamic>>.from(responseData[0]);
        List<UserModel> listOfUserModels = listOfMaps.map((map) => UserModel.fromJson(map)).toList();
        listOfUserModels.forEach((userModel) {
          print('Entity ID: ${userModel.entityId}, Entity Name: ${userModel.entityName}');
        });
        isLoading.value = false;
        update();
        print('true');
      } else if (responseData != List) {
        isLoading.value = false;
        update();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid data'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } finally {
      client.close();
    }
  }



  @override
  void onInit() {
    postData;
    super.onInit();
  }

  @override
  void dispose() {
    postData;
    super.dispose();
  }
}
