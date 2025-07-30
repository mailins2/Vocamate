import 'dart:convert';

List<Lessons> lessonsFromJson(String str) => List<Lessons>.from(json.decode(str).map((x) => Lessons.fromJson(x)));

String lessonsToJson(List<Lessons> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lessons {
  int id;
  String icon;
  String title;
  String targetLang;
  int level;
  int unit;
  int reward;

  Lessons({
    required this.id,
    required this.icon,
    required this.title,
    required this.targetLang,
    required this.level,
    required this.unit,
    required this.reward,
  });

  factory Lessons.fromJson(Map<String, dynamic> json) => Lessons(
    id: json["id"],
    icon: json["icon"],
    title: json["title"],
    targetLang: json["targetLang"],
    level: json["level"],
    unit: json["unit"],
    reward: json["reward"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "icon": icon,
    "title": title,
    "targetLang": targetLang,
    "level": level,
    "unit": unit,
    "reward": reward,
  };
}

// enum TargetLang {
//   EN,
//   KO,
//   VI
// }
//
// final targetLangValues = EnumValues({
//   "en": TargetLang.EN,
//   "ko": TargetLang.KO,
//   "vi": TargetLang.VI
// });

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
