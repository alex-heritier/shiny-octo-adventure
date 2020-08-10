import 'package:chinese_fluent/model/hanzi.dart';
import 'package:flutter/material.dart';

class PrimitiveDetail extends StatelessWidget {
  final Hanzi hanzi;

  const PrimitiveDetail(this.hanzi);

  @override
  Widget build(BuildContext context) {
    final characterDisplay = Image.asset(
      hanzi.fullImageAsset,
      height: 100,
      width: 100,
    );

    final info = DefaultTextStyle(
      style: TextStyle(fontSize: 17, color: Colors.black),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("${hanzi.heisigKeyword}"),
        ],
      ),
    );

    return Row(
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
    );
  }
}
