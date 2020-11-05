import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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

class MockStarshipsBloc extends MockBloc<StarshipsBloc>
    implements StarshipsBloc {}

void main() {
  group("StarshipView", () {
    final List<Starship> starships = [Starship.fromJSON(resultPayload)];
    // ignore: close_sinks
    StarshipsBloc starshipsBloc;

    setUp(() {
      starshipsBloc = MockStarshipsBloc();
    });

    testWidgets(
        "when state is StarshipsLoading should render a CircularLoadingProgress",
        (WidgetTester tester) async {
      when(starshipsBloc.state).thenAnswer((_) => StarshipsLoading());

      await tester.pumpWidget(
        BlocProvider<StarshipsBloc>(
          create: (_) => starshipsBloc,
          child: MaterialApp(
            home: Scaffold(
              body: StarshipView(),
            ),
          ),
        ),
      );

      await tester.pump();
      expect(
          find.byKey(Key("StarshipCircularLoadingProgress")), findsOneWidget);
    });

    testWidgets(
        "when state is StarshipsLoaded should render a list view of starships item",
        (WidgetTester tester) async {
      when(starshipsBloc.state).thenAnswer((_) => StarshipsLoaded(starships));

      await tester.pumpWidget(
        BlocProvider<StarshipsBloc>(
          create: (_) => starshipsBloc,
          child: MaterialApp(
            home: Scaffold(
              body: StarshipView(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(Key("StarshipListView")), findsOneWidget);
      expect(find.text(starships[0].name), findsOneWidget);
    });

    testWidgets(
        "when state is StarshipsFailure should render a text with error message & a button to retry",
        (WidgetTester tester) async {
      when(starshipsBloc.state)
          .thenAnswer((_) => StarshipsFailure("Failed to load starships data"));

      await tester.pumpWidget(
        BlocProvider<StarshipsBloc>(
          create: (_) => starshipsBloc,
          child: MaterialApp(
            home: Scaffold(
              body: StarshipView(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final errorMessageFinder = find.text("Failed to load starships data");
      final retryButtonFinder = find.text("Retry");

      expect(find.byKey(Key("StarshipListView")), findsNothing);
      expect(errorMessageFinder, findsOneWidget);
      expect(retryButtonFinder, findsOneWidget);

      // tap the retry button to trigger StarshipsEventFetch()
      await tester.tap(retryButtonFinder);
      verify(starshipsBloc.add(StarshipsEventFetch()));
    });
  });
}
