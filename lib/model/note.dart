import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Note {
  String id;
  String diaryId;
  String uid;
  String title;
  String content;
  DateTime createAt;
  String? imageUrl;

  Note({
    required this.id,
    required this.diaryId,
    required this.uid,
    required this.title,
    required this.content,
    required this.createAt,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'diaryId': diaryId,
      'uid': uid,
      'title': title,
      'content': content,
      'createAt': createAt.millisecondsSinceEpoch,
      'imageUrl': imageUrl,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as String,
      diaryId: map['diaryId'] as String,
      uid: map['uid'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt'] as int),
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);
}
