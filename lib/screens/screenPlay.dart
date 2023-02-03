import 'package:englishtyping/screens/screenFinish.dart';
import 'package:flutter/material.dart';

class ScreenPlay extends StatefulWidget {
  List<String> words;

  ScreenPlay({Key? key, required this.words}) : super(key: key);

  @override
  State<ScreenPlay> createState() => _ScreenPlayState();
}

class _ScreenPlayState extends State<ScreenPlay> {

  String _inputText = "";
  String word = "";
  int i = 0;
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (word != widget.words[i]) {
      word = widget.words[i];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("play!"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Text(word,
            style: TextStyle(
              fontSize: 50,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: TextField(
              controller: _textController,
              onChanged: (value) {
                setState(() {
                  _inputText = value;
                  if (word == _inputText) {
                    if (i < widget.words.length - 1) {
                      i++;
                      _textController.clear();
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ScreenFinish(words: widget.words);
                      }));
                    }
                  }
                });
                // print(_inputText);

              },
            ),
          ),
        ],
      ),
    );
  }
}


String getWord (int i, List<String> words, String _inputText) {
  String word = words[i];
  print(word);
  return word;
}



