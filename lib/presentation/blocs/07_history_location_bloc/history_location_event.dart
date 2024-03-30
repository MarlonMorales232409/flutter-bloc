part of 'history_location_bloc.dart';

sealed class HistoryLocationEvent extends Equatable {
  const HistoryLocationEvent();

  @override
  List<Object> get props => [];
}


class NewLocationEvent extends HistoryLocationEvent {
  final (double lat, double lng) newLocation;
  const NewLocationEvent(this.newLocation);

  @override
  List<Object> get props => [newLocation];
}