import 'package:chinese_fluent/model/hanzi.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HanziDetail extends StatelessWidget {
  final Hanzi hanzi;

  const HanziDetail(this.hanzi);

  String get traditionalDisplay => hanzi.simplified != hanzi.traditional
      ? "${hanzi.simplified} / ${hanzi.traditional}"
      : "${hanzi.traditional}";

  void playAudio() async {
    print(hanzi.soundUrl);
    AudioPlayer player = AudioPlayer();
    await player.setUrl(hanzi.soundUrl);
    await player.play();
    await player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final characterDisplay = Text(
      hanzi.simplified,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 90),
    );

    final audioButton = IconButton(
      onPressed: playAudio,
      icon: Icon(Icons.play_arrow),
    );

    final info = DefaultTextStyle(
      style: TextStyle(fontSize: 17, color: Colors.black),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$traditionalDisplay  –  ${hanzi.heisigKeyword}"),
          SizedBox(height: 14),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 17),
              children: [
                TextSpan(text: "def. "),
                TextSpan(
                  text: "${hanzi.meaning}",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          audioButton,
        ],
      ),
    );

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: characterDisplay,
              ),
            ),
            SizedBox(width: 10),
            Expanded(child: info),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  hanzi.pinyin,
                  style: TextStyle(fontSize: 32, letterSpacing: 3),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(child: Container()),
          ],
        ),
      ],
    );
  }
}
