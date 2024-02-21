import 'package:flutter/material.dart';

class MyImageSwitcher extends StatefulWidget {
  const MyImageSwitcher({Key? key, required this.total, required this.kalan}) : super(key: key);

  @override
  _MyImageSwitcherState createState() => _MyImageSwitcherState();
  final int total;
  final int kalan;
 // final int currentIndex;
}

class _MyImageSwitcherState extends State<MyImageSwitcher> {
int _currentIndex=0;
bool _isClick=true;

  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(onPressed: () {
            _isClick=!_isClick;
            print(_isClick);
            if(!_isClick) {
              setState(() {
                _currentIndex = widget.total - (widget.total - widget.kalan);
              });
            }else {
              setState(() {
                _currentIndex=0;
      
              });
      
            }
      
          },     child: Icon(Icons.swap_horiz),
          ),
          GridView.builder(
            shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: widget.total,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (widget.total>5) ? 5 : widget.total),
              itemBuilder: (context, int index){
            return Column(
              children: [
                AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: _currentIndex > index
                        ? Image.asset('assets/egg_ex.png', key: ValueKey<int>(index))
                        : Image.asset('assets/egg.png', key: ValueKey<int>(index)),
                  ),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
                Text('${widget.total-index}')
              ],
            );
          }),
      
        ],
      ),
    );
  }
}
