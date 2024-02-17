part of 'send_otp_bloc.dart';

abstract class SendOtpEvent extends Equatable  {
  const SendOtpEvent();
}
class SendOtp extends SendOtpEvent{
  final String phoneNumber;

  SendOtp({required this.phoneNumber});
  
  @override
  List<Object> get props =>[phoneNumber];
  
}