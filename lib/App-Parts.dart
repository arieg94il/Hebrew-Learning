import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FlashCard extends StatefulWidget {

  String pronounciation;
  String wordImage;
  String herbewWord;
  FlashCard({@required this.pronounciation,@required this.wordImage,@required this.herbewWord});
  @override
  _FlashCardState createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {

  bool checked=false;

  void Player(String sound){
    final player = AudioCache();
    player.play(sound);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlipCard(
          direction: FlipDirection.HORIZONTAL, // default
          front: Container(
            height: 135,
            child: Image(image: AssetImage(widget.wordImage), fit: BoxFit.fill),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          back: Container(
            height: 135,
            color: Colors.lightGreenAccent,
            child: Image(image: AssetImage(widget.herbewWord), fit: BoxFit.fill),
          ),
        ),
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(icon: Icon(Icons.play_circle_outline, color: Colors.black), enableFeedback: false, onPressed: (){
                Player(widget.pronounciation);
                print("clicked");
              },),
              IconButton(icon: Icon(checked?Icons.check_box:Icons.check_box_outline_blank, color: Colors.black),enableFeedback: false, onPressed: (){setState(() {
                checked=!checked;
                Player(checked?"correctSound.wav":"checksound.wav");
              }
              );},),
              Text(checked? "LEARNED":""),
            ],
          ),
        ),
      ],
    );
  }
}

class MyGrid extends StatefulWidget {
  @override
  _MyGridState createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
  @override
  Widget build(BuildContext context) {

    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      itemCount: 100,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait) ? 2:1),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: FlashCard(wordImage: "images/${index+1}.jpg",herbewWord: "images/Slide${index+1}.JPG",pronounciation: "${index+1}.wav"),);
      },);
  }
}

class SingleItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SingleItemState();
  }
}

class _SingleItemState extends State<SingleItem> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: 20,
              options: CarouselOptions(
                enlargeCenterPage: true,
              ),
              itemBuilder: (ctx, index){
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  child: FlashCard(wordImage: "images/${index+1}.jpg",herbewWord: "images/Slide${index+1}.JPG",pronounciation: "${index+1}.wav"),
                );
              },
            ),
          ],
        )
    );
  }
}

class LayoutButton extends StatefulWidget {

  bool view;
  LayoutButton({@required this.view});

  @override
  _LayoutButtonState createState() => _LayoutButtonState();
}

class _LayoutButtonState extends State<LayoutButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(icon: Icon(widget.view?Icons.dashboard:Icons.image), iconSize: 56,color: Colors.white, onPressed: (){setState(() {
        widget.view=!widget.view;
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
    );
  }
}
