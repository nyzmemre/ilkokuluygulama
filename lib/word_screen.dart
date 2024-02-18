import 'package:flutter/material.dart';

class WordScreen extends StatefulWidget {
  @override
  _WordScreenState createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
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
  double _duration=3;
  bool _isStart=false;


  @override
  void initState() {
    super.initState();
  }

  void _startAnimation() async {
    print(_duration.toStringAsFixed(3).replaceAll('.', ''));
    while (_currentIndex < words.length) {
      await Future.delayed(Duration(milliseconds: int.parse(_duration.toStringAsFixed(3).replaceAll('.', ''))));
      setState(() {
        _currentIndex++;
      });
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
          ElevatedButton(onPressed:(!_isStart) ? (){
            _startAnimation();
            _isStart=!_isStart;
          } : (){

            setState(() {
              _currentIndex=1;
              _startAnimation();
            });
          }
          , child: (!_isStart) ? Text('Başla') : Text('Tekrar Başlat')),
          Expanded(flex:1, child:  Slider(
            value: _value,
            onChanged: (newValue) {
              setState(() {
                _value = newValue;
                _duration = 3-newValue;
              });

            },
            min: 0.0,
            max: 3.0

          ),
          ),
        ],
      ),
    );
  }
}