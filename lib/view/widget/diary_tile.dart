import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:diary_app/view/widget/custom_bottom_sheet.dart';
import 'package:diary_app/view/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ViewState { view, edit }

class DiaryTile extends StatelessWidget {
  DiaryTile(
      {super.key,
      required this.diaryName,
      required this.onSubmitted,
      required this.onDeleted});

  final String diaryName;
  final Function(String)? onSubmitted;
  final Function() onDeleted;
  Rx<ViewState> state = ViewState.view.obs;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        //view 상태에서는 다이어리 이름, edit 상태에서는 텍스트 필드 출력
        title: state == ViewState.view
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
                    onPressed: () => state(ViewState.view),
                    childText: '취소',
                  ),
                ],
              ),
        //view 상태에서는 옵션 보여주기, edit 상태에서는 옵션 없음
        trailing: state == ViewState.view
            ? IconButton(
                onPressed: () => Get.bottomSheet(
                  CustomBottomSheet(
                    firstText: '수정하기',
                    secondText: '삭제하기',
                    firstOnPressed: () {
                      controller.text = diaryName;
                      state(ViewState.edit);
                      Get.back();
                    },
                    secondOnPressed: () {
                      onDeleted();
                      Get.back();
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
