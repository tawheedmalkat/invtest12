//import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// import 'package:get/get.dart';
//
// import '../../Controller/Auth/page-pdf.dart';
//
// class PdfPage extends StatefulWidget {
//   @override
//   State<PdfPage> createState() => _PdfPageState();
// }
//
// class _PdfPageState extends State<PdfPage> {
//   int _pageNumber = 1;
//   RxBool isLoading = false.obs;
//   late Uint8List _pdfBytes;
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(PdfDataControllerImp());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: Center(
//         child: Obx(
//               () => isLoading.value
//               ? CircularProgressIndicator()
//               : PDF().cachedFromUrl(
//             'https://dev.invoport.lu/ftp/First-structure.pdf',
//             placeholder: (progress) =>
//                 Center(child: Text('$progress %')),
//             errorWidget: (error) =>
//                 Center(child: Text(error.toString())),
//
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import '../../Controller/Auth/page-pdf.dart';

class PdfPage extends StatefulWidget {
  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  RxBool isLoading = false.obs;
  late Uint8List _pdfBytes;

  @override
  Widget build(BuildContext context) {
    Get.put(PdfDataControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Center(
        child: Obx(
              () => isLoading.value
              ? CircularProgressIndicator()
              : PDF().cachedFromUrl(
                "https://dev.invoport.lu/ftp/First-structure.pdf",

            placeholder: (progress) =>
                Center(child: Text('$progress %')),
            errorWidget: (error) =>
                Center(child: Text(error.toString())),
          ),
        ),
      ),
    );
  }
}
