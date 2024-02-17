class SignInSentOTPSchema{
  String sendOTP = """
  mutation sendOTP(\$phone:String!){
  sendOTP(phone:\$phone)
}
""";
}

//  mutation signInSentOTP(\$phone:String!){
//   signInSentOTP(phone:\$phone)
// }
