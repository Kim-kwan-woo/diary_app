import 'package:diary_app/controller/main_controller.dart';
import 'package:diary_app/util/app_routes.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:diary_app/view/widget/custom_elevated_button.dart';
import 'package:diary_app/view/widget/cutom_dialog.dart';
import 'package:diary_app/view/widget/diary_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<MainController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //다이어리 추가 버튼
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: CustomElevatedButton(
            backgroundColor: CustomColor.primaryOlive,
            childText: '다이어리 추가하기',
            onPressed: controller.createDiary,
          ),
        ),
        //다이어리 리스트 뷰
        Expanded(
          child: Obx(
            () => ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.diaryList.length,
              itemBuilder: (context, index) {
                //커스텀 다이어리 타일
                return DiaryTile(
                  diaryName: controller.diaryList[index].data().name,
                  onTap: () => Get.toNamed(AppRoutes.diaryDetail, arguments: {
                    'diary': controller.diaryList[index].data(),
                    'diaryId': controller.diaryList[index].id,
                  }),
                  onSubmitted: (value) {
                    controller.updateDiaryName(
                        controller.diaryList[index].id, value);
                  },
                  onDeleted: () {
                    Get.dialog(
                      CustomDialog(
                        middleText: '다이어리를\n삭제하시겠습니까?',
                        onConfirm: () {
                          controller
                              .deleteDiary(controller.diaryList[index].id);
                          Get.back();
                        },
                        onCancel: () => Get.back(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
