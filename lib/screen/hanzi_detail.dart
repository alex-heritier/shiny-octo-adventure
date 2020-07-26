import 'package:chinese_fluent/model/hanzi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    final characterDisplay = Text(
      widget.hanzi.simplified,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 90),
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
        title: Text("${widget.hanzi.studyOrder}.  ${widget.hanzi.simplified} ${widget.hanzi.pinyin}"),
      ),
      body: SafeArea(child: body),
    );
  }
}
