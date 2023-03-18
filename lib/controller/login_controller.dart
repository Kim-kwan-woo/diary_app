import 'package:diary_app/controller/auth_controller.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController(); //이메일 컨트롤러
  var pwController = TextEditingController(); //패스워드 컨트롤러

  RxBool isButtonActivated = false.obs; //로그인 버튼 활성화 여부

  //로그인
  login() async {
    if (!await Get.find<AuthController>()
        .login(emailController.text, pwController.text)) {
      Get.snackbar(
        '로그인 오류',
        '존재하지 않는 회원정보 입니다.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: CustomColor.black,
        colorText: CustomColor.white,
      );
    }
  }

  //구글로 로그인
  signInWithGoogle() {
    Get.find<AuthController>().signInWithGoogle();
  }

  //로그인 버튼 활성화
  activateLoginButton() {
    if (emailController.text.isNotEmpty && pwController.text.isNotEmpty) {
      isButtonActivated(true);
    } else {
      isButtonActivated(false);
    }
  }
}
