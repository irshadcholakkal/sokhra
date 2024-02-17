part of 'carousal_bloc.dart';

abstract class CarousalEvent extends Equatable {
  const CarousalEvent();
}

class CarousalFetchEvent extends CarousalEvent {
  final bool reFetch;

  CarousalFetchEvent({this.reFetch = false});

  @override
  List<Object?> get props => [reFetch];
}
