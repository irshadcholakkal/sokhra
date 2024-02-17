// import 'package:armino_ecom/user_module/data/schemas/user_schema.dart';
// import 'package:armino_ecom/vendor_module/data/schemas/food_schema.dart';
// import 'package:armino_ecom/vendor_module/data/schemas/vendor_schema.dart';

class AppDataSchema {
  static const String _addressDetailsFields = """
    _id
    firstName
    lastName
    phone
    email
    address
    pincode
    type
    house
    street
    post
    district
    state
    landmark
    isDefault
    lat
    lng
  """;

//////    type removed in lumiere
  static const String _addressDetails = """
    addressDetails{
      $_addressDetailsFields
    }
  """;

  static const String _userFields = """
    _id
    name
    lastname
    email
    phone
  """;

  static const String _user = """
    user{
      $_userFields
    }
  """;

  final getAppData = """
    query customerProfile{
      customerProfile{
        _id
        discountCode
        $_user
        $_addressDetails
      }
    }
  """;

  final String getConfigurations = """
  query getConfigurations{ 
    getConfigurations{
      Settings{
        whatsappSettings {
          number
          message
        }
        appVersion {
          version
          isUpdateRequired
        }
        defaultPincode
      }
    }
  }
  """;
}
