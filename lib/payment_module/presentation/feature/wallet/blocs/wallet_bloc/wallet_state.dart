part of 'wallet_bloc.dart';

abstract class WalletState extends Equatable {
  const WalletState();
  @override
  List<Object?> get props => [];
}

class WalletLoading extends WalletState {}

class WalletInitiateSuccess extends WalletState {
  final InitiatePaymentResponse response;

  WalletInitiateSuccess({required this.response});
  @override
  List<Object?> get props => [response];
}

class WalletInitiateFailed extends WalletState {
  final String error;

  WalletInitiateFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

class WalletCreditSuccess extends WalletState {
  final CustomerWallet? customerWallet;

  WalletCreditSuccess({required this.customerWallet});

  @override
  List<Object?> get props => [customerWallet];
}

class WalletCreditFailed extends WalletState {
  final String error;

  WalletCreditFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
