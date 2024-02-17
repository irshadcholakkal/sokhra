part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignIn extends SignInEvent {
  final String password;
  final String phone;

  const SignIn({
    required this.phone,
    required this.password,
  });

  @override
  List<Object> get props => [phone, password];
}
