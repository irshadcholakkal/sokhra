class WalletSchema {
  final getCustomerWallet = """
  query getCustomerWallet(\$type:String!){
  getCustomerWallet(type:\$type){
    _id
    credit
    debit
    note
    paymentId
    orderId
    referrence
    type
    status
    createdAt
  }
}
  """;

  final getWalletBalance = """
  
query getWalletBalance(\$user:ID) {
  getWalletBalance(user:\$user) {
    balance
    credit
    effBalance
  }
}
  """;

  final initiateCustomerWallet = """
  mutation initiateCustomerWallet(\$credit: Float, \$note: String) {
  initiateCustomerWallet(input: { note: \$note, credit: \$credit }) {
    pendingOrderId
    gatewayId
    gatewayReceipt
    amount
    referrenceId
    status
  }
}
  """;

  final String customerWallet = """
  mutation customerWallet(\$input:WalletInput) {
  customerWallet(
    input:\$input
  ) {
    _id
    user{
    _id
    }
    credit
    debit
    note
    paymentId
    orderId
    type
    status
  }
}
  """;
//   final String customerWallet = """
//   mutation customerWallet(
//   \$credit: Float,
//   \$debit: Float,
//   \$note: String,
//   \$paymentId: String,
//   \$orderId: String,
//   \$type: String,
//   \$status: String,
//   \$referrenceId: ID
// ) {
//   customerWallet(
//     input: {
//       note: \$note,
//       credit: \$credit,
//       debit: \$debit,
//       paymentId: \$paymentId,
//       orderId: \$orderId,
//       type: \$type,
//       status: \$status,
//       referrenceId: \$referrenceId
//     }
//   ) {
//     _id
//     credit
//     debit
//     note
//     paymentId
//     orderId
//     type
//     status
//   }
// }
//   """;
}
