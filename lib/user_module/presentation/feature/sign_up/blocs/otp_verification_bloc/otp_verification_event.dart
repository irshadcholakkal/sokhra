part of 'otp_verification_bloc.dart';

abstract class OtpVerificationEvent extends Equatable {
  const OtpVerificationEvent();
}
class verifyOtp extends OtpVerificationEvent{
  final String phoneNumber;
  final String otp;

  verifyOtp({required this.phoneNumber, required this.otp});
  
  @override
  List<Object?> get props => [phoneNumber,otp];

   
}