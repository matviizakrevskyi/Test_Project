import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/usecases/get_location_data.dart';
import 'package:test_project/views/location/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState(false));

  getData() async {
    final getDataUseCase = GetLocationDataUseCase();
    final location = await getDataUseCase.execute();
    print(location);
  }
}
