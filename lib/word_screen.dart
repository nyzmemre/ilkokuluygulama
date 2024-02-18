import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_balloon_slider/flutter_balloon_slider.dart';

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
  double _value = 0.5;


  @override
  void initState() {
    super.initState();
  }

  void _startAnimation() async {
    while (_currentIndex < words.length) {
      await Future.delayed(Duration(milliseconds: int.parse(_value.toString()[0])));
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
          Text(_value.toString(), style: TextStyle(fontSize: 50),),
          ElevatedButton(onPressed: (){
            _startAnimation();
          }, child: Text('Başla')),
          Expanded(flex:1, child:  Slider(
            value: _value,
            onChanged: (newValue) {
              setState(() {
                _value = newValue; // Değeri doğrudan atama
              });
            },
            min: 0.2, // Doğru min değer
            max: 7.0, // Doğru max değer
            // Slider'ı tersine çevirmek için ters görünüm oluştur
            semanticFormatterCallback: (double value) {
              return '${10.0 - value}'; // Değeri tersine çevirerek slider'ı ters göster
            },
          ),
          ),
        ],
      ),
    );
  }
}