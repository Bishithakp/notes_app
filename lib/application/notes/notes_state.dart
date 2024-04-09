part of 'notes_bloc.dart';

class NotesState {
  final List<NotesModel> notes;
  final bool isLoading;
  final bool error;
  final bool isInit;

  const NotesState(
      {this.notes = const [],
      this.isLoading = false,
      this.error = false,
      this.isInit = true});

  NotesState copyWith(
      {List<NotesModel>? notes, bool? isLoading, bool? error, bool? isInit}) {
    return NotesState(
        notes: notes ?? this.notes,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        isInit: isInit ?? this.isInit);
  }
}
