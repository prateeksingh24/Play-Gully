import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Game1 extends StatefulWidget {
  const Game1({super.key});

  @override
  State<Game1> createState() => _Game1State();
}

class _Game1State extends State<Game1> {
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController();

    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.setBackgroundColor(Colors.blue.shade100);
    webViewController.setNavigationDelegate(NavigationDelegate(
      onProgress: (progress) {},
      onPageStarted: (url) {},
      onPageFinished: (url) {},
      onNavigationRequest: (request) async {
        return NavigationDecision.navigate;
      },
    ));
    // webViewController.setOnScrollPositionChange((change)=> change.,)
    webViewController.loadRequest(Uri.parse(
        "https://wipeduck.com/playgully/2048Game_JavaScript/My2048/"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: WebViewWidget(controller: webViewController),
    ));
  }
}
