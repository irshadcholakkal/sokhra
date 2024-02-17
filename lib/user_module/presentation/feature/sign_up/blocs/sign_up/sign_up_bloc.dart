import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../data/entity/input_models/otp_input.dart';
import '../../../../../data/entity/input_models/sign_up_input.dart';
import '../../../../../data/repositories/user_provider.dart';
import '../../../../../domain/entity/models/authenticated_user.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final _userProvider = UserProvider();

  SignUpBloc() : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUp) {
      yield* _mapSignUpPressedToState(
        signUpInput: event.signUpInput,
      );
    // } else if (event is SendSignUpOtp) {
    //   yield* _mapSentSignUpOtpToState(
    //     otpInput: event.otpInput,
    //   );
     }
  }

  Stream<SignUpState> _mapSignUpPressedToState({
    required SignUpInput signUpInput,
  }) async* {
    yield SignUpSubmitting();

    final dataResponse = await _userProvider.signUp(
      signUpInput: signUpInput,
    );

    if (dataResponse.hasData) {
      yield SignUpSuccess(
        authenticatedUser: dataResponse.data as AuthenticatedUser,
      );
      print("authenticatedUser:${dataResponse.data as AuthenticatedUser}");
    } else {
      yield SignUpFailed(
        message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
      );
    }
  }

//   Stream<SignUpState> _mapSentSignUpOtpToState({
//     required OtpInput otpInput,
//   }) async* {
//     yield SendSignUpOtpInProgress();

//     final dataResponse = await _userProvider.sendSignUpOtp(
//       otpInput: otpInput,
//     );

//     if (dataResponse.hasData) {
//       yield SendSignUpOtpSuccess(
//         response: dataResponse.data as String,
//       );
//     } else {
//       yield SendSignUpOtpFailed(
//         message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
//       );
//     }
//   }
 }
