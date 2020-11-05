import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutterbloctesting/service/swapi.dart';
import 'package:flutterbloctesting/model/starship.dart';

part 'starships_event.dart';
part 'starships_state.dart';

class StarshipsBloc extends Bloc<StarshipsEvent, StarshipsState> {
  final SwapiService _swapiService;

  StarshipsBloc(this._swapiService) : super(StarshipsLoading());

  @override
  Stream<StarshipsState> mapEventToState(
    StarshipsEvent event,
  ) async* {
    if (event is StarshipsEventFetch) {
      try {
        yield StarshipsLoading();
        final starships = await _swapiService.fetchStartships();
        yield StarshipsLoaded(starships);
      } catch (e) {
        yield StarshipsFailure("Failed to load starships data");
      }
    }
  }
}
