// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hanzi_dictionary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HanziDictionary _$HanziDictionaryFromJson(Map<String, dynamic> json) {
  return HanziDictionary()
    ..characters = (json['characters'] as List)
        ?.map(
            (e) => e == null ? null : Hanzi.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$HanziDictionaryToJson(HanziDictionary instance) =>
    <String, dynamic>{
      'characters': instance.characters,
    };
