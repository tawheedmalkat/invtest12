import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  late WebViewController _webviewController;

  WebViewController get webviewController => _webviewController;

  @override
  void onInit() {
    super.onInit();
    _webviewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://invoport.com/'));
  }

  Future<void> refreshWebView() async {
    // Reload the WebView content
    await _webviewController.reload();

    // Scroll the WebView to the top
    _webviewController.scrollTo(0, 0);
  }
}