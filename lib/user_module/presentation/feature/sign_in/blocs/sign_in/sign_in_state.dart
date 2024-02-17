part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}

class SignInSubmitting extends SignInState {}

class SignInSuccess extends SignInState {
  final AuthenticatedUser authenticatedUser;

  const SignInSuccess({
    required this.authenticatedUser,
  });

  @override
  List<Object?> get props => [
    authenticatedUser
    ];
}

class SignInFailed extends SignInState {
  final String message;

  const SignInFailed({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
