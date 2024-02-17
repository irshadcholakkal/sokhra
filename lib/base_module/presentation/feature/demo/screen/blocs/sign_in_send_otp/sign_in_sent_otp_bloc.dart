import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../user_module/data/repositories/sign_in_sent_otp_provider.dart';
import 'sign_in_sent_otp_event.dart';
import 'sign_in_sent_otp_state.dart';

class SignInSentOTPBloc extends Bloc<SignInSentOTPEvent, SignInSentOTPState> {
  SignInSentOTPProvider _signInSentOTPProvider = SignInSentOTPProvider();

  SignInSentOTPBloc() : super(SendOTPInitial());

  @override
  Stream<SignInSentOTPState> mapEventToState(SignInSentOTPEvent event) async* {
    if (event is SendOTP) {
      yield SendOTPLoading();
      final dataResponse =
          await _signInSentOTPProvider.sendOTP(phone: event.phone);
      if (dataResponse.hasData) {
        yield OTPSentSuccessfully();
      } else {
        yield OTPSendingFailed(
          message: dataResponse.error??"Some error"
        );
      }
    }
  }
}
