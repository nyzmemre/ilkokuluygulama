import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilkokuluygulama/animation.dart';

class SubstractionView extends StatefulWidget {
  @override
  _SubstractionViewState createState() => _SubstractionViewState();
}

class _SubstractionViewState extends State<SubstractionView> {
  late int _firstNumber; // 0-20 arasında rasgele bir sayı
  late int _secondNumber;
  int? _correctAnswer;
  TextEditingController _answerController = TextEditingController();
  bool _showResult = false;
  String _resultText = '';


  @override
  void initState() {
    super.initState();
    _firstNumber = Random().nextInt(21);
    if(_firstNumber==0){
      _firstNumber=1;
    }
    _secondNumber = Random().nextInt(_firstNumber);

    _correctAnswer = _firstNumber - _secondNumber;
  }

  void _checkAnswer() {
    setState(() {
      int userAnswer = int.tryParse(_answerController.text) ?? 0; // Kullanıcı cevabını al, null olursa 0 olarak kabul et
      if (userAnswer == _correctAnswer) {
        _resultText = 'Doğru!';
      } else {
        _resultText = 'Yanlış! $_firstNumber yumurtadan $_secondNumber yumurta kırılırsa $_correctAnswer yumurta kalır. Alttaki düğmeye bas!';
      }
      _showResult = true;
    });
    
  }

  void _newQuestion() {
    setState(() {
      _firstNumber = Random().nextInt(21);
      if(_firstNumber==0){
        _firstNumber=1;
      }
      _secondNumber = Random().nextInt(_firstNumber);
      _correctAnswer = _firstNumber - _secondNumber;
      _answerController.clear();
      _showResult = false;
      _resultText = '';
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Çıkarma İşlemi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$_firstNumber - $_secondNumber = ?',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _answerController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Cevabı Girin'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _checkAnswer();
                    },
                    child: Text('Cevabı Kontrol Et'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _newQuestion();
                    },
                    child: Text('Yeni Soru'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (_showResult)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _resultText,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    MyImageSwitcher(total: _firstNumber, kalan: _secondNumber, ),


                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }
}
