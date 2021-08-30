import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloctesting/model/starship.dart';

void main() {
  test("Starship should return true when comparing 2 object with same value",
      () {
    final dateTime = DateTime.now();

    final starshipOne = Starship(
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
      created: dateTime,
      edited: dateTime,
      url: "https://swapi.dev/api/starships/",
    );

    final starshipTwo = Starship(
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
      created: dateTime,
      edited: dateTime,
      url: "https://swapi.dev/api/starships/",
    );

    expect(starshipTwo, starshipOne);
  });

  test('fromJson', () {
    final starship = Starship(
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
    );

    final starshipFromJSON = Starship.fromJSON({
      'name': starship.name,
      'model': starship.model,
      'manufacturer': starship.manufactur,
      'cost_in_credits': starship.costInCredits,
      'length': starship.length,
      'max_atmosphering_speed': starship.maxAtmospheringSpeed,
      'crew': starship.crew,
      'passengers': starship.passengers,
      'cargo_capacity': starship.cargoCapacity,
      'consumables': starship.consumables,
      'hyperdrive_rating': starship.hyperdriveRating,
      'MGLT': starship.mglt,
      'starship_class': starship.starshipClass,
      'pilots': starship.pilots,
      'films': starship.films,
      'created': starship.created.toString(),
      'edited': starship.edited.toString(),
      'url': starship.url,
    });

    expect(starship, starshipFromJSON);
  });
}
