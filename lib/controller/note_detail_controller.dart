import 'dart:io';

import 'package:diary_app/controller/diary_detail_controller.dart';
import 'package:diary_app/model/diary.dart';
import 'package:diary_app/model/note.dart';
import 'package:diary_app/service/db_service.dart';
import 'package:diary_app/service/storage_service.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/view/widget/custom_bottom_sheet.dart';
import 'package:diary_app/view/widget/diary_title_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NoteDetailController extends GetxController {
  Note note = Get.arguments['note']; //노트
  Diary diary = Get.find<DiaryDetailController>().diary; //다이어리
  var titleController = TextEditingController();
  var contentController = TextEditingController();

  Rxn<File> noteImage = Rxn<File>(); //노트 이미지
  Rx<NoteViewState> state = NoteViewState.view.obs; //노트 상태

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

  //노트 수정
  updateNote() async {
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      String? downloadUrl;
      if (noteImage.value != null) {
        downloadUrl =
            await StorageService().uploadNoteImage(note.id, noteImage.value!);
      }
      await DBService().updateNote(note.id, titleController.text,
          contentController.text, downloadUrl ?? note.imageUrl);

      var newNote = await DBService().getNote(note.id);
      note = newNote.first.data();
      state(NoteViewState.view);
    }
  }
}
