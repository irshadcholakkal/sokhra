import 'products_list_schema.dart';

class ProductDetailsSchema {
  // final getProductDetails = """
  // query getProductDetails(\$id:ID,\$pincode:String){
  // getProductDetails(id:\$id,pinCode:\$pincode){
  //  ${ProductsListSchema.productsField}
  // }
  // }
  // """;
  final getProductDetails = """
    query getProduct(\$id:ID, \$pinCode: String){
      getProduct(productId:\$id, pinCode: \$pinCode){
        ${ProductsListSchema.productsField}
      }
    }
  """;
}
