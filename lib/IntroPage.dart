import 'package:flutter/material.dart';
import 'PracticePage.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'SetsPage.dart';

class AppIntro extends StatefulWidget {
  @override
  _AppIntroState createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  Color _color = Colors.black;
  Color button_color = Color(0xFF03A9F4);

  void Player(String sound){
    final player = AudioCache();

    player.play(sound);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/decorated_background.jpg"), fit: BoxFit.fill)),
          ),
          Align(
            alignment: Alignment(0,-0.9),
              child: Text("First 100 \n Hebrew Words",style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center)),
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                ],
              ),
            ),
          ),
          CircularMenu(
            alignment: Alignment.center,
            backgroundWidget: Center(
            ),
            toggleButtonColor: Color(0xFF512DA8),
            toggleButtonSize: 56,
            items: [
              CircularMenuItem(
                  icon: FontAwesome.graduation_cap,
                  color: button_color,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PracticePage()),
                    );
                  }),
              CircularMenuItem(
                iconSize: 43,
                  icon: FontAwesome.play_circle,
                  color: Colors.lightGreenAccent,
                  onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SetsPage()),
                  );
                  }),
              CircularMenuItem(
                  icon: FontAwesome.times_circle,
                  color: Colors.red,
                  onTap: () => exit(0)),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatefulWidget {

  final VoidCallback onPressed;
  final String image;
  ActionButton({@required this.image, @required this.onPressed});

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(widget.image))
        ),
      ),
      onPressed: widget.onPressed,
    );
  }
}



