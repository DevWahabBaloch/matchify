import 'package:matchify/features/dating_list/domain/entities/dating_entity.dart';

abstract class DatingState {}

class InitialState extends DatingState {}

class LoadingState extends DatingState {}

class LoadedState extends DatingState {
  final List<DatingEntity> events;
  LoadedState(this.events);
}

class FailureState extends DatingState {
  final String message;
  FailureState(this.message);
}
