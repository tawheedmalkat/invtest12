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
import '../../main.dart';

class PdfPage extends StatelessWidget {
  final String url;

  PdfPage({required this.url});

  @override
  Widget build(BuildContext context) {
    Get.put(PdfDataControllerImp());

    return GetBuilder<PdfDataControllerImp>(
      builder: (controller) =>
          Scaffold(
            appBar: AppBar(
              title: Text('PDF Viewer'),
              actions: [
                IconButton(
                  onPressed: () async {
                    print('${sharedPref!.getString('url')}');
                    await controller.deletepdf(context,
                        '${sharedPref!.getString('url')}');
                  },
                  icon: Icon(Icons.delete_outline),
                ),
              ],
            ),
            body: Center(
              child: Obx(
                    () {
                  if (controller.isLoading.value) {
                    return CircularProgressIndicator();
                  } else {
                    return PDF().cachedFromUrl(
                      url,
                      placeholder: (progress) =>
                          Center(child: Text('$progress %')),
                      errorWidget: (error) =>
                          Center(child: Text(error.toString())),
                    );
                  }
                },
              ),
            ),
          ),
    );
  }
}
