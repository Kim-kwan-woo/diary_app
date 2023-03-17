import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          size: 45,
          color: CustomColor.primaryLime,
          Icons.import_contacts,
        ),
        SizedBox(width: 20),
        Text(
          style: CustomTextStyle.h1BoldOlive,
          'My Diary',
        ),
      ],
    );
  }
}
