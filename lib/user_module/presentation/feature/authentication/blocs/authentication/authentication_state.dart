part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthenticationState {
  final AuthenticatedUser? authenticatedUser;

  const Authenticated({
    required this.authenticatedUser,
  });

  @override
  List<Object?> get props => [authenticatedUser];
}

class UnAuthenticated extends AuthenticationState {}
