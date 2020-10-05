import 'package:flutter/material.dart';
import 'IntroPage.dart';

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Congratulations!",style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("You finished this game set. \n Are you ready for the next one?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                ],
              ),
              SizedBox(height: 50),
              MaterialButton(
                child: Container(
                  alignment: Alignment.center,
                  height: 90,
                  width: 130,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xFFBDBDBD), width: 8),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [BoxShadow(color: Color(0xFFFFFFFF),
                        spreadRadius: 5,
                        blurRadius: 7,)
                      ]
                  ),
                  child: Text("GO BACK", style: TextStyle(fontSize: 28),textAlign: TextAlign.center,),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppIntro()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

