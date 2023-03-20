import 'package:diary_app/controller/note_detail_controller.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:diary_app/view/widget/custom_bottom_sheet.dart';
import 'package:diary_app/view/widget/custom_elevated_button.dart';
import 'package:diary_app/view/widget/custom_text_field.dart';
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
        child: Obx(
          () => Column(
            children: [
              DiaryTitleTile(
                title: controller.diary.name,
                state: controller.state.value,
                onPressed: () {
                  Get.bottomSheet(
                    CustomBottomSheet(
                      firstText: '수정하기',
                      secondText: '삭제하기',
                      firstOnPressed: () {
                        Get.back();
                        controller.state(NoteViewState.edit);
                        controller.titleController.text = controller.note.title;
                        controller.contentController.text =
                            controller.note.content;
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
                    InkWell(
                      onTap: controller.state.value == NoteViewState.view
                          ? null
                          : () async {
                              BottomSheetType? option;
                              await Get.bottomSheet(
                                CustomBottomSheet(
                                  firstText: '촬영하기',
                                  secondText: '갤러리',
                                  firstOnPressed: () {
                                    option = BottomSheetType.first;
                                    Get.back();
                                  },
                                  secondOnPressed: () {
                                    option = BottomSheetType.second;
                                    Get.back();
                                  },
                                ),
                              );
                              if (option != null) {
                                controller.pickImage(option!);
                              }
                            },
                      child: Container(
                        width: double.infinity,
                        height: 160,
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        decoration: BoxDecoration(
                          color: CustomColor.grey,
                          borderRadius: BorderRadius.circular(16.0),
                          image: controller.note.imageUrl != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: controller.noteImage.value != null
                                      ? FileImage(controller.noteImage.value!)
                                          as ImageProvider
                                      : NetworkImage(controller.note.imageUrl!),
                                )
                              : null,
                        ),
                      ),
                    ),
                    if (controller.state.value == NoteViewState.view)
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          style: CustomTextStyle.b1BoldBlack,
                          controller.note.title,
                        ),
                      )
                    else
                      CustomTextField(
                        hintText: '제목을 입력하세요',
                        controller: controller.titleController,
                      ),
                    if (controller.state.value == NoteViewState.view)
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          style: CustomTextStyle.b1RegularBlack,
                          controller.note.content,
                        ),
                      )
                    else
                      CustomTextField(
                        hintText: '내용을 입력하세요',
                        maxLines: 12,
                        controller: controller.contentController,
                      ),
                  ],
                ),
              ),
              if (controller.state.value == NoteViewState.edit)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CustomElevatedButton(
                    backgroundColor: CustomColor.primaryOlive,
                    childText: '수정하기',
                    onPressed: controller.updateNote,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
