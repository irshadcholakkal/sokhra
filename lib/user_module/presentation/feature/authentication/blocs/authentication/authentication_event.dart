part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignedIn extends AuthenticationEvent {}

class SignedOut extends AuthenticationEvent {}
