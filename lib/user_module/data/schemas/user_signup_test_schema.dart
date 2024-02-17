class UserSignUpTestSchema{
  String userSignUpTestSchema  = """
  
  mutation signUp(\$input: SignUpInput!){
      signUp(input: \$input) {
        user{
          _id
        }
        token
      }
    }

  """;
}