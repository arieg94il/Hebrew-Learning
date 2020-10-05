import 'package:flutter/material.dart';
import 'IntroPage.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:more_practice/Sets/FruitGame.dart';
import 'package:more_practice/Sets/Vegetables.dart';
import 'package:more_practice/Sets/Food.dart';
import 'package:more_practice/Sets/DessertGame.dart';
import 'package:more_practice/Sets/GardenGame.dart';
import 'package:more_practice/Sets/ClothingGame.dart';
import 'package:more_practice/Sets/FinalChallengeGame.dart';

class SetsPage extends StatefulWidget {
  @override
  _SetsPageState createState() => _SetsPageState();
}

class _SetsPageState extends State<SetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: MaterialButton(
              child: Container(height: 50, width: 50,
                decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 8),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [BoxShadow(color: Colors.red,
                      spreadRadius: 5,
                      blurRadius: 7,)
                    ]
                ),
                child: Icon(Icons.arrow_back, color: Colors.black,),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppIntro()),
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Game Sets",style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
              SizedBox(height: 75),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SetButton(icon: Icons.art_track,color: Color(0xFF03A9F4), label: "SET 1", onPress: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FruitGame()),
                      );
                    },),
                    SizedBox(width: 25),
                    SetButton(icon: Icons.art_track,color: Color(0xFF03A9F4), label: "SET 2", onPress: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Vegetables()),
                      );
                    },),
                    SizedBox(width: 25),
                    SetButton(icon: Icons.art_track,color: Color(0xFF03A9F4), label: "SET 3", onPress: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DessertGame()),
                      );
                    },),
                  ],
                ),
              ),
              SizedBox(height: 65),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SetButton(icon: Icons.art_track,color: Color(0xFF03A9F4), label: "SET 4", onPress: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GardenGame()),
                      );
                    },),
                    SizedBox(width: 25),
                    SetButton(icon: Icons.art_track,color: Color(0xFF03A9F4), label: "SET 5", onPress: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClothingGame()),
                      );
                    },),
                    SizedBox(width: 25),
                    SetButton(icon: Icons.art_track,color: Color(0xFF03A9F4), label: "SET 6", onPress: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodGame()),
                      );
                    },),
                  ],
                ),
              ),
              SizedBox(height: 50),
              SetButton(icon: FontAwesome.fire,size: 75,color: Color(0xFFF44336),label: "Final Challenge", onPress: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FinalChallenge()),
                );
              },),
            ],
          ),

        ],
      ),
    );
  }
}

class SetButton extends StatefulWidget {

  IconData icon;
  String label;
  VoidCallback onPress;
  double size;
  Color color;
  SetButton({this.icon=Icons.arrow_back, this.label="label", this.onPress, this.size=56, this.color});
  @override
  _SetButtonState createState() => _SetButtonState();
}

class _SetButtonState extends State<SetButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: IconButton(icon: Icon(widget.icon), iconSize: widget.size,color: Colors.white,
                onPressed: widget.onPress),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          Text("${widget.label}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center)
        ],
      ),
    );
  }
}

