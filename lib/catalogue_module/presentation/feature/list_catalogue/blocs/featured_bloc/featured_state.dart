part of 'featured_bloc.dart';

abstract class FeaturedState extends Equatable {
  const FeaturedState();

  @override
  List<Object> get props => [];
}

class FeaturedLoading extends FeaturedState {}

class FeaturedLoadedSuccess extends FeaturedState {
  final ProductList data;

  FeaturedLoadedSuccess({
    required this.data,
  });

  @override
  List<Object> get props => [
        data,
      ];
}

class FeaturedLoadedFailed extends FeaturedState {
  final String error;

  FeaturedLoadedFailed({required this.error});

  @override
  List<Object> get props => [error];
}
