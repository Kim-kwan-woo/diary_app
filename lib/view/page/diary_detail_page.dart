import 'package:diary_app/controller/diary_detail_controller.dart';
import 'package:diary_app/util/app_routes.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:diary_app/view/widget/app_logo.dart';
import 'package:diary_app/view/widget/diary_title_tile.dart';
import 'package:diary_app/view/widget/note_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DiaryDetailPage extends GetView<DiaryDetailController> {
  const DiaryDetailPage({super.key});
  static const route = '/diary/detail';

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
            DiaryTitleTile(title: controller.diary.name),
            Obx(() {
              if (controller.noteList.isEmpty) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      AppLogo(),
                      SizedBox(height: 20),
                      Text(
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.b1RegularGrey,
                        '다이어리가 비었습니다.\n\n오른쪽 아래의 버튼을 클릭해\n노트를 추가하세요.',
                      ),
                    ],
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.noteList.length,
                    itemBuilder: (context, index) {
                      return NoteTile(note: controller.noteList[index].data());
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Get.toNamed(AppRoutes.noteAdd);
            controller.readNote();
          },
          elevation: 0,
          backgroundColor: CustomColor.primaryLime,
          foregroundColor: CustomColor.primaryOlive,
          child: const Icon(Icons.create)),
    );
  }
}
