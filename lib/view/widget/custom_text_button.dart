import 'package:diary_app/util/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.childText, required this.onPressed});

  final String childText; //버튼 텍스트
  final VoidCallback onPressed; //onPressed 이벤트

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        style: CustomTextStyle.b1RegularBlack,
        childText,
      ),
    );
  }
}
