import 'models/initiate_payment_response.dart';

class PaymentScreenArgs {
  final InitiatePaymentResponse response;
  final bool isFromWallet;

  PaymentScreenArgs({required this.response, this.isFromWallet = false});
}
