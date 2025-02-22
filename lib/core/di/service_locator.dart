import 'package:get_it/get_it.dart';
import 'package:matchify/features/dating_list/data/repositories/dating_repo_imple.dart';
import 'package:matchify/features/dating_list/data/sources/remote/dating_api_service.dart';
import 'package:matchify/features/dating_list/domain/repositories/date_repository.dart';
import 'package:matchify/features/dating_list/domain/usecases/get_dating_events.dart';
import 'package:matchify/features/dating_list/presentation/bloc/dating_cubit.dart';

final sl = GetIt.instance;

void setUpLocator() {
  sl.registerLazySingleton(() => DatingApiService());

  sl.registerLazySingleton(() => DatingCubit(GetDatingEvents(DatingRepoImple())));

  // Register Repository
  sl.registerLazySingleton<DateRepository>(
    () => DatingRepoImple(),
  );

  // Register Use Case
  sl.registerLazySingleton(
    () => GetDatingEvents(sl<DateRepository>()),
  );
}
