import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.backgroundColor,
      required this.childText,
      required this.onPressed,
      this.isActivated = true});

  final Color backgroundColor; //배경 색
  final String childText; //텍스트
  final VoidCallback onPressed; //onPressed 이벤트
  final bool isActivated; //버튼 활성화 여부

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: isActivated ? onPressed : null,
      child: Text(
        style: backgroundColor == CustomColor.primaryLime
            ? CustomTextStyle.b1BoldBlack
            : CustomTextStyle.b1BoldWhite,
        childText,
      ),
    );
  }
}
