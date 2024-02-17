part of 'configurations_bloc.dart';

abstract class ConfigurationsState extends Equatable {
  const ConfigurationsState();
}

class ConfigurationsFetchInitialState extends ConfigurationsState {
  @override
  List<Object> get props => [];
}

class ConfigurationsFetchLoadingState extends ConfigurationsState {
  @override
  List<Object> get props => [];
}

class ConfigurationsFetchSuccessState extends ConfigurationsState {
  final SettingsList data;

  ConfigurationsFetchSuccessState({required this.data});

  @override
  List<Object> get props => [data];
}

class ConfigurationsFetchFailedState extends ConfigurationsState {
  final String error;

  ConfigurationsFetchFailedState({required this.error});

  @override
  List<Object> get props => [error];
}
