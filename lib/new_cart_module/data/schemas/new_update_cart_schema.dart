class NewUpdateCartSchema {
  String updateCartItemValue = """
    mutation updateCart(\$cartItemId: ID!, \$quantity: Float!, \$pinCode: String) {
      updateCart(id: \$cartItemId, quantity: \$quantity, pinCode: \$pinCode) {
        _id
        quantity
        user {
          _id
          __typename
        }
        deviceId
        __typename
      }
    }
  """;

  String deleteCart = """
    mutation deleteCart(\$id: ID!) {
      deleteCart(id: \$id)
    }
  """;
}
