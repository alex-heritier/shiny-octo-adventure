import 'package:chinese_fluent/helper/hanzi_helper.dart';
import 'package:chinese_fluent/model/hanzi.dart';
import 'package:chinese_fluent/model/hanzi_dictionary.dart';
import 'package:chinese_fluent/screen/card_detail/card_detail.dart';
import 'package:chinese_fluent/widget/keyboard_killer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const int HANZI_PER_ROW = 8;

  int searchIDTracker = 0;

  HanziDictionary dictionary;

  List<Hanzi> searchResults;

  List<Hanzi> get filteredCharacters =>
      searchResults ?? dictionary?.characters ?? [];

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

  void onHanziClick(Hanzi hanzi) async {
    if (hanzi.isPrimitive) return;

    FocusScope.of(context).unfocus();
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => CardDetail(hanzi)));
  }

  void onSearchChanged(String search) async {
    final int currentID = searchIDTracker++;

    List<Hanzi> results = search.isEmpty
        ? null
        : dictionary.characters
            .where((hanzi) =>
                hanzi.pinyinWithNumber.contains(search) ||
                hanzi.pinyin.contains(search) ||
                hanzi.simplified == search ||
                hanzi.traditional == search)
            .toList();

    if ((currentID + 1) == searchIDTracker)
      setState(() => this.searchResults = results);
  }

  @override
  Widget build(BuildContext context) {
    final search = Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: onSearchChanged,
        decoration: InputDecoration(
          hintText: "Search",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          isDense: true,
        ),
      ),
    );

//    final list = GridView.builder(
//      padding: EdgeInsets.only(left: 10, right: 10, bottom: 100),
//      physics: AlwaysScrollableScrollPhysics(),
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: HANZI_PER_ROW,
//      ),
//      itemCount: filteredCharacters.length,
//      itemBuilder: (_, i) => CharacterButton(
//        filteredCharacters[i],
//        onClick: onHanziClick,
//      ),
//    );

    final list = GridView(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 100),
      physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: HANZI_PER_ROW,
      ),
      children: filteredCharacters
          .map((char) => CharacterButton(char, onClick: onHanziClick))
          .toList(),
    );

    final body = dictionary == null
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: <Widget>[
              search,
              Expanded(child: list),
            ],
          );

    return KeyboardKiller(
      child: Scaffold(
        body: SafeArea(child: body),
      ),
    );
  }
}

class CharacterButton extends StatelessWidget {
  final Hanzi hanzi;
  final Function(Hanzi) onClick;

  const CharacterButton(this.hanzi, {this.onClick});

  @override
  Widget build(BuildContext context) {
    final text = Center(
      child: hanzi.isPrimitive
          ? Image.asset(hanzi.fullImageAsset, width: 36, height: 36)
          : Text(
              hanzi.simplified,
              style: TextStyle(fontSize: 24),
            ),
    );

    return InkWell(
      onTap: () => this.onClick?.call(hanzi),
      child: text,
    );
  }
}
