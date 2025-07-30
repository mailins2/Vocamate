import 'dart:convert';

List<Vocabulary> vocabularyFromJson(String str) => List<Vocabulary>.from(json.decode(str).map((x) => Vocabulary.fromJson(x)));

String vocabularyToJson(List<Vocabulary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Vocabulary {
  int lessonId;
  String word;
  Map<String, dynamic> meaning;
  String type;
  Map<String, dynamic> example;

  Vocabulary({
    required this.lessonId,
    required this.word,
    required this.meaning,
    required this.example,
    required this.type,
  });

  factory Vocabulary.fromJson(Map<String, dynamic> json) {
    return Vocabulary(
      lessonId: json["lessonId"],
      word: json['word'],
      meaning: json['meaning'],
      example: json['example'],
      type: json['type'],
    );
  }

  Map<String,dynamic> toJson()=>{
    "lessonId": lessonId,
    "word": word,
    "meaning":meaning,
    "example":example,
    "type":type
  };

}
