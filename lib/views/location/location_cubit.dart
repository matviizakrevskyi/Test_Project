import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:test_project/usecases/get_location_data.dart';
import 'package:test_project/views/location/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  late final MapController mapController;

  LocationCubit() : super(LocationState(true, null)) {
    mapController = MapController();
    fetchData();
  }

  fetchData() async {
    emit(state.copyWith(isLoading: true));
    final getDataUseCase = GetLocationDataUseCase();
    final location = await getDataUseCase.execute();
    emit(state.copyWith(locationData: location, isLoading: false));
  }
}
