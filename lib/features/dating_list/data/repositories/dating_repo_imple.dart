import 'package:matchify/features/dating_list/data/models/dating_model.dart';
import 'package:matchify/features/dating_list/data/sources/remote/dating_api_service.dart';
import 'package:matchify/features/dating_list/domain/entities/dating_entity.dart';
import 'package:matchify/features/dating_list/domain/repositories/date_repository.dart';

class DatingRepoImple implements DateRepository {
  final apiService = DatingApiService();

  @override
  Future<List<DatingEntity>> getDatingEvents() async {
    try {
      DatingModel model = await apiService.fetchDatingEvents();
      return model.toEntityList();
    } catch (e) {
      throw Exception("Repository Error: $e");
    }
  }
}
