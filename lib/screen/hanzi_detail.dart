import 'package:chinese_fluent/helper/pleco_helper.dart';
import 'package:chinese_fluent/model/hanzi.dart';
import 'package:chinese_fluent/value/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';

class HanziDetail extends StatefulWidget {
  final Hanzi hanzi;

  const HanziDetail(this.hanzi);

  @override
  _HanziDetailState createState() => _HanziDetailState();
}

class _HanziDetailState extends State<HanziDetail> {
  String get traditionalDisplay =>
      widget.hanzi.simplified != widget.hanzi.traditional
          ? "${widget.hanzi.simplified} / ${widget.hanzi.traditional}"
          : "${widget.hanzi.traditional}";

  void playAudio() async {
    AudioPlayer player = AudioPlayer();
    await player.setUrl(widget.hanzi.soundUrl);
    await player.play();
  }

  @override
  Widget build(BuildContext context) {
    final characterDisplay = Text(
      widget.hanzi.simplified,
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
          Text("$traditionalDisplay  –  ${widget.hanzi.heisigKeyword}"),
          SizedBox(height: 14),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 17),
              children: [
                TextSpan(text: "def. "),
                TextSpan(
                  text: "${widget.hanzi.meaning}",
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

    final topSection = Column(
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
                  widget.hanzi.pinyin,
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

    final body = Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 20),
          topSection,
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.hanzi.studyOrder}.  ${widget.hanzi.simplified} ${widget.hanzi.pinyin}"),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              String url = PlecoHelper.linkFor(widget.hanzi.simplified);
              if (await canLaunch(url)) launch(url);
            },
            icon: Image.asset(Assets.PLECO),
          )
        ],
      ),
      body: SafeArea(child: body),
    );
  }
}
