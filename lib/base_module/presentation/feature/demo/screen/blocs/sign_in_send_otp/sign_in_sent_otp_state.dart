import 'package:equatable/equatable.dart';

abstract class SignInSentOTPState extends Equatable {
  const SignInSentOTPState();
}

class SendOTPInitial extends SignInSentOTPState {
  @override
  List<Object?> get props => [];
}

class SendOTPLoading extends SignInSentOTPState {
  @override
  List<Object?> get props => [];
}

class OTPSentSuccessfully extends SignInSentOTPState {
  @override
  List<Object?> get props => [];
}

class OTPSendingFailed extends SignInSentOTPState {
  final String message;

  OTPSendingFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
