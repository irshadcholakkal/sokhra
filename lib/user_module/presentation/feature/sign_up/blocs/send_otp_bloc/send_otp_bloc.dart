import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../base_module/data/entity/models/data_response.dart';
import '../../../demo/screen/blocs/sign_in_send_otp/sign_in_sent_otp_state.dart';
import '../../../../../data/repositories/user_provider.dart';

part 'send_otp_event.dart';
part 'send_otp_state.dart';

class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  final _userProvider =UserProvider();

  SendOtpBloc() : super(SendOtpInitial()) {
    on<SendOtpEvent>((event, emit)async {
      if(event is SendOtp){
        emit (SendOtpLoading());
        final dataResponse =await _userProvider.sendOtp(phoneNumber: event.phoneNumber);
        
        if(dataResponse.hasData){
          emit (SendOtpLoaded());
        }else{
          emit(SendOtpFailed(message: dataResponse.error??"some error"));
        }
     
      }
     
    });
  }
}



// class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
//   final _userProvider = UserProvider();

//   SendOtpBloc() : super(SendOtpInitial());

//   @override
//   Stream<SendOtpState> mapEventToState(SendOtpEvent event) async* {
//     if (event is SendOtp) {
//       yield SendOtpLoading();
//       final dataResponse = await _userProvider.sendOtp(phoneNumber: event.phoneNumber);

//       if (dataResponse.hasData) {
//         yield SendOtpLoaded();
//       } else {
//         yield SendOtpFailed(
//           message: dataResponse.error??"some error"
//         );
//       }
//     }
//   }
// }
