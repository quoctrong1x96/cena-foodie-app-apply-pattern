import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CenaWebViewWidget extends StatefulWidget {
  final String url;
  const CenaWebViewWidget({Key? key, required this.url}) : super(key: key);

  @override
  State<CenaWebViewWidget> createState() => _CenaWebViewWidgetState();
}

class _CenaWebViewWidgetState extends State<CenaWebViewWidget> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    // #doc region webview_controller
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String urls) {},
          onPageFinished: (String urls) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    // #end doc region webview_controller
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
