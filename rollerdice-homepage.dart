import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage one = AssetImage("assets/img/inverted-dice-1.png");
  AssetImage two = AssetImage("assets/img/inverted-dice-2.png");
  AssetImage three = AssetImage("assets/img/inverted-dice-3.png");
  AssetImage four = AssetImage("assets/img/inverted-dice-4.png");
  AssetImage five = AssetImage("assets/img/inverted-dice-5.png");
  AssetImage six = AssetImage("assets/img/inverted-dice-6.png");

  late AssetImage diceImage1;
  late AssetImage diceImage2;
  late int random1;
  late int random2;

  @override
  void initState() {
    super.initState();
    diceImage1 = one;
    diceImage2 = one;
    random1 = 1;
    random2 = 1;
  }

  void rollDice() {
    random1 = 1 + Random().nextInt(6);
    random2 = 1 + Random().nextInt(6);

    late AssetImage newImage1 = one; // Initialize newImage1 and newImage2
    late AssetImage newImage2 = one;

    switch (random1) {
      case 1:
        newImage1 = one;
        break;
      case 2:
        newImage1 = two;
        break;
      case 3:
        newImage1 = three;
        break;
      case 4:
        newImage1 = four;
        break;
      case 5:
        newImage1 = five;
        break;
      case 6:
        newImage1 = six;
        break;
    }

    switch (random2) {
      case 1:
        newImage2 = one;
        break;
      case 2:
        newImage2 = two;
        break;
      case 3:
        newImage2 = three;
        break;
      case 4:
        newImage2 = four;
        break;
      case 5:
        newImage2 = five;
        break;
      case 6:
        newImage2 = six;
        break;
    }

    setState(() {
      diceImage1 = newImage1;
      diceImage2 = newImage2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: diceImage1,
              width: 200.0,
              height: 200.0,
            ),
            Image(
              image: diceImage2,
              width: 200.0,
              height: 200.0,
            ),
            Text(
              'Total: ${random1 + random2}',
              style: TextStyle(fontSize: 24),
            ),
            Container(
              margin: EdgeInsets.only(top: 100.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 15.0,
                  ),
                ),
                onPressed: rollDice,
                child: Text(
                  'Roll the dice!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
