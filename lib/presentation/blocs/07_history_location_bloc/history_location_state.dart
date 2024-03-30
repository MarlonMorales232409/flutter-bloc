part of 'history_location_bloc.dart';

class HistoryLocationState extends Equatable {

  final List<(double lat, double lng)> locations;

  const HistoryLocationState({this.locations = const []});

  int get howManyLocations => locations.length;

  HistoryLocationState copyWith({
    List<(double lat, double lng)>? locations,
  }) {
    return HistoryLocationState(
      locations: locations ?? this.locations,
    );
  }

    @override
  List<Object> get props => [ locations ];

}
