part of 'starships_bloc.dart';

abstract class StarshipsEvent extends Equatable {
  const StarshipsEvent();
}

class StarshipsEventFetch extends StarshipsEvent {
  @override
  List<Object> get props => [];
}
