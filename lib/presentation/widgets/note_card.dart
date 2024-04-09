import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../core/app_colors.dart';
import '../../core/app_text_style.dart';
import '../../core/navigation.dart';
import '../../domain/notes_model.dart';
import '../screens/notes_details_screen.dart';

class NoteCard extends StatelessWidget {
  final NotesModel note;
  final int index;
  const NoteCard({super.key, required this.note, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => toPage(context, NotesDetailsScreen(note: note,
         color: AppColors.colors[index % AppColors.colors.length])),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                color: AppColors.colors[index % AppColors.colors.length],
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(note.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.titleTextStyle),
                ),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(note.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.descriptionTextStyle),
                  ),
                ),
              ],
            )));
  }
}
