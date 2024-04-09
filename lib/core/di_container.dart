import 'package:get_it/get_it.dart';

import '../infrastructure/notes_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<NotesRepository>(
    () => LocalNoteRepository(),
  );
  // sl.registerLazySingleton(() => LocalNoteRepository());
}
