import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // debugPrint(event.toString());
    debugPrint("Event { ${event.runtimeType} }");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // debugPrint(transition.toString());
    debugPrint(
      "Transition { currentState: ${transition.currentState.runtimeType}, event: ${transition.event.runtimeType}, nextState: ${transition.nextState.runtimeType} }",
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    debugPrint(error.toString());
  }
}
