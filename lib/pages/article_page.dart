import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatelessWidget {
  final String articleUrl;
  const ArticlePage({
    super.key,
    required this.articleUrl,
  });

  @override
  Widget build(BuildContext context) {
    final webViewController = WebViewController();
    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..loadRequest(Uri.parse(articleUrl));

    return SafeArea(
      child: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
