import 'package:bloc_test/bloc_test.dart';
import 'package:flutterbloctesting/service/swapi.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloctesting/bloc/starships_bloc.dart';
import 'package:flutterbloctesting/model/starship.dart';

class MockStarshipsBloc extends MockBloc<StarshipsEvent, StarshipsState>
    implements StarshipsBloc {}

class FakeStartshipsEvent extends Fake implements StarshipsEvent {}

class FakeStartshipsState extends Fake implements StarshipsState {}

class MockSwapiService extends Mock implements SwapiService {}

void setUpFakeStarshipsBloc() {
  registerFallbackValue(FakeStartshipsEvent());
  registerFallbackValue(FakeStartshipsState());
}

void main() {
  late SwapiService swapiService;

  setUp(() {
    swapiService = MockSwapiService();
  });

  setUpAll(() {
    setUpFakeStarshipsBloc();
  });

  final errorMessage = "Failed to load starships data";
  final starships = [
    Starship(
      name: "TIE Advanced x1",
      model: "Twin Ion Engine Advanced x1",
      manufactur: "Sienar Fleet Systems",
      costInCredits: "unknown",
      length: "9.2",
      maxAtmospheringSpeed: "1200",
      crew: "1",
      passengers: "0",
      cargoCapacity: "150",
      consumables: "5 days",
      hyperdriveRating: "1.0",
      mglt: "105",
      starshipClass: "Starfighter",
      pilots: [],
      films: [],
      created: DateTime.now(),
      edited: DateTime.now(),
      url: "https://swapi.dev/api/starships/",
    ),
  ];

  group('StarshipsBloc', () {
    // tests when swapiService.fetchStartships() is successful
    blocTest<StarshipsBloc, StarshipsState>(
      'when StarshipsEventFetch is success',
      build: () {
        // mock result value
        when(() => swapiService.fetchStartships()).thenAnswer(
          (_) async => starships,
        );
        return StarshipsBloc(swapiService);
      },
      act: (bloc) => bloc.add(StarshipsEventFetch()),
      expect: () => [
        StarshipsLoading(),
        StarshipsLoaded(starships),
      ],
      verify: (bloc) {
        verify(() => swapiService.fetchStartships()).called(1);
      },
    );

    // tests when swapiService.fetchStartships() is failure
    blocTest<StarshipsBloc, StarshipsState>(
      'when StarshipsEventFetch is failure',
      build: () {
        // mock result value
        when(() => swapiService.fetchStartships()).thenAnswer(
          (_) async => throw errorMessage,
        );
        return StarshipsBloc(swapiService);
      },
      act: (bloc) => bloc.add(StarshipsEventFetch()),
      expect: () => [
        StarshipsLoading(),
        StarshipsFailure(errorMessage),
      ],
      verify: (bloc) {
        verify(() => swapiService.fetchStartships()).called(1);
      },
    );
  });
}
