import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:invoportapp/main.dart';

abstract class PdfDataController extends GetxController {
  Future<String> pdfDataController(String token);
}

class PdfDataControllerImp extends PdfDataController {
  RxBool isLoading = false.obs;

  @override
  Future<String> pdfDataController(String token) async {
    isLoading.value = true;
    update();
    token = sharedPref?.getString('token') ?? '';
    var client = http.Client();
    var url = Uri.parse('https://dev.invoport.lu/api/pdf.php');

    try {
      var response = await client.post(
        url,
        body: {
          'token': token,
        },
      );

      var responseData = json.decode(response.body);
      isLoading.value = false;
      sharedPref?.setString('url', responseData[0]['url']);
      print('${responseData[0]['url']}');
      update();
      return responseData[0]['url'];
    } finally {
      client.close();
    }
  }

  Future<String> deletepdf(BuildContext context, String url) async {
    isLoading.value = true;
    update();
    var client = http.Client();
    var apiurl = Uri.parse('https://dev.invoport.lu/api/delete_pdf.php');

    try {
      var response = await client.post(
        apiurl,
        body: {
          'url': url,
        },
      );

      var responseData = json.decode(response.body);
      isLoading.value = false;
      print('${responseData['message']}');
      responseData['message'] == 'pdf delete succesfully'
          ? ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${responseData['message']}'),
                duration: const Duration(seconds: 2),
              ),
            )
          : SizedBox();
      update();
      return responseData['message'];
    } finally {
      client.close();
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
