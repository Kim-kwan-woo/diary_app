import 'package:diary_app/controller/note_detail_controller.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:diary_app/view/widget/custom_bottom_sheet.dart';
import 'package:diary_app/view/widget/cutom_dialog.dart';
import 'package:diary_app/view/widget/diary_title_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteDetailPage extends GetView<NoteDetailController> {
  const NoteDetailPage({super.key});
  static const route = '/note/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: CustomColor.black,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            DiaryTitleTile(
              title: controller.diary.name,
              onPressed: () {
                BottomSheetType? option;
                Get.bottomSheet(
                  CustomBottomSheet(
                    firstText: '수정하기',
                    secondText: '삭제하기',
                    firstOnPressed: () {
                      option = BottomSheetType.first;
                      Get.back();
                    },
                    secondOnPressed: () {
                      Get.back();
                      Get.dialog(
                        CustomDialog(
                          middleText: '노트를\n삭제하시겠습니까?',
                          onConfirm: () {
                            Get.back();
                            controller.deleteNote(controller.note.id);
                          },
                          onCancel: () => Get.back(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    width: double.infinity,
                    height: 160,
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      color: CustomColor.grey,
                      borderRadius: BorderRadius.circular(16.0),
                      image: controller.note.imageUrl != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                controller.note.imageUrl!,
                              ),
                            )
                          : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      style: CustomTextStyle.b1BoldBlack,
                      controller.note.title,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      style: CustomTextStyle.b1RegularBlack,
                      controller.note.content,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
