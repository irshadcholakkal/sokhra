part of 'send_otp_bloc.dart';
abstract class SendOtpState extends Equatable  {
const SendOtpState();  
 
}

class SendOtpInitial extends SendOtpState{
  @override
  List<Object> get props => [];

}
class SendOtpLoading extends SendOtpState{
  @override
  List<Object> get props => [];

}
class SendOtpLoaded extends SendOtpState{
  @override
  List<Object> get props => [];

}
class SendOtpFailed extends SendOtpState{
  final String message;

  SendOtpFailed({required this.message});
  @override
  List<Object> get props => [];

}
