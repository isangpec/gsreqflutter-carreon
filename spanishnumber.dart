import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MySpanishNumber(),
  ));
}

class MySpanishNumber extends StatefulWidget {
  MySpanishNumber({Key? key}) : super(key: key);

  @override
  MySpanishNumberState createState() => MySpanishNumberState();
}

class MySpanishNumberState extends State<MySpanishNumber> {
  int counter = 0;
  List<String> spanishNumbers = [
    "uno",
    "dos",
    "tres",
    "cuatro",
    "cinco",
    "seis",
    "siete",
    "ocho",
    "nueve",
    "diez",
  ];

  String defaultText = "Spanish Number";

  void displayNumber() {
    setState(() {
      defaultText = spanishNumbers[counter];
      counter = (counter + 1) % 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Stateful App'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              defaultText,
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // Changed RaisedButton to ElevatedButton
              onPressed: displayNumber,
              child: Text('Call Numbers'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
