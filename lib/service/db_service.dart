import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/model/diary.dart';

class DBService {
  final _db = FirebaseFirestore.instance;

  final _diaryRef = FirebaseFirestore.instance
      .collection('diary')
      .withConverter(
          fromFirestore: (snapshot, _) => Diary.fromMap(snapshot.data()!),
          toFirestore: (diary, _) => diary.toMap());

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
}
