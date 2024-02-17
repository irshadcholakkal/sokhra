import '../../../catalogue_module/data/schemas/products_list_schema.dart';

class CartSchema {
  String getCart = """
  
  query cart(\$devid:String, \$pinCode: String){
  cart(deviceId :\$devid, pinCode: \$pinCode){
    _id
    product{
    ${ProductsListSchema.productsField}
    }
    variant{
      _id
      name
      minimumQuantity
      maximumQuantity
      price
      quantity
      reductionPrice
    }
    deliveryCharge
    minimumPurchaseAmount
    isDeliveryAvailable
    quantity
  }
  }

  """;
  String addToCart = """
  
 mutation  (\$input: CartInput!, \$pinCode: String){
    addToCart(input :\$input, pinCode: \$pinCode){
      quantity
      _id
      deviceId
      variant{
      _id
      }
      product{
        _id
      }
    }
    
  }
  """;

  String updateCart = """
  
  mutation updateCart(\$id: ID!, \$quantity: Float!, \$pinCode: String){
      updateCart(id: \$id, quantity: \$quantity, pinCode: \$pinCode){
      _id
      quantity
     }
  }
  """;

  String deleteCart = """
  
  mutation deleteCart(\$id: ID!){
      deleteCart(id: \$id)
    }

  """;
}
