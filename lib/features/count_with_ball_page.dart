
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ilkokuluygulama/product/utility/widgets/my_scaffold.dart';

class CountWithBallPage extends StatelessWidget {
   CountWithBallPage({Key? key}) : super(key: key);

  int rakam=5;
List<int> indexRast=[0,1,2,3,4,5,6,7,8,9,10,11,12];

  @override
  Widget build(BuildContext context) {
    int index=Random().nextInt(21);
    (index==0) ? index=1 : index=index;
    int second=Random().nextInt(21);
    return MyScaffold(child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width-40,
            height: 300,//(index<7) ? index*50 : index*20,
            child: GridView.builder(
              shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                itemCount: index,
                itemBuilder: (context, int index){
              return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 20,
                      height: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  );
            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (index>7) ? 7 : index),),
          ),
          Text(index.toString()),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(height: 200, width: 200, color: Colors.grey.shade200,

                child: Stack(
                  children: [
                    Positioned(

                        child: ListView.builder(
                      itemCount:index,
                      itemBuilder: (context, int index) {
                        return SizedBox(
                            width: 20,
                            child: CircleAvatar());
                      },
                    ))
                  ],
                ),)),
          SizedBox(height: 20,),
          Text(second.toString()),

        ],
      ),
    ));
  }
}

