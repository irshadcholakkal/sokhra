part of 'otp_verification_bloc.dart';

abstract class OtpVerificationState extends Equatable {
  const  OtpVerificationState();
  
 
}
class OtpVerificationInitial extends OtpVerificationState{
  @override
  List<Object> get props => [];
  
}
class OtpVerificationLoading extends OtpVerificationState{
  @override
  List<Object> get props => [];
  
}
class OtpVerificationLoaded extends OtpVerificationState{
  @override
  List<Object> get props => [];
  
}
class OtpVerificationFailed extends OtpVerificationState{
  final String message;

  OtpVerificationFailed({required this.message});
  @override
  List<Object> get props => [message];
  
}