import 'package:flutter/material.dart';
import 'App-Parts.dart';
import 'package:more_practice/SuccessPage.dart';

class PracticePage extends StatefulWidget {
  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {

  bool singleView=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),),
          Container(child: singleView?SingleItem():MyGrid(),),
          Align(alignment:Alignment(0,-0.9),
              child: Row(children: <Widget>[
                Container(
                  child: IconButton(icon: Icon(Icons.arrow_back), iconSize: 56,color: Colors.white,
                      onPressed: (){
                        Navigator.of(context).pop();
                      }),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF03A9F4).withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: IconButton(icon: Icon(singleView?Icons.dashboard:Icons.image), iconSize: 56,color: Colors.white, onPressed: (){setState(() {
                    singleView=!singleView;
                  });}),
                  decoration: BoxDecoration(
                    color: Color(0xFF03A9F4),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF03A9F4).withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                )
              ],
                mainAxisSize: MainAxisSize.min,
              )),
        ],
      ),
    );
  }
}

//singleView?SingleItem():MyGrid()