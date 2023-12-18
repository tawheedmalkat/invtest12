import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/Auth/page-pdf.dart';
class PdfPage extends StatefulWidget {


  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  int _pageNumber = 1;
  RxBool isLoading = false.obs;
  late Uint8List _pdfBytes;
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
