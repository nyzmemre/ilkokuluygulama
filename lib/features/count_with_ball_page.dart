/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilkokuluygulama/product/utility/widgets/my_scaffold.dart';

class CountWithBallPage extends StatelessWidget {
  const CountWithBallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container(
              width: MediaQuery.of(context).size.width*.5,
              height: MediaQuery.of(context).size.height/7,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),
              child: GridView.builder(
                itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                  itemBuilder: (context, int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Draggable<int>(
                      data: index,
                      child: SizedBox(
                        width: 10,
                        height: 10,
                        child: CircleAvatar(
                          child: Text('${index+1}'),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    feedback: CircleAvatar(
                      child: Text('${index+1}'),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    childWhenDragging: Container(
                      width: 10,
                      height: 10,
                    ),),
                );
              }),
            ),
          Divider(),
          DragTarget(builder: (context, candData, rejectData){
            return Container(
              width: MediaQuery.of(context).size.width*.5,
              height: MediaQuery.of(context).size.height/7,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),
              child:  GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                  itemBuilder: (context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Draggable<int>(
                        data: index,
                        child: SizedBox(
                          width: 10,
                          height: 10,
                          child: CircleAvatar(
                            child: Text('${index+1}'),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        feedback: CircleAvatar(
                          child: Text('${index+1}'),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        childWhenDragging: Container(
                          width: 10,
                          height: 10,
                        ),),
                    );
                  }),
            );
          })

        ],
      ),
    ));
  }
}
*/
import 'dart:math';

import 'package:flutter/material.dart';


class MyDragAndDropExample extends StatefulWidget {
  @override
  _MyDragAndDropExampleState createState() => _MyDragAndDropExampleState();
}

class _MyDragAndDropExampleState extends State<MyDragAndDropExample> {
  bool isVisible=false;
  String result='DOĞRU';
  List<Widget> circles = List.generate(20, (index) => CircleWidget());
  int num1=Random().nextInt(21);

  List<Widget> droppedCircles = [];


  @override
  void initState() {
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int num2=Random().nextInt(20-num1);


    return Scaffold(
      appBar: AppBar(
        title: Text('Drag and Drop Example'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Sürüklenebilir dairelerin bulunduğu container
            Container(
              child: GridView.builder(
                shrinkWrap: true,
                  itemCount: circles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                    crossAxisSpacing:0,
                    childAspectRatio: 1,), itemBuilder: (context, int index){
                return circles[index];
              })/*ListView(
                scrollDirection: Axis.horizontal,
                children: circles,
              ),*/
            ),
            SizedBox(height: 20),
            (isVisible) ? Text(result, style: TextStyle(fontSize: 30),) : SizedBox(),

            // Bırakma alanı container'ı
            Row(
              children: [
                Container(
                  height: 300,
                  width: 150,
                  color: Colors.grey[200],
                  child: DragTarget(
                    onAccept: (CircleWidget circle) {
                      setState(() {
                        droppedCircles.add(circle);
                      });
                    },
                    builder: (context, List<CircleWidget?> candidateData, rejectedData) {
                      return (droppedCircles.isNotEmpty) ? GridView.builder(
                          itemCount: droppedCircles.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: (droppedCircles.length>5) ? 5 : droppedCircles.length), itemBuilder: (context, int index){
                        return droppedCircles[index];
                      }) : SizedBox();
                    },

                  ),
                ),
                Text('?', style: TextStyle(fontSize: 30),),

              ],
            ),
            Text(num1.toString(), style: TextStyle(fontSize: 30),),
            Text('${num1 + num2}', style: TextStyle(fontSize: 30),),
            ElevatedButton(onPressed: (){
              if(num2==droppedCircles.length){
                setState(() {
                  isVisible=true;
                });
              }else {
                setState(() {
                  result='YANLIŞ';
                  isVisible=true;
                });
              }
            }, child: Text('Kontrol Et')),
            ElevatedButton(onPressed: (){
              refreshNumbers();
            }, child: Text('Yeni Soru'))

          ],
        ),
      ),
    );
  }
  void refreshNumbers() {
    setState(() {
      num1 = Random().nextInt(21);
      droppedCircles.clear();
      isVisible = false;
      result = 'DOĞRU';
    });
  }
}

class CircleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: CircleWidget(),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        margin: EdgeInsets.all(10),
      ),
      feedback: Container(
        width: 10, // farklı bir boyut kullanabilirsiniz
        height: 10, // farklı bir boyut kullanabilirsiniz
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        margin: EdgeInsets.all(8),
      ),

    );
  }
}
