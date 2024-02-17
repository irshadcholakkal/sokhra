import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/graphql_service.dart';
import '../../../../../domain/entity/authentication.dart';
import '../../../../../domain/entity/models/authenticated_user.dart';
import '../../../../../domain/user_data.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(authentication.isAuthenticated
            ? Authenticated(
                authenticatedUser: authentication.authenticatedUser,
              )
            : UnAuthenticated());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is SignedIn) {
      yield* _mapSignedInToStates();
    } else if (event is SignedOut) {
      yield* _mapSignedOutToStates();
    }
  }

  Stream<AuthenticationState> _mapSignedInToStates() async* {
    if (authentication.isAuthenticated) {
      yield Authenticated(
        authenticatedUser: authentication.authenticatedUser,
      );
    } else {
      yield UnAuthenticated();
    }
  }

  Stream<AuthenticationState> _mapSignedOutToStates() async* {
    await authentication.clearAuthenticatedUser();
    await userData.removeUserData();
    graphQLService.resetCache();
    yield UnAuthenticated();
  }
}
