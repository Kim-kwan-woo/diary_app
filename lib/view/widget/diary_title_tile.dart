import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:flutter/material.dart';

enum NoteViewState { view, edit }

class DiaryTitleTile extends StatelessWidget {
  DiaryTitleTile(
      {super.key,
      required this.title,
      required this.onPressed,
      this.state = NoteViewState.view});

  final String title;
  final VoidCallback onPressed;
  NoteViewState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: CustomColor.white,
            border: Border.all(
              color: CustomColor.primaryOlive,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                blurRadius: 5.0,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              style: CustomTextStyle.b1BoldBlack,
              title,
            ),
          ),
        ),
        if (state == NoteViewState.view)
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: IconButton(
              splashRadius: 1,
              onPressed: onPressed,
              icon: const Icon(
                Icons.more_vert,
              ),
            ),
          ),
      ],
    );
  }
}
