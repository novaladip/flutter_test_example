import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Starship extends Equatable {
  const Starship({
    @required this.name,
    @required this.model,
    @required this.manufactur,
    @required this.costInCredits,
    @required this.length,
    @required this.maxAtmospheringSpeed,
    @required this.crew,
    @required this.passengers,
    @required this.cargoCapacity,
    @required this.consumables,
    @required this.hyperdriveRating,
    @required this.mglt,
    @required this.starshipClass,
    @required this.pilots,
    @required this.films,
    @required this.created,
    @required this.edited,
    @required this.url,
  });

  final String name;
  final String model;
  final String manufactur;
  final String costInCredits;
  final String length;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String cargoCapacity;
  final String consumables;
  final String hyperdriveRating;
  final String mglt;
  final String starshipClass;
  final List<String> pilots;
  final List<String> films;
  final DateTime created;
  final DateTime edited;
  final String url;

  factory Starship.fromJSON(Map<String, dynamic> json) {
    return Starship(
      name: json['name'],
      model: json['model'],
      manufactur: json['manufacturer'],
      costInCredits: json['cost_in_credits'],
      length: json['length'],
      maxAtmospheringSpeed: json['max_atmosphering_speed'],
      crew: json['crew'],
      passengers: json['passengers'],
      cargoCapacity: json['cargo_capacity'],
      consumables: json['consumables'],
      hyperdriveRating: json['hyperdrive_rating'],
      mglt: json['MGLT'],
      starshipClass: json['starship_class'],
      pilots: (json['pilots'] as List).map((data) => data as String).toList(),
      films: (json['films'] as List).map((data) => data as String).toList(),
      created: DateTime.parse(json['created']),
      edited: DateTime.parse(json['edited']),
      url: json['url'],
    );
  }

  @override
  List<Object> get props => [
        name,
        model,
        manufactur,
        costInCredits,
        length,
        maxAtmospheringSpeed,
        length,
        crew,
        passengers,
        cargoCapacity,
        consumables,
        hyperdriveRating,
        mglt,
        starshipClass,
        pilots,
        films,
        created,
        edited,
        url,
      ];
}
