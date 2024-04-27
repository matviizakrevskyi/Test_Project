import 'package:test_project/models/location.dart';

class LocationState {
  final bool isLoading;
  final Location? locationData;

  LocationState(this.isLoading, this.locationData);

  LocationState copyWith({bool? isLoading, Location? locationData, double? lat}) => LocationState(
      isLoading ?? this.isLoading, locationData ?? this.locationData);
}
