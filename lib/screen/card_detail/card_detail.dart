import 'package:chinese_fluent/helper/pleco_helper.dart';
import 'package:chinese_fluent/model/hanzi.dart';
import 'package:chinese_fluent/screen/card_detail/widget/hanzi_detail.dart';
import 'package:chinese_fluent/screen/card_detail/widget/primitive_detail.dart';
import 'package:chinese_fluent/value/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CardDetail extends StatefulWidget {
  final Hanzi hanzi;

  const CardDetail(this.hanzi);

  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    final topSection = widget.hanzi.isPrimitive
        ? PrimitiveDetail(widget.hanzi)
        : HanziDetail(widget.hanzi);

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
