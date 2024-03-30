part of 'geolocation_cubit.dart';

class GeolocationState extends Equatable {
  const GeolocationState({
    this.location = const (0, 0),
    this.permissionGranted = false,
    this.serviceEnabled = false,
  });

  final (double lat, double lng) location;
  final bool serviceEnabled;
  final bool permissionGranted;

  GeolocationState copyWith({
    (double lat, double lng)? location,
    bool? permissionGranted,
    bool? serviceEnabled,
  }) => GeolocationState(
    location: location ?? this.location,
    permissionGranted: permissionGranted ?? this.permissionGranted,
    serviceEnabled: serviceEnabled ?? this.serviceEnabled,
  );

  @override
  List<Object> get props => [
        location,
        permissionGranted,
        serviceEnabled,
      ];
}