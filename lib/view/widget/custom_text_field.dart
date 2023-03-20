import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.obscureText = false,
    this.errorText,
    this.maxLines = 1,
  });

  final String hintText; //힌트 텍스트
  final TextEditingController controller; //텍스트필드 컨트롤러
  final Function(String)? onChanged;
  final bool obscureText;
  String? errorText; //오류 메세지
  int? maxLines; //텍스트 필드 줄 수

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: CustomTextStyle.b1RegularGrey,
        errorText: errorText,
        errorStyle: CustomTextStyle.b2RegularOlive,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: CustomColor.grey,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 2.0,
            color: CustomColor.primaryOlive,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: CustomColor.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 2.0,
            color: CustomColor.primaryOlive,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
