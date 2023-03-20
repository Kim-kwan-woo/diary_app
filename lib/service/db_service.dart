import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/model/diary.dart';
import 'package:diary_app/model/note.dart';

class DBService {
  final _diaryRef = FirebaseFirestore.instance
      .collection('diary')
      .withConverter(
          fromFirestore: (snapshot, _) => Diary.fromMap(snapshot.data()!),
          toFirestore: (diary, _) => diary.toMap());

  final _noteRef = FirebaseFirestore.instance.collection('note').withConverter(
      fromFirestore: (snapshot, _) => Note.fromMap(snapshot.data()!),
      toFirestore: (note, _) => note.toMap());

  //doc id 생성
  String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  //새로운 다이어리 생성
  createDiary(Diary diary) {
    _diaryRef.add(diary);
  }

  //다이어리 가져오기
  Future<List<QueryDocumentSnapshot<Diary>>> readDiary(String uid) async {
    var data = await _diaryRef.where('uid', isEqualTo: uid).get();
    return data.docs;
  }

  //다이어리 이름 수정
  updateDiary(String id, String name) {
    _diaryRef.doc(id).update({'name': name});
  }

  //다이어리 삭제
  deleteDiary(String id) {
    _diaryRef.doc(id).delete();
  }

  //노트 생성
  createNote(String id, Note note) {
    _noteRef.doc(id).set(note);
  }

  //노트 가져오기
  Future<List<QueryDocumentSnapshot<Note>>> readNote(String noteId) async {
    var data = await _noteRef.where('diaryId', isEqualTo: noteId).get();
    return data.docs;
  }

  //노트 삭제
  deleteNote(String id) {
    _noteRef.doc(id).delete();
  }
}
