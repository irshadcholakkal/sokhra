part of 'carousal_bloc.dart';

abstract class CarousalState extends Equatable {
  const CarousalState();

  @override
  List<Object> get props => [];
}

class CarousalLoading extends CarousalState {}

class CarousalLoadedSuccess extends CarousalState {
  final Banners banners;

  CarousalLoadedSuccess({required this.banners});

  @override
  List<Object> get props => [
        banners,
      ];
}

class CarousalLoadedFailed extends CarousalState {
  final String error;

  CarousalLoadedFailed({required this.error});

  @override
  List<Object> get props => [error];
}
