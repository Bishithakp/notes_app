import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/application/bloc_exports.dart';
import 'package:notes_app/core/app_colors.dart';
import 'package:notes_app/core/app_text_style.dart';
import 'package:notes_app/domain/notes_model.dart';
import 'package:notes_app/presentation/widgets/snackbar_message.dart';

import '../../core/app_styles.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note",),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<NotesBloc, NotesState>(builder: (context, state) {
          if (state.isInit) {
            _noteController.clear();
            _descriptionController.clear();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSideHeading('Note:'),
                TextField(
                  controller: _noteController,
                  decoration: textFieldDecoration.copyWith(
                    hintText: 'Enter your note',
                  ),
                ),
                const SizedBox(height: 20.0),
                buildSideHeading('Description:'),
                TextField(
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _descriptionController,
                  decoration: textFieldDecoration.copyWith(
                    hintText: 'Enter your description',
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () {
                              if (_noteController.text.trim() == "") {
                                showSnackBarMessage(
                                    msg: "Enter a note", context: context);
                                    return;
                              }

                              NotesModel note = NotesModel(
                                  title: _noteController.text,
                                  description: _descriptionController.text,
                                  createdDate:
                                      Timestamp.fromDate(DateTime.now()));
                              context
                                  .read<NotesBloc>()
                                  .add(AddNote(note, context));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:AppColors.buttonColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.grey)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: Text(
                              "Add Note",
                              style: AppTextStyle.buttonTextStyle,
                            )))
              ],
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Text buildSideHeading(String label) {
    return Text(label, style: AppTextStyle.sideHeadingTextStyle);
  }
}
