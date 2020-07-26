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
  @override
  Widget build(BuildContext context) {
    final characterDisplay = Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.6)),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 128,
      height: 128,
      child: Center(
        child: Text(
          widget.hanzi.simplified,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 90),
        ),
      ),
    );

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${widget.hanzi.simplified} / ${widget.hanzi.traditional}"),
        Text(widget.hanzi.pinyin),
        Text(widget.hanzi.heisigKeyword),
        Text(widget.hanzi.studyOrder),
        Text(widget.hanzi.meaning),
      ],
    );

    final topSection = Row(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: characterDisplay,
          ),
        ),
        Expanded(child: info),
      ],
    );

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 10),
        topSection,
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.hanzi.studyOrder}.  ${widget.hanzi.simplified}"),
      ),
      body: SafeArea(child: body),
    );
  }
}
