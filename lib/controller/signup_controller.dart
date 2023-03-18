import 'package:diary_app/controller/auth_controller.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var emailController = TextEditingController(); //이메일 컨트롤러
  var pwController = TextEditingController(); //패스워드 컨트롤러
  var pwConfirmController = TextEditingController(); //패스워드 확인 컨트롤러

  Rxn<String> emailError = Rxn<String>(); //이메일 에러 메세지
  Rxn<String> pwError = Rxn<String>(); //패스워드 에러 메세지
  Rxn<String> pwConfirmError = Rxn<String>(); //패스워드 확인 에러 메세지

  RxBool isButtonActivated = false.obs;

  //회원가입
  signup() async {
    if (await Get.find<AuthController>()
        .signup(emailController.text, pwController.text)) {
      Get.snackbar(
        '회원가입 성공',
        '회원가입이 완료되었습니다.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: CustomColor.black,
        colorText: CustomColor.white,
      );
    } else {
      Get.snackbar(
        '회원가입 실패',
        '회원가입에 실패했습니다.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: CustomColor.black,
        colorText: CustomColor.white,
      );
    }
  }

  //이메일 형식 체크
  checkEmailValidation(String value) {
    if (value.isNotEmpty &&
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      emailError('이메일 형식이 맞지 않습니다.');
    } else {
      emailError.value = null;
    }
    activeSignupButton();
  }

  //비밀번호 형식 체크
  checkPasswordValidation(String value) {
    if (value.isNotEmpty && value.length < 8) {
      pwError('비밀번호는 8자리 이상이어야 합니다.');
    } else {
      pwError.value = null;
    }
    activeSignupButton();
  }

  //비밀번호 확인 형식 체크
  checkPasswordConfirmValidation(String value) {
    if (value.isNotEmpty && value != pwController.text) {
      pwConfirmError('비밀번호가 일치하지 않습니다.');
    } else {
      pwConfirmError.value = null;
    }
    activeSignupButton();
  }

  //회원가입 버튼 활성화
  activeSignupButton() {
    if (emailController.text.isNotEmpty &&
        pwController.text.isNotEmpty &&
        pwConfirmController.text.isNotEmpty &&
        emailError.value == null &&
        pwError.value == null &&
        pwConfirmError.value == null) {
      isButtonActivated.value = true;
    } else {
      isButtonActivated.value = false;
    }
  }
}
