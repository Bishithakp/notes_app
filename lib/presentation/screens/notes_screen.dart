import 'package:flutter/material.dart';

import '../../application/bloc_exports.dart';
import '../../core/app_colors.dart';
import '../../core/navigation.dart';
import '../widgets/note_card.dart';
import 'add_note_screen.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NotesBloc>().add(LoadNotes());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Notes',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BlocBuilder<NotesBloc, NotesState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.error) {
                return const Text('Error loading notes');
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (1 / .7),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: state.notes.length,
                  itemBuilder: (context, index) {
                    final note = state.notes[index];
                    return NoteCard(
                      note: note,
                      index: index,
                    );
                  },
                );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text(
            'Add Note',
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: AppColors.buttonColor,
          onPressed: () => toPage(context, const AddNoteScreen()),
        ));
  }
}
