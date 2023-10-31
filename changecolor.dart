import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Changer App',
      home: ColorChanger(),
    );
  }
}

class ColorChanger extends StatefulWidget {
  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  Color _backgroundColor = Colors.yellow; // Initial color is yellow

  void changeColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Changer App'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => changeColor(Colors.yellow),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  padding: MaterialStateProperty.all(EdgeInsets.all(16.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  )),
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  )),
                ),
                child: Text('Yellow'),
              ),
              ElevatedButton(
                onPressed: () => changeColor(Colors.blue),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(EdgeInsets.all(16.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  )),
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  )),
                ),
                child: Text('Blue'),
              ),
              ElevatedButton(
                onPressed: () => changeColor(Colors.red),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(EdgeInsets.all(16.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  )),
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  )),
                ),
                child: Text('Red'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
