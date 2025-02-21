import 'package:matchify/features/dating_list/domain/entities/dating_entity.dart';
import 'package:matchify/features/dating_list/domain/repositories/date_repository.dart';

class GetDatingEvents {
  late final DateRepository repository;

  Future<List<DatingEntity>> call() async {
    return await repository.getDatingEvents();
  }
}
