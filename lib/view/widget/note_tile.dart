import 'package:diary_app/model/note.dart';
import 'package:diary_app/util/custom_color.dart';
import 'package:diary_app/util/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key, required this.note, required this.onTap});

  final Note note;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        style: CustomTextStyle.b1BoldBlack,
                        note.title,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        style: CustomTextStyle.b3RegularGrey,
                        DateFormat('yyyy.MM.dd').format(note.createAt),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyle.b1RegularOlive,
                    maxLines: 2,
                    note.content,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Container(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(
                color: CustomColor.grey,
                borderRadius: BorderRadius.circular(16),
                image: note.imageUrl != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          note.imageUrl!,
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
