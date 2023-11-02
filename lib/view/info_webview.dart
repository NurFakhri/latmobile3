import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InfoWebView extends StatefulWidget {
  const InfoWebView({super.key});

  @override
  State<InfoWebView> createState() => _InfoWebViewState();
}

class _InfoWebViewState extends State<InfoWebView> {
  WebViewController controller = WebViewController();

  void initState() {
    controller.loadRequest(Uri.parse('https://flutter.dev/'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info Dev"),
        actions: [],
        backgroundColor: Color.fromARGB(255, 252, 147, 77),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

/*class InfoWebView extends StatelessWidget {
  const InfoWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info WebView"),
      ),
      body: WebView(
        initialUrl: "https://www.example.com",
        JavaScriptMode: JavaScriptMode.unrestricted,
      ),
    );
  }
}*/
