import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entity/network.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final _connectivity = Connectivity();

  NetworkBloc() : super(NetworkState.ONLINE) {
    _connectivity.onConnectivityChanged.listen(_onConnectionChange);
  }

  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {
    if (event is CheckNetwork) {
      yield await network.isOnline ? NetworkState.ONLINE : NetworkState.OFFLINE;
    } else if (event is SwitchNetwork) {
      yield event.isOnline ? NetworkState.ONLINE : NetworkState.OFFLINE;
    }
  }

  Future _onConnectionChange(ConnectivityResult result) async {
    add(SwitchNetwork(
      isOnline: await network.isOnline,
    ));
  }
}
