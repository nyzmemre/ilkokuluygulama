import 'package:flutter/material.dart';
import 'package:ilkokuluygulama/features/count_with_ball_page.dart';
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
          page_button(context,ReadView() ,'Okuma Hızlandırma'),
          page_button(context,SubstractionView() ,'Çıkarma'),
          page_button(context,CountWithBallPage() ,'Toplama'),

        ],
      ),
    );
  }

  InkWell page_button(BuildContext context, Widget widget, String text) {
    return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>widget));
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              margin: EdgeInsets.all(10),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(text),
              )),
            ),
          ),
        );
  }
}
