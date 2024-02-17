import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/repositories/user_provider.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  final _userProvider = UserProvider();

  SignOutBloc() : super(SignOutInitial());

  @override
  Stream<SignOutState> mapEventToState(SignOutEvent event) async* {
    if (event is SignOut) {
      yield* _mapSignOutToState();
    }
  }

  Stream<SignOutState> _mapSignOutToState() async* {
    yield SignOutInProgress();

    final dataResponse = await _userProvider.signOut();

    if (dataResponse.hasData) {
      yield const SignOutSuccess(
        message: "SUCCESS",
      );
    } else {
      yield SignOutFailed(
        message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
      );
    }
  }
}
