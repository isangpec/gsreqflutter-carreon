import 'package:flutter/material.dart';

void main() => runApp(LoadingImageApp());

class LoadingImageApp extends StatelessWidget {
  const LoadingImageApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
            placeholder:
                'assets/gif/loading-animations-preloader-gifs-ui-ux-effects-10.gif',
            image:
                'http://archivision.com/educational/samples/files/1A2-F-P-I-2-C1_L.jpg'),
      ),
    );
  }
}


//download to folder assets/gif/animation.gif
///pubspec.yaml