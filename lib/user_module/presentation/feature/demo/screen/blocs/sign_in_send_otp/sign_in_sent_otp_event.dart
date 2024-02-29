import 'package:equatable/equatable.dart';

abstract class SignInSentOTPEvent extends Equatable {
  const SignInSentOTPEvent();
}

class SendOTP extends SignInSentOTPEvent {
  final String phone;

  SendOTP({required this.phone});

  @override
  List<Object?> get props => [phone];
}
