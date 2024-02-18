import 'package:flutter/material.dart';
import 'package:ilkokuluygulama/word_screen.dart';

class ReadView extends StatelessWidget {
  const ReadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>WordScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
            margin: EdgeInsets.all(20),
            child: Text('Oku'),
          ),
        ),
      ),
    );
  }
}
