import 'package:dio/dio.dart';
import 'package:flutterbloctesting/model/starship.dart';

class SwapiService {
  final Dio dio;

  const SwapiService(this.dio);

  Future<List<Starship>> fetchStartships() async {
    try {
      final res = await dio.get('https://swapi.dev/api/starships');
      final data = res.data['results'];
      final List<Starship> starships =
          (data as List).map((json) => Starship.fromJSON(json)).toList();

      return starships;
    } catch (e) {
      throw e;
    }
  }
}
