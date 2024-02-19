import 'package:flutter/material.dart';
import 'package:ilkokuluygulama/product/utility/constants/text_constants.dart';
import 'package:ilkokuluygulama/product/utility/widgets/button_text_row.dart';

class WordScreen extends StatefulWidget {
  final List<String> list;

  const WordScreen({super.key, required this.list});
  @override
  _WordScreenState createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {

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
    while (_currentIndex < widget.list.length) {
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
        title: const Text(TextConstants.fastReady),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: _currentIndex < widget.list.length
                  ? Text(
                widget.list[_currentIndex],
                style: const TextStyle(fontSize: 24),
              )
                  : const Text(TextConstants.done),
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
          , child: (!_isStart) ? const ButtonTextRow(text: TextConstants.start, icons: Icons.play_arrow)
                  : const ButtonTextRow(text: TextConstants.startAgain, icons: Icons.replay)
          ),
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