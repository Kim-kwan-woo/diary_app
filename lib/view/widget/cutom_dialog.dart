import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      required this.middleText,
      required this.onConfirm,
      required this.onCancel});

  final String middleText; //중간 내용 텍스트
  final VoidCallback onConfirm; //확인 이벤트
  final VoidCallback onCancel; //취소 이벤트

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        width: 260,
        height: 260,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  style: CustomTextStyle.b1RegularBlack,
                  textAlign: TextAlign.center,
                  middleText,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //확인 버튼
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: CustomColor.black),
                    onPressed: onConfirm,
                    child: const Text('확인'),
                  ),
                  const SizedBox(width: 40),
                  //취소 버튼
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: CustomColor.black),
                    onPressed: onCancel,
                    child: const Text('취소'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
