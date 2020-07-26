import 'package:chinese_fluent/model/hanzi.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hanzi_dictionary.g.dart';

@JsonSerializable()
class HanziDictionary {
  @JsonKey(name: "characters")
  List<Hanzi> characters;

  // JSON
  HanziDictionary();

  factory HanziDictionary.fromJson(Map<String, dynamic> json) => _$HanziDictionaryFromJson(json);

  Map<String, dynamic> toJson() => _$HanziDictionaryToJson(this);
}
