import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloctesting/bloc/starships_bloc.dart';
import 'package:flutterbloctesting/model/starship.dart';
import 'package:flutterbloctesting/view/starship.dart';

final resultPayload = {
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
  group("StarshipView", () {
    final List<Starship> starships = [Starship.fromJSON(resultPayload)];
    StarshipsBloc starshipsBloc;

    setUp(() {
      // Mock StarshipsBloc
    });

    testWidgets(
        "when state is StarshipsLoading should render a CircularLoadingProgress",
        (WidgetTester tester) async {
      // TODO
    });

    testWidgets(
        "when state is StarshipsLoaded should render a list view of starships item",
        (WidgetTester tester) async {
      // @TODO
    });

    testWidgets(
        "when state is StarshipsFailure should render a text with error message & a button to retry",
        (WidgetTester tester) async {
      // @TODO
    });
  });
}
