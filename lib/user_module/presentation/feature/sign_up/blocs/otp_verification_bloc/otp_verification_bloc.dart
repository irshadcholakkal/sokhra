import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/repositories/user_provider.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';

class OtpVerificationBloc extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  final _userProvider = UserProvider();
  OtpVerificationBloc() : super(OtpVerificationInitial()) {
    on<OtpVerificationEvent>((event, emit) async{  
      
      if(event is verifyOtp){
        emit(OtpVerificationLoading());
        final dataResponse = await _userProvider.verifyOtp(phoneNumber: event.phoneNumber, otp: event.otp);

        if(dataResponse.hasData){
          emit(OtpVerificationLoaded());
        }else{
          emit(OtpVerificationFailed(message: dataResponse.error??"some error"));
        }

      }

    });
  }
}
