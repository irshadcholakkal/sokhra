class OrderSchema {
  // static const String _taxes = """
  //   taxes {
  //     _id
  //     name
  //     percentage
  //   }
  // """;
  //
  // static const String _taxInfo = """
  //   taxInfo {
  //     hsnCode
  //     $_taxes
  //   }
  // """;
  //
  // static const String _pricing = """
  //   pricing {
  //     price
  //     unitPrice
  //     discount
  //     netAmount
  //     basePrice
  //     tax
  //     $_taxInfo
  //   }
  // """;
  //
  // static const String _productInfo = """
  //   productInfo {
  //     name
  //     thumbnailImage
  //     variant
  //   }
  // """;
  //
  // static const String _payment = """
  //   payment {
  //     status
  //     invoiceAmount
  //   }
  // """;
  //
  // static const String _orders = """
  //   orders {
  //     _id
  //     status
  //     quantity
  //     $_pricing
  //     $_productInfo
  //   }
  // """;
  //
  // static const _orderPricing = """
  //   pricing {
  //     price
  //     discount
  //     netAmount
  //     basePrice
  //     tax
  //     deliveryCharge
  //     paidAmount
  //   }
  // """;

  static const _order = """
       _id
      createdAt
      status
      deliveryDate
      orderNumber
      createdBy {
        _id
        name
        lastname
      }
      orderHistory {
        note
        createdAt
      }
      shippingDetails {
        firstname
        lastname
        phone
        house
        type
        district
        state
        pincode
        landmark
        street
        email
        zone {
          _id
          zoneName
        }
      }
        orders {
        _id
        status
        quantity
        variant
      orderQuantity
        pricing {
          price
          reductionPrice
          unitPrice
          discount
          netAmount
          basePrice
          tax
          taxInfo {
            hsnCode
            taxes {
              _id
              name
              percentage
            }
          }
        }
        product {
          _id
          brand {
            _id
            name
          }
        }
        productInfo {
          name
          variant
        }
      }
      customer {
        _id
        user {
          _id
          lastname
          name
        }
      }
      pricing {
        price
        discount
        netAmount
        basePrice
        tax
        deliveryCharge
        paidAmount
        billedValue
      }
  """;

  // static const _order = """
  //   _id
  //   orderNumber
  //   status
  //   reason
  //   deliveryDate
  //   pricing {
  //     tax
  //     deliveryCharge
  //     billedValue
  //   }
  //   orders {
  //     productInfo {
  //       name
  //       thumbnailImage
  //       variant
  //     }
  //     pricing {
  //       netAmount
  //     }
  //     quantity
  //   }
  //   shippingDetails {
  //     firstname
  //     lastname
  //     phone
  //     house
  //     type
  //     district
  //     state
  //     email
  //     pincode
  //     street
  //     landmark
  //     note
  //     lat
  //     lon
  //   }
  //   payment {
  //     status
  //
  //   }
  //   createdAt
  //   checkoutNote
  // """;
////// use this payment schema  commended invoice amount due to back en error
//   payment {
//   status
//   invoiceAmount
// }
//   final String getOrders = """
//     query orders(\$input: PageInput!, \$filter: OrderFilter) {
//       orders(input: \$input, filter: \$filter) {
//         orders {
//           $_order
//         }
//         totalCount
//       }
//     }
//   """;
  final String getOrders = """
    query orders(\$input: PageInput!, \$filter: OrderFilter) {
      orders(input: \$input, filter: \$filter) {
        orders {
          $_order
        }
        totalCount
      }
    }
  """;

  final String repeatPurchase = """
    mutation repeatPurchase(\$id: ID!, \$deviceId: String, \$pinCode: String){
      repeatPurchase(id: \$id, deviceId: \$deviceId, pinCode: \$pinCode) {
        carts {
          _id
        }
        deliveryCharge
        price
        discount
        discountedPrice
        tax
        basePrice
        netPrice
      }
    }
  """;
}
