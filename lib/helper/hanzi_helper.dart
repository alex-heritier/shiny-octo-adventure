import 'dart:convert';

import 'package:chinese_fluent/model/hanzi_dictionary.dart';
import 'package:chinese_fluent/value/assets.dart';
import 'package:flutter/services.dart';

abstract class HanziHelper {
  static HanziDictionary _dictionary;

  static Future<HanziDictionary> get dictionary async {
    if (_dictionary == null) {
      String raw = await rootBundle.loadString(Assets.HANZI_LIST);
      _dictionary = HanziDictionary.fromJson(jsonDecode(raw));
      _dictionary.characters
          .sort((h1, h2) => h1.studyOrder.compareTo(h2.studyOrder));
    }
    return Future.value(_dictionary);
  }
}
