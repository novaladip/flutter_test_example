import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloctesting/model/starship.dart';

void main() {
  setUp(() {});

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

  // tests when swapiService.fetchStartships() is successful
  // tests when swapiService.fetchStartships() is failure
}
