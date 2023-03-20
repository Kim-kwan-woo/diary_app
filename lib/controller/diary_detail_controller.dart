import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/model/diary.dart';
import 'package:diary_app/model/note.dart';
import 'package:diary_app/service/db_service.dart';
import 'package:get/get.dart';

class DiaryDetailController extends GetxController {
  Diary diary = Get.arguments['diary'];
  String diaryId = Get.arguments['diaryId'];

  RxList<QueryDocumentSnapshot<Note>> noteList =
      RxList<QueryDocumentSnapshot<Note>>();

  //노트 가져오기
  readNote() async {
    noteList.clear();
    noteList(await DBService().readNote(diaryId));
  }

  @override
  void onInit() {
    super.onInit();
    readNote();
  }
}
