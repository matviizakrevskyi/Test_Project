import 'package:test_project/datasources/ip_api_datasource.dart';
import 'package:test_project/models/location.dart';

class GetLocationDataUseCase {
  GetLocationDataUseCase();

  Future<Location> execute() async {
    final api = IpAPIDatasource();
    final data = await api.getData();
    final location = Location.fromJson(data);
    return location;
  }
}
