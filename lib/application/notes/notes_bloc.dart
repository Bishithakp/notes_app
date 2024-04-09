import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:notes_app/domain/notes_model.dart';

import '../../infrastructure/notes_repo.dart';
import '../../presentation/widgets/snackbar_message.dart';

part 'notes_event.dart';

part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository noteRepository;

  NotesBloc(this.noteRepository) : super(const NotesState()) {
    on<NotesEvent>((event, emit) async {
      if (event is LoadNotes) {
        emit(state.copyWith(isLoading: true));
        try {
          final notes = await noteRepository.getAllNotes();
          emit(state.copyWith(notes: notes, isLoading: false));
        } catch (e) {
          emit(state.copyWith(error: true, isLoading: false));
        }
      } else if (event is AddNote) {
        emit(state.copyWith(isLoading: true));
        try {
          await noteRepository.addNote(event.note).then((message) async {
            if (event.context.mounted) {
              showSnackBarMessage(msg: message, context: event.context);
            }
            emit(state.copyWith(isInit: true));

            final notes = await noteRepository.getAllNotes();
            emit(state.copyWith(notes: notes, isLoading: false));
          });
        } catch (e) {
          emit(state.copyWith(error: true, isLoading: false));
        }
      }
      // else if (event is DeleteNote) {
      //   emit(state.copyWith(isLoading: true));
      //   try {
      //     await noteRepository.deleteNote(event.noteId);
      //     final notes = await noteRepository.getAllNotes();
      //     emit(state.copyWith(notes: notes, isLoading: false));
      //   } catch (e) {
      //     emit(state.copyWith(error: true, isLoading: false));
      //   }
      // }
    });
  }
}
