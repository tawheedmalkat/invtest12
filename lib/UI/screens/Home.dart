import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoportapp/controller/Home/HomeController.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final webviewcontroller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://invoport.com/'));



  Future<void> _refreshWebView() async {
    await webviewcontroller.reload();
    webviewcontroller.scrollTo(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Add a refresh icon to the AppBar
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Call the refresh function when the icon is pressed
              _refreshWebView();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshWebView,
        child: WebViewWidget(
          controller: webviewcontroller,
        ),
      ),
    );
  }
}
