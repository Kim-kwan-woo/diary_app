import 'package:diary_app/controller/signup_controller.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:diary_app/view/widget/app_logo.dart';
import 'package:diary_app/view/widget/custom_elevated_button.dart';
import 'package:diary_app/view/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});
  static const route = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: false,
        title: const Text(
          style: CustomTextStyle.b1RegularBlack,
          '회원가입',
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppLogo(),
            const SizedBox(height: 25),
            Obx(
              () => CustomTextField(
                controller: controller.emailController,
                hintText: '이메일을 입력하세요',
                errorText: controller.emailError.value,
                onChanged: (value) => controller.checkEmailValidation(value),
              ),
            ),
            const SizedBox(height: 30),
            Obx(
              () => CustomTextField(
                controller: controller.pwController,
                obscureText: true,
                hintText: '비밀번호를 입력하세요',
                errorText: controller.pwError.value,
                onChanged: (value) => controller.checkPasswordValidation(value),
              ),
            ),
            const SizedBox(height: 30),
            Obx(
              () => CustomTextField(
                controller: controller.pwConfirmController,
                obscureText: true,
                hintText: '비밀번호를 다시 입력하세요',
                errorText: controller.pwConfirmError.value,
                onChanged: (value) =>
                    controller.checkPasswordConfirmValidation(value),
              ),
            ),
            const SizedBox(height: 74),
            Obx(
              () => CustomElevatedButton(
                onPressed: controller.signup,
                isActivated: controller.isButtonActivated.value,
                backgroundColor: CustomColor.primaryOlive,
                childText: '회원가입',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
