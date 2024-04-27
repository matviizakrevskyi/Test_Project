import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/views/location/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState(false));
}
