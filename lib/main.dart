import 'package:englishtyping/screens/screenPlay.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      title: "home",
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("start"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: const Text("英単語タイピング",
              style: TextStyle(
                fontSize: 40,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: ElevatedButton(
                  onPressed: () {
                    List<String> words= wordsAcquisition();
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ScreenPlay(words: words);
                }));
              }, child: Text("Start")),
            )
          ],
        ),
      ),
    );
  }
}


List<String> wordsAcquisition() {
  List<String> words = [];
  for (int i = 0; i < 5; i++) {
    String randomWord = nouns[Random().nextInt(nouns.length)];
        words.add(randomWord);
  }
  print(words);
  return(words);
}