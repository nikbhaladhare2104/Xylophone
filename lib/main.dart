import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(noteNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$noteNumber.wav'));
  }

  Widget buildKey({color, noteNumber}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          padding: const WidgetStatePropertyAll(EdgeInsets.all(15.0)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
        onPressed: () => playSound(noteNumber),
        child: const Text(
          "Click Me",
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildKey(color: Colors.red, noteNumber: 1),
                buildKey(color: Colors.orange, noteNumber: 2),
                buildKey(color: Colors.yellow, noteNumber: 3),
                buildKey(color: Colors.green, noteNumber: 4),
                buildKey(color: Colors.blue, noteNumber: 5),
                buildKey(color: Colors.indigo, noteNumber: 6),
                buildKey(color: Colors.purple, noteNumber: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
