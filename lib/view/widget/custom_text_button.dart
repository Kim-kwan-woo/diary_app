import 'package:diary_app/util/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.childText});

  final String childText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        style: CustomTextStyle.b1RegularBlack,
        childText,
      ),
    );
  }
}
