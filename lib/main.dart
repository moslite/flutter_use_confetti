import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _confettiController = ConfettiController();
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _confettiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text('Confetti time! 🎉'),
          ),
          body: Center(
            child: MaterialButton(
              onPressed: () {
                if (isPlaying) {
                  _confettiController.stop();
                } else {
                  _confettiController.play();
                }

                isPlaying = !isPlaying;
              },
              child: const Text('Party Time!'),
              color: Colors.deepPurple[200],
              textColor: Colors.deepPurple[50],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _confettiController,
          blastDirection: pi / 2,
          colors: const [
            Colors.deepPurple,
            Colors.deepOrange,
            Colors.green,
          ],
          gravity: 0.005,
          emissionFrequency: 0.05,
        ),
      ],
    );
  }
}
