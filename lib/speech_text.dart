import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;


class SpeechText extends StatefulWidget {
  @override
  _SpeechTextState createState() => _SpeechTextState();
}

class _SpeechTextState extends State<SpeechText> {
  final List<String> words = [
    "Başla Butonuna Tıkla",
    "Benim",
    "Enes",
    "adında",
    "kardeşim",
    "var.",
    "Benim",
    "Esra",
    "adında",
    "annem",
    "var.",
    "Benim",
    "adım",
    "Eymen.",
    "Ben",
    "hızlı",
    "okumak",
    "için",
    "bunu",
    "okudum.",
    "Bunu",
    "bana",
    "babam",
    "yazdı.",
  ];
  int _currentIndex = 0;
  double _value = 0;
  double _duration = 3;
  bool _isStart = false;

  stt.SpeechToText? _speech;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _initSpeechState() async {
    if(_speech!=null) {
    await _speech!.initialize();

    }
  }

  void _startAnimation() async {
    print(_duration.toStringAsFixed(3).replaceAll('.', ''));
    while (_currentIndex < words.length) {
      await Future.delayed(Duration(milliseconds: int.parse(_duration.toStringAsFixed(3).replaceAll('.', ''))));
      setState(() {
        _currentIndex++;
      });
      // Speech to text
      if (_currentIndex < words.length) {
        await _listenForWords(words[_currentIndex]);
      }
    }
  }

  Future<void> _listenForWords(String word) async {
    if (!_isStart) return;
if(_speech!=null) {
  if (!_speech!.isListening) {
    await _speech!.listen(
      onResult: (result) {
        if (result.finalResult) {
          String spokenWord = result.recognizedWords;
          if (spokenWord.toLowerCase() == word.toLowerCase()) {
            // Doğru kelimeyi tanımla
            // Burada yapılacak işlemler
          } else {
            // Yanlış kelimeyi tanımla
            // Burada yapılacak işlemler
          }
        }
      },
    );
  }
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Words Animation'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: _currentIndex < words.length
                  ? Text(
                words[_currentIndex],
                style: TextStyle(fontSize: 24),
              )
                  : Text("Bitti"),
            ),
          ),
          ElevatedButton(
            onPressed: (!_isStart)
                ? () async {
               _initSpeechState();
              await _listenForWords(words[_currentIndex]);

            setState(() {
                _startAnimation();
                _isStart = true;
              });
            }
                : null,
            child: (!_isStart) ? Text('Başla') : Text('Tekrar Başlat'),
          ),
          Expanded(
            flex: 1,
            child: Slider(
              value: _value,
              onChanged: (!_isStart)
                  ? (newValue) {
                setState(() {
                  _value = newValue;
                  _duration = 3 - newValue;
                });
              }
                  : null,
              min: 0.0,
              max: 3.0,
            ),
          ),
        ],
      ),
    );
  }
}
