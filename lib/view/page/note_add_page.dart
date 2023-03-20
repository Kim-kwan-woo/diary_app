import 'package:diary_app/controller/note_add_controller.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:diary_app/view/widget/custom_bottom_sheet.dart';
import 'package:diary_app/view/widget/custom_elevated_button.dart';
import 'package:diary_app/view/widget/custom_text_field.dart';
import 'package:diary_app/view/widget/diary_title_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteAddPage extends GetView<NoteAddController> {
  const NoteAddPage({super.key});
  static const route = '/note/add';

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
              state: NoteViewState.edit,
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  InkWell(
                    onTap: () async {
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
                    child: Obx(
                      () => Container(
                        width: double.infinity,
                        height: 160,
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomColor.grey,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                          image: controller.noteImage.value != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    controller.noteImage.value!,
                                  ),
                                )
                              : null,
                        ),
                        child: controller.noteImage.value == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.photo_camera),
                                  Text(
                                    style: CustomTextStyle.b1RegularBlack,
                                    '이미지를 선택하세요',
                                  ),
                                ],
                              )
                            : null,
                      ),
                    ),
                  ),
                  CustomTextField(
                    hintText: '제목을 입력하세요',
                    controller: controller.titleController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: '내용을 입력하세요',
                    maxLines: 12,
                    controller: controller.contentController,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CustomElevatedButton(
                backgroundColor: CustomColor.primaryOlive,
                childText: '등록하기',
                onPressed: controller.uploadNote,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
