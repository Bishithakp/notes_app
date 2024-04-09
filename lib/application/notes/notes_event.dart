part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotes extends NotesEvent {}


class AddNote extends NotesEvent {
  final NotesModel note;
  final BuildContext context;

  const AddNote(this.note, this.context);

  @override
  List<Object?> get props => [note];
}
