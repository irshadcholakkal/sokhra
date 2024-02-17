part of 'configurations_bloc.dart';

abstract class ConfigurationsEvent extends Equatable {
  const ConfigurationsEvent();
}

class ConfigurationsFetchEvent extends ConfigurationsEvent {
  final bool reFetch;

  ConfigurationsFetchEvent({this.reFetch = false});
  @override
  List<Object?> get props => [reFetch];
}
