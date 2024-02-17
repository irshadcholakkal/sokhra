part of 'variant_cubit.dart';

abstract class VariantState extends Equatable {
  const VariantState();
  @override
  List<Object?> get props => [];
}

class VariantLoadingState extends VariantState {}

class VariantLoadedState extends VariantState {
  final Variant? variant;
  final SubChoice? subChoice;

  VariantLoadedState({required this.variant, this.subChoice});

  @override
  List<Object?> get props => [variant,subChoice];
}
// class SubChoiceLoadedState extends VariantState {
//   final Variant? variant;
//   final SubChoice? subChoice;
//
//   SubChoiceLoadedState({required this.subChoice, this.variant});
//
//   @override
//   List<Object?> get props => [this.subChoice,variant];
// }
