import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../data/repositories/sign_in_with_otp_provider.dart';
import '../../../../../domain/entity/models/authenticated_user.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInWithOTPProvider _signInWithOTPProvider = SignInWithOTPProvider();

  SignInBloc() : super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignIn) {
      yield* _mapSignInToState(
        password: event.password,
        phone: event.phone,
      );
    }
  }

  Stream<SignInState> _mapSignInToState({
    required String phone,
    required String password,
  }) async* {
    yield SignInSubmitting();

    final dataResponse =
        await _signInWithOTPProvider.signWithPassword(password: password, phone: phone);

    if (dataResponse.hasData) {
      yield SignInSuccess(
        authenticatedUser: dataResponse.data as AuthenticatedUser,
      );
    } else {
      yield SignInFailed(
        message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
      );
    }
  }
}
