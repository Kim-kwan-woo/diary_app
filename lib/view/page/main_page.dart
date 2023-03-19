import 'package:diary_app/controller/main_controller.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:diary_app/view/screen/home_screen.dart';
import 'package:diary_app/view/screen/my_screen.dart';
import 'package:diary_app/view/widget/bottom_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 52),
            const Text(
              style: CustomTextStyle.h2BoldBlack,
              'My Diary',
            ),
            Expanded(
              child: PageView(
                controller: controller.pageViewController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  HomeScreen(),
                  MyScreen(),
                ],
              ),
            ),
            BottomToggleButton(
              selections: controller.selections,
              onPressed: (index) {
                for (var i = 0; i < controller.selections.length; i++) {
                  controller.jumpToPage(index);
                  if (i != index) {
                    controller.selections[i] = false;
                  } else {
                    controller.selections[i] = true;
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
