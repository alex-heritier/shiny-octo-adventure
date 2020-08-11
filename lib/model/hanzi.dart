import 'package:chinese_fluent/value/assets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hanzi.g.dart';

@JsonSerializable()
class Hanzi {
  static const int TYPE_CHARACTER = 0;
  static const int TYPE_PRIMITIVE = 1;

  @JsonKey(name: "type")
  int type;

  @JsonKey(name: "traditional")
  String traditional;

  @JsonKey(name: "simplified")
  String simplified;

  @JsonKey(name: "study_order")
  int studyOrder;

  @JsonKey(name: "variants")
  String variants;

  @JsonKey(name: "pinyin")
  String pinyin;

  @JsonKey(name: "pinyin_toneless")
  String pinyinToneless;

  @JsonKey(name: "pinyin_tone_num")
  int pinyinToneNumber;

  @JsonKey(name: "heisig_keyword")
  String heisigKeyword;

  @JsonKey(name: "meaning")
  String meaning;

  @JsonKey(name: "vocab_hanzi")
  String vocabHanzi;

  @JsonKey(name: "vocab_pinyin")
  String vocabPinyin;

  @JsonKey(name: "japanese_kun")
  String japaneseKun;

  @JsonKey(name: "japanese_on")
  String japaneseOn;

  @JsonKey(name: "sound_file")
  String soundFile;

  @JsonKey(name: "freq_rank")
  String frequencyRank;

  @JsonKey(name: "sound_url")
  String soundUrl;

  @JsonKey(name: "image_asset")
  String imageAsset;

  @JsonKey(ignore: true)
  String get pinyinWithNumber => "$pinyinToneless$pinyinToneNumber";

  @JsonKey(ignore: true)
  String get pinyinWithNumberDisplay =>
      "$pinyinToneless${pinyinToneNumber == 5 ? "" : pinyinToneNumber}";

  @JsonKey(ignore: true)
  bool get isPrimitive => this.type == TYPE_PRIMITIVE;

  @JsonKey(ignore: true)
  String get fullImageAsset =>
      "${Assets.BASE}/${Assets.HEISIG_PRIMITIVE}/$imageAsset";

  // JSON
  Hanzi();

  factory Hanzi.fromJson(Map<String, dynamic> json) => _$HanziFromJson(json);

  Map<String, dynamic> toJson() => _$HanziToJson(this);
}
