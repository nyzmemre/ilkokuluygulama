import 'package:flutter/material.dart';
import 'package:ilkokuluygulama/product/utility/lists/read_lists.dart';
import 'package:ilkokuluygulama/word_screen.dart';

class ReadView extends StatelessWidget {
  const ReadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Okuma Hızlandırma'),),
      body: ListView.builder(
          itemCount: ReadLists.allList.length,
          itemBuilder: (context, int index){
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>WordScreen(list: ReadLists.allList[index])));
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              margin: EdgeInsets.all(10),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Metin ${index+1}',),
              )),
            ),
          ),
        );
      })
    );
  }
}
