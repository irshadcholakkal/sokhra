part of 'wallet_balance_bloc.dart';

abstract class WalletBalanceState extends Equatable {
  const WalletBalanceState();
  @override
  List<Object?> get props => [];
}

class WalletBalanceLoading extends WalletBalanceState {}

class WalletBalanceFetchSuccess extends WalletBalanceState {
  final WalletBalance? walletBalance;

  WalletBalanceFetchSuccess({required this.walletBalance});
  @override
  List<Object?> get props => [walletBalance];
}

class WalletBalanceFetchFailed extends WalletBalanceState {
  final String error;

  WalletBalanceFetchFailed({required this.error});
  @override
  List<Object?> get props => [error];
}
