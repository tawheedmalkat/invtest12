import 'dart:convert';
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
          'token':token,
        },
      );

      var responseData = json.decode(response.body);
      isLoading.value = false;
      print('${responseData[0]['url']}');
      update();
      return responseData[0]['url'];
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
