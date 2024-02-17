part of 'app_data_bloc.dart';

abstract class AppDataEvent extends Equatable {
  const AppDataEvent();

  @override
  List<Object> get props => [];
}

class FetchAppData extends AppDataEvent {
  final bool reFetch;

  const FetchAppData({
    this.reFetch = false,
  });

  @override
  List<Object> get props => [reFetch];
}

class ClearAppData extends AppDataEvent {}
