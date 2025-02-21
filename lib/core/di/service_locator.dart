import 'package:get_it/get_it.dart';
import 'package:matchify/features/dating_list/data/repositories/dating_repo_imple.dart';

final sl = GetIt.instance;

void setUpLocator() {
  sl.registerLazySingleton<DatingRepoImple>(() => DatingRepositoryImpl());
}
