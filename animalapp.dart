import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer();

  void playSound(String soundAsset) async {
    await audioPlayer.play(soundAsset, isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Sounds',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animal Sounds App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimalButton(
                soundAsset: 'assets/sounds/cat.mp3',
                buttonText: 'Cat',
                onPressed: () => playSound('assets/sounds/cat.mp3'),
              ),
              AnimalButton(
                soundAsset: 'assets/dog.mp3',
                buttonText: 'Dog',
                onPressed: () => playSound('assets/sounds/dog.mp3'),
              ),
              AnimalButton(
                soundAsset: 'assets/sounds/cow.mp3',
                buttonText: 'Cow',
                onPressed: () => playSound('assets/sounds/cow.mp3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimalButton extends StatelessWidget {
  final String soundAsset;
  final String buttonText;
  final Function onPressed;

  AnimalButton(
      {required this.soundAsset,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(buttonText),
    );
  }
}
