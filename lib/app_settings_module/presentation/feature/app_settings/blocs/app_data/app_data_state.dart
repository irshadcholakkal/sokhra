part of 'app_data_bloc.dart';

abstract class AppDataState extends Equatable {
  final AppData? data;
  final String? error;

  const AppDataState({this.data, this.error});

  String get errorMessage => error ?? "";

  @override
  List<Object?> get props => [data, error];
}

class AppDataInitial extends AppDataState {}

class FetchAppDataInProgress extends AppDataState {}

class FetchAppDataSuccess extends AppDataState {
  final AppData appData;

  const FetchAppDataSuccess({required this.appData}) : super(data: appData);

  @override
  List<Object> get props => [appData];
}

class FetchAppDataFailed extends AppDataState {
  final String message;

  const FetchAppDataFailed({required this.message}) : super(error: message);

  @override
  List<Object> get props => [message];
}
