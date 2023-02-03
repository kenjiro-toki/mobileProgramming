import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenFinish extends StatefulWidget {
  final List<String> words;

  ScreenFinish({Key? key, required this.words}) : super(key: key);

  @override
  _ScreenFinishState createState() => _ScreenFinishState();
}

class _ScreenFinishState extends State<ScreenFinish> {
  Future<void>? _launched;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finish!"),
      ),
      body: Column(
        children: [
          for (String word in widget.words)
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, top: 40),
                      child: Text(word,
                      style: TextStyle(
                        fontSize: 25
                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, right: 10),
                    child: IconButton(
                      icon: Icon(Icons.search),
                      tooltip: "Search on weblio",
                      onPressed: () => setState(() {
                        _launched = _launchInWebViewOrVC(word);
                      }),
                    ),
                  ),
                ],
              ),
            ),

          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("home"),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchInWebViewOrVC(String word) async {
    var url = Uri(scheme: 'https', host: 'ejje.weblio.jp', path: 'content/$word');

    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
