import '../../../catalogue_module/data/schemas/products_list_schema.dart';

class WishListSchema {
  final String getWishLists = """
    query wishLists(\$devid : String){
    wishLists(deviceId :\$devid){
    _id
    product{
    ${ProductsListSchema.productsField}
    }
    deviceId
    user{
      name
      lastname
    }
  }
  }
  """;

  final String addToWishList = """
   mutation  addToWishList(\$input: WishListInput!,\$lat:Float, \$lng:Float){
    addToWishList(input :\$input, lat:\$lat, lng:\$lng){
   
   
       _id
    product{
      _id
      code
      nameEn
      
    }
    user{
      _id
      name
      
    }
    deviceId
  
    variantChoice
   
   
   
    }

  }
  """;



  final String deleteWishList = """
    mutation deleteWishList(\$id: ID!){
      deleteWishList(id: \$id)
    }
  """;
}
