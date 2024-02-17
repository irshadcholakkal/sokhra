import 'user_schema.dart';

class ProfileSchema {
  final updateProfile = """
    mutation updateCustomer(\$id: ID, \$input: UpdateUserInput!){
      updateCustomer(id: \$id, input: \$input){
        _id
        user{
         _id
         name
         role
         lastname
         phone
         email
         active
        }
        customerId
      }
    }
  """;

  final updatePassword = """
    mutation updatePassword(\$input: PasswordChangeInput!){
      updatePassword(input: \$input)
    }
  """;

  final sendOtp = """
    mutation sentOtp(\$email: String!){
      sentOtp(email: \$email)
    }
  """;

  final forgotPassword = """
    mutation forgotPassword(\$input: ForgotPasswordInput!){
      forgotPassword(input: \$input)
    }
  """;

  final createShippingDetails = """
    mutation createShippingDetails(\$input: ShippingInput) {
      createShippingDetails(input: \$input){
        _id
      }
    }
  """;

  final editShippingAddress = """
  mutation editShippingAddress(\$addressId:ID!,\$input:ShippingInput!,\$customerId:ID){
    editShippingAddress(addressId:\$addressId,input:\$input,customerId:\$customerId){
      _id
    }
  }
  """;

  final deleteShippingAddress = """
    mutation deleteShippingAddress(\$addressId:ID!,\$customerId:ID){
      deleteShippingAddress(addressId:\$addressId,customerId:\$customerId)
    }
  """;
}
