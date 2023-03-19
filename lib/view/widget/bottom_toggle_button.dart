import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomToggleButton extends StatelessWidget {
  const BottomToggleButton(
      {super.key, required this.selections, required this.onPressed});

  final List<bool> selections;
  final Function(int)? onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: CustomColor.primaryOlive,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: Obx(
            () => ToggleButtons(
              fillColor: CustomColor.primaryLime,
              selectedColor: CustomColor.black,
              color: CustomColor.white,
              textStyle: CustomTextStyle.b1BoldBlack,
              borderWidth: 0,
              constraints:
                  BoxConstraints.expand(width: constraints.maxWidth / 2),
              onPressed: onPressed,
              isSelected: selections,
              children: const [
                Text('다이어리'),
                Text('내 정보'),
              ],
            ),
          ),
        );
      },
    );
  }
}
