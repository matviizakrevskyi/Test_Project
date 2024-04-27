import 'package:dio/dio.dart';

class IpAPIDatasource {
  final Dio _dio = Dio();
  final String baseUrl = 'http://ip-api.com/json/';

  Future<dynamic> getData() async {
    try {
      final response = await _dio.get(baseUrl);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
