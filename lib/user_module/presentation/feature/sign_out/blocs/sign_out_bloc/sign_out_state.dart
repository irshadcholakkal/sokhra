part of 'sign_out_bloc.dart';

abstract class SignOutState extends Equatable {
  const SignOutState();
  @override
  List<Object> get props => [];
}
class SignOutInitial extends SignOutState {}

class SignOutInProgress extends SignOutState {}

class SignOutSuccess extends SignOutState {
  final String message;

  const SignOutSuccess({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class SignOutFailed extends SignOutState {
  final String message;

  const SignOutFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
