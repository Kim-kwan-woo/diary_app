import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Diary {
  String name;
  String uid;

  Diary({
    required this.name,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
    };
  }

  factory Diary.fromMap(Map<String, dynamic> map) {
    return Diary(
      name: map['name'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Diary.fromJson(String source) =>
      Diary.fromMap(json.decode(source) as Map<String, dynamic>);
}
