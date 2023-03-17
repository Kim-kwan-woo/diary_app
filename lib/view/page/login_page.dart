import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:diary_app/view/widget/app_logo.dart';
import 'package:diary_app/view/widget/custom_elevated_button.dart';
import 'package:diary_app/view/widget/custom_text_button.dart';
import 'package:diary_app/view/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              style: CustomTextStyle.h2BoldBlack,
              '매일 쓰는\n나만의 다이어리',
            ),
            SizedBox(height: 10),
            AppLogo(),
            SizedBox(height: 40),
            //이메일 입력 필드
            CustomTextField(hintText: '이메일을 입력하세요.'),
            SizedBox(height: 20),
            //비밀번호 입력 필드
            CustomTextField(hintText: '비밀번호를 입력하세요.'),
            SizedBox(height: 46),
            //이메일 로그인 버튼
            CustomElevatedButton(
              backgroundColor: CustomColor.primaryOlive,
              childText: '로그인',
            ),
            SizedBox(height: 10),
            //구글 로그인 버튼
            CustomElevatedButton(
              backgroundColor: CustomColor.primaryLime,
              childText: '구글로 로그인하기',
            ),
            //회원가입 버튼
            Align(
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                childText: '회원가입',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
