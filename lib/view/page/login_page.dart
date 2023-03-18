import 'package:diary_app/controller/login_controller.dart';
import 'package:diary_app/util/app_routes.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:diary_app/view/widget/app_logo.dart';
import 'package:diary_app/view/widget/custom_elevated_button.dart';
import 'package:diary_app/view/widget/custom_text_button.dart';
import 'package:diary_app/view/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              style: CustomTextStyle.h2BoldBlack,
              '매일 쓰는\n나만의 다이어리',
            ),
            const SizedBox(height: 10),
            const AppLogo(),
            const SizedBox(height: 40),
            //이메일 입력 필드
            CustomTextField(
              controller: controller.emailController,
              hintText: '이메일을 입력하세요.',
              onChanged: (_) => controller.activateLoginButton(),
            ),
            const SizedBox(height: 20),
            //비밀번호 입력 필드
            CustomTextField(
              controller: controller.pwController,
              obscureText: true,
              hintText: '비밀번호를 입력하세요.',
              onChanged: (_) => controller.activateLoginButton(),
            ),
            const SizedBox(height: 46),
            //이메일 로그인 버튼
            Obx(
              () => CustomElevatedButton(
                onPressed: controller.login,
                isActivated: controller.isButtonActivated.value,
                backgroundColor: CustomColor.primaryOlive,
                childText: '로그인',
              ),
            ),
            const SizedBox(height: 10),
            //구글 로그인 버튼
            CustomElevatedButton(
              onPressed: controller.signInWithGoogle,
              backgroundColor: CustomColor.primaryLime,
              childText: '구글로 로그인하기',
            ),
            //회원가입 버튼
            Align(
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                childText: '회원가입',
                onPressed: () => Get.toNamed(AppRoutes.signup),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
