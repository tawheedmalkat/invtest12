import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';


class PDFViewerPage extends StatefulWidget {
  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PDFViewController _pdfViewController;
  int _pageNumber = 1;
  bool _isLoading = true;
  late Uint8List _pdfBytes;

  @override
  void initState() {
    super.initState();
    _loadTokenAndPDF();
  }

  Future<void> _loadTokenAndPDF() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token != null) {
      final response = await http.get(

        Uri.parse("https://dev.invoport.lu/ftp/First-structure.pdf"),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _pdfBytes = response.bodyBytes;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load PDF');
      }
    } else {
      // Handle the case where the authentication token is not available.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : PDFView(
          filePath: '',
          pdfData: _pdfBytes,

          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: false,
          pageSnap: true,
          onRender: (_pages) {
            setState(() {
              _isLoading = false;
            });
          },
          onError: (error) {
            print(error);
          },
          onPageError: (page, error) {
            print('$page: ${error.toString()}');
          },
          onViewCreated: (PDFViewController pdfViewController) {
            setState(() {
              _pdfViewController = pdfViewController;
            });
          },

        ),
      ),
    );
  }
}