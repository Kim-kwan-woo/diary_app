import 'package:diary_app/controller/diary_detail_controller.dart';
import 'package:diary_app/model/diary.dart';
import 'package:diary_app/model/note.dart';
import 'package:get/get.dart';

class NoteDetailController extends GetxController {
  Note note = Get.arguments['note']; //노트
  Diary diary = Get.find<DiaryDetailController>().diary; //다이어리
}
