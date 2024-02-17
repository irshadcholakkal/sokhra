class SignInPasswordSchema{
  String userSignIn = """
mutation userSignIn(\$phone:String!,\$password:String!){
  userSignIn(input:{phone:\$phone,password:\$password}){
    _id
    token
    roles
    pincode
    user{
      phone
      _id
      name
      lastname
      active
      avatar
    }
  }
}
""";
}
// String signWithOTP = """
// mutation signInWithOTP(\$otp:String,\$phone:String!){
//   signWithOTP(input:{
//     phone:\$phone
//     otp:\$otp
//   }){
//     _id
//     token
//     roles
//     pincode
//     user{
//       phone
//       _id
//       name
//       lastname
//       active
//       avatar
//     }
//   }
// }
// """;