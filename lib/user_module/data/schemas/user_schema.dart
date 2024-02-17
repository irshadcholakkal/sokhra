
class UserSchema {
  static const user = """
    _id
    name
    role
    lastname
    phone
    email
    active
  """;

  static const _authUser = """
    user {
      $user
    }
    token
  """;

  final signIn = """
   mutation signIn(\$input: SignInInput!) {
  signIn(input: \$input) {
    $_authUser
  }
}

  """;



//
//   final signIn = """
//    mutation signIn(\$input: SignInInput!) {
//   signIn(input: \$input) {
//      _id
//     user{
//      _id
//     name
//     role
//     lastname
//     phone
//     email
//     active
//     }
//     token
//   }
// }
//
//   """;

  final signUp = """
   mutation signUp(\$input: SignUpInput!) {
  signUp(input: \$input) {
    $_authUser
  }
}

 """;

  final sendSignUpOtp = """
    mutation signUpOtp(\$input: OtpInput!){
      signUpOtp(input: \$input)
    }
  """;

  final signOut = """
    mutation signOut(\$input: SignOutInput!){
      signOut(input: \$input)
    }
  """;
  final sendOTP ="""
   mutation sendOTP(\$phone :String!){
    sendOTP(phone:\$phone)

   }""";

   final validateOTP ="""
   mutation validateOTP(\$phone: String!, \$otp: String!){
    validateOTP(phone: \$phone, otp: \$otp)
  }""";


}