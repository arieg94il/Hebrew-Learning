import 'package:flutter/material.dart';
import 'dart:math';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:more_practice/SuccessPage.dart';
import 'SetsPage.dart';
class SimplePlay extends StatefulWidget {
  @override
  _SimplePlayState createState() => _SimplePlayState();
}

class _SimplePlayState extends State<SimplePlay> {

  int generateRandomNumber(listLength) {
    var random = new Random();
    return random.nextInt(listLength) + 1;
  }

  var wordsList = [
    "Slide1.JPG",
    "Slide2.JPG",
    "Slide3.JPG",
    "Slide4.JPG",
    "Slide5.JPG"
  ];
  int score = 0;

  int image;
  int option1;
  int option2;
  int option3;
  int option4;


  Set CreateSet() {
    var set = new Set();

    while (set.length < wordsList.length) {
      set.add(generateRandomNumber(wordsList.length));
    }
    return set;
  }

  List CreateList(set) {
    var list = new List();
    list = set.toList();
    return list;
  }

  @override
  void initState() {
    super.initState();
    optionsList = CreateList(CreateSet());
  }

  List optionsList;

  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog();
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    //var randomWord1=generateRandomNumber(wordsList.length);
    //var randomWord2=generateRandomNumber(wordsList.length);
    //var randomWord3=generateRandomNumber(wordsList.length);
    //var optionsList = [randomWord1, randomWord2, randomWord3];
    //var randomImage= generateRandomNumber(optionsList().length);
    int totalOptions = optionsList.length;
    option1 = optionsList[0];
    if (optionsList.length > 1) {
      option2 = optionsList[1];
    } else {
      option2 = 0;
    }
    if (optionsList.length > 2) {
      option3 = optionsList[2];
    } else {
      option3 = 0;
    }
    if (optionsList.length > 3) {
      option4 = optionsList[3];
    } else {
      option4 = 0;
    }
    var imagesList = [option1, option2, option3, option4];
    image = (imagesList..shuffle()).first;
    if (image == 0) {
      while (image == 0) {
        image = (imagesList..shuffle()).first;
      }
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
          ),
          Column(
            children: <Widget>[
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
                          builder: (context) => SetsPage()),
                    );
                  },
                ),
              ),
              Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/$image.jpg"),
                        fit: BoxFit.fill),
                    border: Border.all(color: Color(0xFFBDBDBD), width: 8),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(color: Color(0xFFFFFFFF),
                        spreadRadius: 5,
                        blurRadius: 7,)
                    ]
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    child: Container(
                      height: 90,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/Slide$option1.JPG")),
                          border: Border.all(
                              color: Color(0xFFBDBDBD), width: 8),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [BoxShadow(color: Color(0xFFFFFFFF),
                            spreadRadius: 5,
                            blurRadius: 7,)
                          ]
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (option1 == image) {
                          optionsList.remove(option1);
                          if (optionsList.length < 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuccessPage()),
                            );
                          }
                        } else {
                          optionsList = CreateList(CreateSet());
                        }
                      });
                    },
                  ),
                  MaterialButton(
                    child: Container(
                      height: 90,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/Slide$option2.JPG")),
                          border: Border.all(
                              color: Color(0xFFBDBDBD), width: 8),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [BoxShadow(color: Color(0xFFFFFFFF),
                            spreadRadius: 5,
                            blurRadius: 7,)
                          ]
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (option2 == image) {
                          optionsList.remove(option2);
                          if (optionsList.length < 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuccessPage()),
                            );
                          }
                        } else {
                          optionsList = CreateList(CreateSet());
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    child: Container(
                      height: 90,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/Slide$option3.JPG")),
                          border: Border.all(
                              color: Color(0xFFBDBDBD), width: 8),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [BoxShadow(color: Color(0xFFFFFFFF),
                            spreadRadius: 5,
                            blurRadius: 7,)
                          ]
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (option3 == image) {
                          optionsList.remove(option3);
                          if (optionsList.length < 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuccessPage()),
                            );
                          }
                        } else {
                          optionsList = CreateList(CreateSet());
                        }
                      });
                    },
                  ),
                  MaterialButton(
                    child: Container(
                      height: 90,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/Slide$option4.JPG")),
                          border: Border.all(
                              color: Color(0xFFBDBDBD), width: 8),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [BoxShadow(color: Color(0xFFFFFFFF),
                            spreadRadius: 5,
                            blurRadius: 7,)
                          ]
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (option4 == image) {
                          optionsList.remove(option4);
                          if (optionsList.length < 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuccessPage()),
                            );
                          }
                        } else {
                          optionsList = CreateList(CreateSet());
                        }
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 25),
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFBDBDBD), width: 8),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(color: Color(0xFFFFFFFF),
                            spreadRadius: 5,
                            blurRadius: 7,)
                        ]
                    ),
                  ),
                  CircularPercentIndicator(
                    backgroundColor: Color(0xFFD1C4E9),
                    radius: 150.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: (((wordsList.length - 1) -
                        (optionsList.length - 1)) / (wordsList.length - 1)),
                    center: new Text(
                      "${(((((wordsList.length - 1) - (optionsList.length -
                          1)) / (wordsList.length - 1)) * 100)
                          .round())}% \n complete",
                      style:
                      new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Color(0xFF03A9F4),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


