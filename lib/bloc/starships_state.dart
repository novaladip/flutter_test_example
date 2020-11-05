part of 'starships_bloc.dart';

abstract class StarshipsState extends Equatable {
  const StarshipsState();

  @override
  List<Object> get props => [];
}

class StarshipsLoading extends StarshipsState {}

class StarshipsLoaded extends StarshipsState {
  final List<Starship> data;

  const StarshipsLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class StarshipsFailure extends StarshipsState {
  final String message;

  const StarshipsFailure(this.message);

  @override
  List<Object> get props => [message];
}
