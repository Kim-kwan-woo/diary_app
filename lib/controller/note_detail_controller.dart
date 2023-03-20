import 'package:diary_app/controller/diary_detail_controller.dart';
import 'package:diary_app/model/diary.dart';
import 'package:diary_app/model/note.dart';
import 'package:diary_app/service/db_service.dart';
import 'package:diary_app/service/storage_service.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:get/get.dart';

class NoteDetailController extends GetxController {
  Note note = Get.arguments['note']; //노트
  Diary diary = Get.find<DiaryDetailController>().diary; //다이어리

  //노트 삭제
  deleteNote(String id) async {
    await DBService().deleteNote(id);
    await StorageService().deleteNoteImage(id);
    Get.back();
    Get.snackbar(
      '노트 삭제',
      '노트가 삭제되었습니다.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: CustomColor.black,
      colorText: CustomColor.white,
    );
  }
}
