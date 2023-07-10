import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const Xylophone());

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound(soundNumber);
        },
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildKey(color: Colors.red, soundNumber: 1),
                    buildKey(color: Colors.orange, soundNumber: 2),
                    buildKey(color: Colors.yellow, soundNumber: 3),
                    buildKey(color: Colors.lightGreen, soundNumber: 4),
                    buildKey(color: Colors.blue, soundNumber: 5),
                    buildKey(color: Colors.purple.shade900, soundNumber: 6),
                    buildKey(color: Colors.teal.shade800, soundNumber: 7),
                  ]),
            )));
  }
}
