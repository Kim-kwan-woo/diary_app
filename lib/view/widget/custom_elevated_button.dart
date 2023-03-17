import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.backgroundColor, required this.childText});

  final Color backgroundColor;
  final String childText;

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
      onPressed: () {},
      child: Text(
        style: backgroundColor == CustomColor.primaryLime
            ? CustomTextStyle.b1BoldBlack
            : CustomTextStyle.b1BoldWhite,
        childText,
      ),
    );
  }
}
