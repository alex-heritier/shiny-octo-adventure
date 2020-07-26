// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hanzi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hanzi _$HanziFromJson(Map<String, dynamic> json) {
  return Hanzi()
    ..traditional = json['traditional'] as String
    ..simplified = json['simplified'] as String
    ..studyOrder = json['study_order'] as String
    ..variants = json['variants'] as String
    ..pinyin = json['pinyin'] as String
    ..heisigKeyword = json['heisig_keyword'] as String
    ..meaning = json['meaning'] as String
    ..vocabHanzi = json['vocab_hanzi'] as String
    ..vocabPinyin = json['vocab_pinyin'] as String
    ..japaneseKun = json['japanese_kun'] as String
    ..japaneseOn = json['japanese_on'] as String
    ..soundFile = json['sound_file'] as String
    ..frequencyRank = json['freq_rank'] as String
    ..soundUrl = json['sound_url'] as String;
}

Map<String, dynamic> _$HanziToJson(Hanzi instance) => <String, dynamic>{
      'traditional': instance.traditional,
      'simplified': instance.simplified,
      'study_order': instance.studyOrder,
      'variants': instance.variants,
      'pinyin': instance.pinyin,
      'heisig_keyword': instance.heisigKeyword,
      'meaning': instance.meaning,
      'vocab_hanzi': instance.vocabHanzi,
      'vocab_pinyin': instance.vocabPinyin,
      'japanese_kun': instance.japaneseKun,
      'japanese_on': instance.japaneseOn,
      'sound_file': instance.soundFile,
      'freq_rank': instance.frequencyRank,
      'sound_url': instance.soundUrl,
    };
