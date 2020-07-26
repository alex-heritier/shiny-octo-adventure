import 'package:chinese_fluent/helper/hanzi_helper.dart';
import 'package:chinese_fluent/helper/pleco_helper.dart';
import 'package:chinese_fluent/model/hanzi.dart';
import 'package:chinese_fluent/model/hanzi_dictionary.dart';
import 'package:chinese_fluent/screen/hanzi_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HanziDictionary dictionary;

  List<Hanzi> get characters => dictionary?.characters ?? [];

  @override
  void initState() {
    super.initState();

    loadHanzi();
  }

  void loadHanzi() async {
    final dict = await HanziHelper.dictionary;
    setState(() {
      this.dictionary = dict;
    });
  }

  void onHanziClick(Hanzi hanzi) {
    Navigator.of(context)
        .push(CupertinoPageRoute(builder: (ctx) => HanziDetail(hanzi)));
  }

  @override
  Widget build(BuildContext context) {
    final list = GridView.builder(
      padding: EdgeInsets.only(bottom: 100),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
      ),
      itemCount: characters.length,
      itemBuilder: (_, i) => CharacterButton(
        characters[i],
        onClick: onHanziClick,
      ),
    );

    final body = Center(child: list);

    return Scaffold(body: SafeArea(child: body));
  }
}

class CharacterButton extends StatelessWidget {
  final Hanzi hanzi;
  final Function(Hanzi) onClick;

  const CharacterButton(this.hanzi, {this.onClick});

//
//  void onClick() async {
////    String url = "plecoapi://x-callback-url/s?q=$character";
//    String url = PlecoHelper.linkFor(hanzi.simplified);
//    if (await UrlLauncher.canLaunch(url)) UrlLauncher.launch(url);
//  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => this.onClick?.call(hanzi),
      child: Text(
        hanzi.simplified,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
