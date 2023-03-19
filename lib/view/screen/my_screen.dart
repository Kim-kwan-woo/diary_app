import 'package:diary_app/controller/main_controller.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:diary_app/view/widget/custom_bottom_sheet.dart';
import 'package:diary_app/view/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyScreen extends GetView<MainController> {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  //프로필 이미지
                  Obx(
                    () => CircleAvatar(
                      radius: 45,
                      backgroundColor: CustomColor.grey,
                      backgroundImage: controller.downloadUrl.value != null
                          ? NetworkImage(controller.downloadUrl.value!)
                          : null,
                    ),
                  ),
                  //프로필 이미지 변경 버튼
                  Positioned(
                    bottom: -12,
                    right: -12,
                    child: GestureDetector(
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
                          controller.uploadProfileImage(option!);
                        }
                      },
                      child: const CircleAvatar(
                        radius: 24,
                        backgroundColor: CustomColor.primaryLime,
                        foregroundColor: CustomColor.primaryOlive,
                        child: Icon(Icons.photo_camera),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //사용자 이메일
                  Text(
                    style: CustomTextStyle.b1BoldBlack,
                    controller.getUser().value!.email!,
                  ),
                  //로그아웃 버튼
                  CustomTextButton(
                    childText: '로그아웃',
                    onPressed: controller.logout,
                  )
                ],
              ),
            ],
          ),
        ),
        //총 다이어리 수
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                style: CustomTextStyle.b1RegularOlive,
                '내 다이어리',
              ),
              Text(
                style: CustomTextStyle.b1RegularOlive,
                '1',
              ),
            ],
          ),
        ),
        //총 노트 수
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                style: CustomTextStyle.b1RegularOlive,
                '내 노트',
              ),
              Text(
                style: CustomTextStyle.b1RegularOlive,
                '6',
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
