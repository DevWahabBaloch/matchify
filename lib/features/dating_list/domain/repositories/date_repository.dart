import 'package:matchify/features/dating_list/domain/entities/dating_entity.dart';

abstract class DateRepository {
  Future<List<DatingEntity>> getDatingEvents();
}
