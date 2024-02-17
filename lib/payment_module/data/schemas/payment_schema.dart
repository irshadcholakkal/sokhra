class PaymentSchema {
  static const String _initiatePaymentResponse = """
    pendingOrderId
    referrenceId
    gatewayId
    gatewayReceipt
    amount
    status
    paymentUrl
  """;

  final initiatePayment = """
    mutation initiatePayment(\$input: InitiatePaymentInput!){
      initiatePayment(input: \$input){
        $_initiatePaymentResponse
      }
    }
  """;

  static const String _promoCodeInfo = """
    discountedPrice
    price
    discount
    promoCode
  """;

  final applyPromoCode = """
    mutation applyPromoCode(\$promoCode:String,\$deviceId:String, \$pinCode: String){
      applyPromoCode(promoCode:\$promoCode,deviceId:\$deviceId, pinCode: \$pinCode){
        $_promoCodeInfo
      }
    }
  """;

  static const String _payment = """
    payment{
      invoiceAmount
      invoiceId
    }
  """;

  static const String _order = """
    _id
    createdAt
    gatewayId
    gatewayReceipt
    orderNumber
    status
  """;

  final createPayment = """
    mutation createPayment(\$input: CreatePaymentInput!){
      createPayment(input: \$input){
        $_order
      }
    }
  """;
}
