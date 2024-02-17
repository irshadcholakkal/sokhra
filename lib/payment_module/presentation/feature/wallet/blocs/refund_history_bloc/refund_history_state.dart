part of 'refund_history_bloc.dart';

abstract class RefundHistoryState extends Equatable {
  const RefundHistoryState();
  @override
  List<Object?> get props => [];
}

class RefundHistoryLoading extends RefundHistoryState {}

class RefundHistoryFetchSuccess extends RefundHistoryState {
  final CustomerWalletList? walletList;

  RefundHistoryFetchSuccess({required this.walletList});
  @override
  List<Object?> get props => [walletList];
}

class RefundHistoryFetchFailed extends RefundHistoryState {
  final String error;

  RefundHistoryFetchFailed({required this.error});
  @override
  List<Object?> get props => [error];
}
