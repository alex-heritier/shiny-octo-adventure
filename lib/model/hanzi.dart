import 'package:json_annotation/json_annotation.dart';

part 'hanzi.g.dart';

@JsonSerializable()
class Hanzi {
  @JsonKey(name: "traditional")
  String traditional;

  @JsonKey(name: "simplified")
  String simplified;

  @JsonKey(name: "study_order")
  String studyOrder;

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

  @JsonKey(ignore: true)
  String get pinyinWithNumber => "$pinyinToneless$pinyinToneNumber";

  @JsonKey(ignore: true)
  String get pinyinWithNumberDisplay =>
      "$pinyinToneless${pinyinToneNumber == 5 ? "" : pinyinToneNumber}";

  // JSON
  Hanzi();

  factory Hanzi.fromJson(Map<String, dynamic> json) => _$HanziFromJson(json);

  Map<String, dynamic> toJson() => _$HanziToJson(this);
}
