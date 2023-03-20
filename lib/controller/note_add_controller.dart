import 'dart:io';

import 'package:diary_app/controller/diary_detail_controller.dart';
import 'package:diary_app/model/diary.dart';
import 'package:diary_app/model/note.dart';
import 'package:diary_app/service/db_service.dart';
import 'package:diary_app/service/storage_service.dart';
import 'package:diary_app/view/widget/custom_bottom_sheet.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NoteAddController extends GetxController {
  Diary diary = Get.find<DiaryDetailController>().diary; //다이어리
  String diaryId = Get.find<DiaryDetailController>().diaryId; //다이어리 아이디

  Rxn<File> noteImage = Rxn<File>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  //이미지 선택
  pickImage(BottomSheetType option) async {
    var picker = ImagePicker();
    XFile? res;
    if (option == BottomSheetType.first) {
      res = await picker.pickImage(source: ImageSource.camera);
    } else {
      res = await picker.pickImage(source: ImageSource.gallery);
    }

    if (res != null) {
      noteImage(File(res.path));
    }
  }

  //노트 업로드
  uploadNote() async {
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      String id = DBService().idGenerator();
      String? downloadUrl;
      if (noteImage.value != null) {
        downloadUrl =
            await StorageService().uploadNoteImage(id, noteImage.value!);
      }
      await DBService().createNote(
        id,
        Note(
          diaryId: diaryId,
          title: titleController.text,
          content: contentController.text,
          createAt: DateTime.now(),
          imageUrl: downloadUrl,
        ),
      );
      Get.back();
    }
  }
}
