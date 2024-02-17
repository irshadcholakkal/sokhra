class NewAddToCartSchema{
  String addToCart = """
  mutation addToCart(\$input:CartInput!,\$pinCode:String) {
  addToCart(input:\$input,pinCode:\$pinCode) {
    _id
    quantity
    variant{
      _id                                    
name                                   
minimumQuantity                                   
maximumQuantity                                   
isDefault                                    
price                                    
quantity                                    
reductionPrice                                   
choiceType
    }
    variantChoice
    variantChoiceName
    user {
      _id
      __typename
    }
    deviceId
    __typename
  }
}
""";
}

// mutation addToCart(\$product: ID, \$choice: ID, \$quantity: Float, \$deviceId: String, \$pinCode: String) {
//   addToCart(input: {product: \$product, choice: \$choice, quantity: \$quantity, deviceId: \$deviceId}, pinCode: \$pinCode) {
//     _id
//     quantity
//     user {
//       _id
//       __typename
//     }
//     deviceId
//     __typename
//   }
// }