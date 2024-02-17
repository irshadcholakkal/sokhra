import 'package:equatable/equatable.dart';

abstract class LoadSignUpTestState extends Equatable {
  const LoadSignUpTestState();
}

class ListLoading extends LoadSignUpTestState {
  @override
  List<Object> get props => [];
}

class ListLoaded extends LoadSignUpTestState {

  @override
 
   List<Object> get props => [];
}

class ListLoadingFailed extends LoadSignUpTestState {
  final String message;
  ListLoadingFailed({required this.message});

  @override
  List<Object> get props => [message];
}