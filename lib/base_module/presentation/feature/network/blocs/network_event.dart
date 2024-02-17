part of 'network_bloc.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class CheckNetwork extends NetworkEvent {}

class SwitchNetwork extends NetworkEvent {
  final bool isOnline;

  const SwitchNetwork({
    required this.isOnline,
  });

  @override
  List<Object> get props => [isOnline];
}
