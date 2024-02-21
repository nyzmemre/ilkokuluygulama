import 'package:flutter/material.dart';
import 'package:ilkokuluygulama/read_view.dart';
import 'package:ilkokuluygulama/substraction_view.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alıştırmalar'),),
      body: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>ReadView()));
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                margin: EdgeInsets.all(10),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Okuma Hızlandırma',),
                )),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SubstractionView()));
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                margin: EdgeInsets.all(10),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Çıkarma',),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
