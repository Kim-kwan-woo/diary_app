import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:diary_app/view/widget/custom_bottom_sheet.dart';
import 'package:diary_app/view/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DiaryState { view, edit }

class DiaryTile extends StatelessWidget {
  DiaryTile(
      {super.key,
      required this.diaryName,
      required this.onSubmitted,
      required this.onDeleted,
      required this.onTap});

  final String diaryName;
  final Function(String)? onSubmitted;
  final Function() onDeleted;
  final Function() onTap;
  Rx<DiaryState> state = DiaryState.view.obs;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        onTap: onTap,
        //view 상태에서는 다이어리 이름, edit 상태에서는 텍스트 필드 출력
        title: state == DiaryState.view
            ? Text(
                style: CustomTextStyle.b1RegularOlive,
                diaryName,
              )
            : Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      cursorColor: CustomColor.primaryOlive,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColor.primaryOlive,
                          ),
                        ),
                      ),
                      onSubmitted: onSubmitted,
                    ),
                  ),
                  CustomTextButton(
                    onPressed: () => state(DiaryState.view),
                    childText: '취소',
                  ),
                ],
              ),
        //view 상태에서는 옵션 보여주기, edit 상태에서는 옵션 없음
        trailing: state == DiaryState.view
            ? IconButton(
                onPressed: () => Get.bottomSheet(
                  CustomBottomSheet(
                    firstText: '수정하기',
                    secondText: '삭제하기',
                    firstOnPressed: () {
                      controller.text = diaryName;
                      state(DiaryState.edit);
                      Get.back();
                    },
                    secondOnPressed: () {
                      Get.back();
                      onDeleted();
                    },
                  ),
                ),
                color: CustomColor.black,
                icon: const Icon(Icons.more_vert),
              )
            : null,
      ),
    );
  }
}
