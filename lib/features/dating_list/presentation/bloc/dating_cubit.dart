import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchify/features/dating_list/domain/usecases/get_dating_events.dart';
import 'package:matchify/features/dating_list/presentation/bloc/dating_state.dart';

class DatingCubit extends Cubit<DatingState> {
  final GetDatingEvents getDatingEvents;

  DatingCubit(this.getDatingEvents) : super(InitialState());

  Future<void> attemptToLoadData() async {
    emit(LoadingState());
    try {
      final dates = await getDatingEvents();
      emit(LoadedState(dates));
    } catch (e) {
      emit(FailureState("Failed to load events"));
    }
  }
}
