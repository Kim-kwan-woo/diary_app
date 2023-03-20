import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/model/diary.dart';
import 'package:diary_app/model/note.dart';
import 'package:diary_app/service/db_service.dart';
import 'package:diary_app/view/page/diary_detail_page.dart';
import 'package:get/get.dart';

class DiaryDetailController extends GetxController {
  Diary diary = Get.arguments['diary'];
  String diaryId = Get.arguments['diaryId'];

  Rx<DiaryDetailState> state = DiaryDetailState.loading.obs;

  RxList<QueryDocumentSnapshot<Note>> noteList =
      RxList<QueryDocumentSnapshot<Note>>();

  //노트 가져오기
  readNote() async {
    state(DiaryDetailState.loading);
    noteList.clear();
    noteList(await DBService().readNote(diaryId));
    state(DiaryDetailState.done);
  }

  //노트 최신 순 정렬
  sortReverseNote() => noteList.sort(
        (a, b) => -a.data().createAt.compareTo(b.data().createAt),
      );

  //노트 오래된 순 정렬
  sortNote() => noteList.sort(
        (a, b) => a.data().createAt.compareTo(b.data().createAt),
      );

  @override
  void onInit() {
    super.onInit();
    readNote();
  }
}
