import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class PdfDataController extends GetxController {
  Future<void> pdfDataController(String id, String token);
}

class PdfDataControllerImp extends PdfDataController {
  int _pageNumber = 1;
  RxBool isLoading = false.obs;
  late Uint8List _pdfBytes;

  @override
  Future<void> pdfDataController(String id, String token) async {
    isLoading.value = true;
    update();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';

    var client = http.Client();


    try {
      final response = await client.get(
        Uri.parse('https://dev.invoport.lu/api/pdf.php'),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        _pdfBytes = response.bodyBytes;
        isLoading.value = false;
        update();
      } else {
        throw Exception('Failed to load PDF');
      }
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put((PdfDataControllerImp()));
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Center(
        child: Obx(
              () => isLoading.value
              ? CircularProgressIndicator()
              : PDFView(
            filePath: "https://dev.invoport.lu/ftp/First-structure.pdf",
            pdfData: _pdfBytes,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: false,
            pageSnap: true,
            onRender: (_pages) {
              isLoading.value = false;
              update();
            },
            onError: (error) {
              print(error);
            },
            onPageError: (page, error) {
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {},
          ),
        ),
      ),
    );
  }
}
