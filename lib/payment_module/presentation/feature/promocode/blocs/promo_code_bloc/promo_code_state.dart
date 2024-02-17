part of 'promo_code_bloc.dart';

abstract class PromoCodeState extends Equatable {
  const PromoCodeState();
  @override
  List<Object> get props => [];
}

class PromoCodeInitial extends PromoCodeState {}

class PromoCodeApplyLoading extends PromoCodeState {}

class PromoCodeApplySuccess extends PromoCodeState {
  final PromoCodeInfo response;

  PromoCodeApplySuccess({required this.response});
  @override
  List<Object> get props => [response];
}

class PromoCodeApplyFailed extends PromoCodeState {
  final String message;

  PromoCodeApplyFailed({required this.message});

  @override
  List<Object> get props => [message];
}
