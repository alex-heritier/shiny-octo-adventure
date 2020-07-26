import 'dart:convert';

import 'package:chinese_fluent/model/hanzi_dictionary.dart';
import 'package:chinese_fluent/value/assets.dart';
import 'package:flutter/services.dart';

abstract class HanziHelper {
  static HanziDictionary _dictionary;

  static Future<HanziDictionary> get dictionary async {
    if (_dictionary == null) {
      String raw = await rootBundle.loadString(Assets.HANZI_LIST);
      print(raw);
      _dictionary = HanziDictionary.fromJson(jsonDecode(raw));
    }
    return Future.value(_dictionary);
  }
}
