import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloctesting/bloc/starships_bloc.dart';
import 'package:flutterbloctesting/model/starship.dart';
import 'package:flutterbloctesting/service/swapi.dart';
import 'package:mockito/mockito.dart';

class MockSwapiService extends Mock implements SwapiService {}

void main() {
  MockSwapiService mockSwapiService;

  setUp(() {
    mockSwapiService = MockSwapiService();
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

  blocTest<StarshipsBloc, StarshipsState>(
    'emits StarshipState with [StarshipLoading, StarshipLoaded] when StarshipEventFetch successfull',
    build: () {
      when(mockSwapiService.fetchStartships())
          .thenAnswer((_) async => starships);
      return StarshipsBloc(mockSwapiService);
    },
    act: (bloc) => bloc.add(StarshipsEventFetch()),
    expect: [
      StarshipsLoading(),
      StarshipsLoaded(starships),
    ],
  );

  blocTest<StarshipsBloc, StarshipsState>(
      'emits StarshipState with [StarshipLoading, StarshipFailure] when StarshipEventFetch unsuccessfull',
      build: () {
        when(mockSwapiService.fetchStartships())
            .thenThrow((_) async => "Failed to load starships data");
        return StarshipsBloc(mockSwapiService);
      },
      act: (bloc) => bloc.add(StarshipsEventFetch()),
      expect: [
        StarshipsLoading(),
        StarshipsFailure(errorMessage),
      ]);

  test("StarshipEventFetch should return true when comparing to other object",
      () {
    final firstEvent = StarshipsEventFetch();
    final secondEvent = StarshipsEventFetch();

    expect(firstEvent, secondEvent);
  });
}
