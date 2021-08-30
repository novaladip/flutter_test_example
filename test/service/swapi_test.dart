import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloctesting/model/starship.dart';
import 'package:flutterbloctesting/service/swapi.dart';

class DioAdapterMock extends HttpClientAdapter {
  @override
  void close({bool force = false}) {
    // TODO: implement close
  }

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<Uint8List>? requestStream, Future? cancelFuture) {
    // TODO: implement fetch
    throw UnimplementedError();
  }
}

final responseJson = {
  "name": "TIE Advanced x1",
  "model": "Twin Ion Engine Advanced x1",
  "manufacturer": "Sienar Fleet Systems",
  "cost_in_credits": "unknown",
  "length": "9.2",
  "max_atmosphering_speed": "1200",
  "crew": "1",
  "passengers": "0",
  "cargo_capacity": "150",
  "consumables": "5 days",
  "hyperdrive_rating": "1.0",
  "MGLT": "105",
  "starship_class": "Starfighter",
  "pilots": ["http://swapi.dev/api/people/4/"],
  "films": ["http://swapi.dev/api/films/1/"],
  "created": "2014-12-12T11:21:32.991000Z",
  "edited": "2014-12-20T21:23:49.889000Z",
  "url": "http://swapi.dev/api/starships/13/"
};

void main() {
  final Dio dio = Dio();
  SwapiService swapiService;
  DioAdapterMock dioAdapterMock;

  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    swapiService = SwapiService(dio);
  });

  test(
      'swapiService.fetchStarships when fetch is successfull should return a List of Starship object',
      () async {
    final responseJson = {
      "name": "TIE Advanced x1",
      "model": "Twin Ion Engine Advanced x1",
      "manufacturer": "Sienar Fleet Systems",
      "cost_in_credits": "unknown",
      "length": "9.2",
      "max_atmosphering_speed": "1200",
      "crew": "1",
      "passengers": "0",
      "cargo_capacity": "150",
      "consumables": "5 days",
      "hyperdrive_rating": "1.0",
      "MGLT": "105",
      "starship_class": "Starfighter",
      "pilots": ["http://swapi.dev/api/people/4/"],
      "films": ["http://swapi.dev/api/films/1/"],
      "created": "2014-12-12T11:21:32.991000Z",
      "edited": "2014-12-20T21:23:49.889000Z",
      "url": "http://swapi.dev/api/starships/13/"
    };

    final responsePayload = json.encode({
      "count": 36,
      "next": "http://swapi.dev/api/starships/?page=2",
      "previous": null,
      "results": [responseJson],
    });

    final httpResponse = ResponseBody.fromString(
      responsePayload,
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  });
}
