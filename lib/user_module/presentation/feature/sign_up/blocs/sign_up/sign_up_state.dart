part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpSubmitting extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final AuthenticatedUser authenticatedUser;

  const SignUpSuccess({
    required this.authenticatedUser,
  });

  @override
  List<Object?> get props => [authenticatedUser];
}

class SignUpFailed extends SignUpState {
  final String message;

  const SignUpFailed({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class SendSignUpOtpInProgress extends SignUpState {}

class SendSignUpOtpSuccess extends SignUpState {
  final String response;

  const SendSignUpOtpSuccess({
    required this.response,
  });

  @override
  List<Object?> get props => [response];
}

class SendSignUpOtpFailed extends SignUpState {
  final String message;

  const SendSignUpOtpFailed({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
