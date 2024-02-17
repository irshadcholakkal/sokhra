part of 'sort_cubit.dart';

abstract class SortState extends Equatable {
  const SortState();
  @override
  List<Object?> get props => [];
}

class SortSuccess extends SortState {
  final SortInput? sortInput;

  SortSuccess({required this.sortInput});

  @override
  List<Object?> get props => [sortInput];
}

class SortLoading extends SortState {}
