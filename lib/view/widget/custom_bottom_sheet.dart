import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:flutter/material.dart';

enum BottomSheetType { first, second }

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.firstOnPressed,
      required this.secondOnPressed});

  final String firstText;
  final String secondText;
  final VoidCallback firstOnPressed;
  final VoidCallback secondOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      decoration: const BoxDecoration(
        color: CustomColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: firstOnPressed,
            child: Text(
              style: CustomTextStyle.b1RegularBlack,
              firstText,
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: secondOnPressed,
            child: Text(
              style: CustomTextStyle.b1RegularBlack,
              secondText,
            ),
          ),
        ],
      ),
    );
  }
}
