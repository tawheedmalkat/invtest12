import 'dart:convert';
import 'package:http/http.dart' as http ;
import 'package:flutter/material.dart';
import 'package:get/get.dart';


abstract class PostDataController extends GetxController {
  postData(String id, BuildContext context);
}

class PostDataControllerImp extends PostDataController {
  late BuildContext context;
  RxBool isLoading = false.obs;
  String selectedValue = 'Select an investment';

  @override
  Future<void> postData(String id, BuildContext context) async {
    isLoading.value = true;
    update();

    var apiUrl = Uri.parse('https://dev.invoport.lu/api/interface2.php?account');
    var data = {
      'investor_id': id,
    };

    try {
      var response = await http.post(
        apiUrl,
        body: data,
      );

      var jsonResponse = json.decode(response.body);

      if (jsonResponse['massage'] == "Valid investor Account!") {
        isLoading.value = false;
        update();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonResponse['massage']),
            duration: const Duration(seconds: 2),
          ),
        );
        print(jsonResponse);
      } else {
        isLoading.value = false;
        update();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonResponse['massage']),
            duration: const Duration(seconds: 2),
          ),
        );
        print(" ${response.body}");
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
          duration: const Duration(seconds: 2),
        ),
      );
      print("Error: $error");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
