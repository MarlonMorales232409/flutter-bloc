import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_location_event.dart';
part 'history_location_state.dart';

class HistoryLocationBloc extends Bloc<HistoryLocationEvent, HistoryLocationState> {
  HistoryLocationBloc() : super(const HistoryLocationState()) {
    on<NewLocationEvent>(_newLocationHandler);
  }

  /// *** Event Callers ***

  void onNewLocation((double lat, double lng) location) => add(NewLocationEvent(location));


  /// *** Event Handlers ***

  void _newLocationHandler(NewLocationEvent event, Emitter<HistoryLocationState> emit) {
    emit(state.copyWith(locations: [event.newLocation, ...state.locations]));
  }
}
