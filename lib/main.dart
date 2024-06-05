import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class AudioCachePlayer{
  final AudioPlayer player=AudioPlayer();
  Future<void> playNote(int noteNumber) async{
    await player.play(AssetSource('note$noteNumber.wav'));
  }
}


class RainbowColumn extends StatelessWidget {
  const RainbowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildColorButton(Colors.red, 'Red',1),
        _buildColorButton(Colors.orange, 'Orange',2),
        _buildColorButton(Colors.yellow, 'Yellow',3),
        _buildColorButton(Colors.green, 'Green',4),
        _buildColorButton(Colors.blue, 'Blue',5),
        _buildColorButton(Colors.indigo, 'Indigo',6),
        _buildColorButton(Colors.purple, 'Violet',7),
      ],
    );
  }

  Widget _buildColorButton(Color color, String colorName,int note) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        // This will expand the button to fill the screen width
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: color,shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          onPressed: () {
            AudioCachePlayer? acp=AudioCachePlayer();
            acp.playNote(note);
            acp=null;
          },
          child: Text(
            colorName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     home: Scaffold(
       backgroundColor: Colors.black,
       body: SafeArea(child: RainbowColumn()),
     ),
    );
  }
}
