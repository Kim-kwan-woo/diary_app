import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  //프로필 이미지 업로드
  Future<String> uploadProfileImage(User user, File file) async {
    var ref = _firebaseStorage.ref('profile/${user.uid}');
    await ref.putFile(file);
    return ref.getDownloadURL();
  }

  //노트 이미지 업로드
  Future<String> uploadNoteImage(String noteId, File file) async {
    var ref = _firebaseStorage.ref('note/$noteId');
    await ref.putFile(file);
    return ref.getDownloadURL();
  }

  //노트 이미지 삭제
  deleteNoteImage(String noteId) {
    _firebaseStorage.ref('note/$noteId').delete();
  }
}
