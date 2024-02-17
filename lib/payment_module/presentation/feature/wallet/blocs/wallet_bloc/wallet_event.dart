part of 'wallet_bloc.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();
}

class WalletInitiateEvent extends WalletEvent {
  final String? note;
  final double? credit;

  WalletInitiateEvent({required this.note, required this.credit});

  @override
  List<Object?> get props => [note, credit];
}

class WalletCreditEvent extends WalletEvent {
  final WalletInput walletInput;

  WalletCreditEvent({required this.walletInput});

  @override
  List<Object?> get props => [walletInput];
}
