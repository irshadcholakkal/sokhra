part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUp extends SignUpEvent {
  final SignUpInput signUpInput;

  const SignUp({
    required this.signUpInput,
  });

  @override
  List<Object> get props => [signUpInput];
}

class SendSignUpOtp extends SignUpEvent {
  final OtpInput otpInput;

  const SendSignUpOtp({
    required this.otpInput,
  });

  @override
  List<Object?> get props => [otpInput];
}
