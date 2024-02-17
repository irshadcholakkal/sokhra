class DeliverySchema {
  String getAllDeliveriesByDeliveryBoy = """
    query getAllDeliveriesByDeliveryBoy(\$orderStatus :  OrderStatus,\$input: PageInput){
  getAllDeliveriesByDeliveryBoy(orderStatus :\$orderStatus,input:\$input){
  
   orders{
      _id
      orderNumber
      paymentStatus
      status
      reason
      deliveryDate
       customer{
        _id
        customerId
        discountCode
        creditEnabled
        
      }
      shippingDetails{
        zone{
          zoneName
          pincodes
          deliveryDays
          deliveryCharge
          minimumPurchaseAmount
          
        }
      firstname
        lastname
        phone
        house
        type
        district
        state
        pincode
        street
        landmark
        note
        
        

      }
    }
  
  }
  }
  """;

  final updateOrderStatus = """
    mutation updateOrderStatus(\$id: ID!, \$status: OrderStatus, \$deliveryText: String){
      updateOrderStatus(id: \$id, status: \$status,deliveryText:\$deliveryText){   
      _id
      orderNumber
      paymentStatus
      status
      reason
     deliveryDate
     shippingDetails{
     firstname
    
   }
    gatewayId
      }
    }
  """;
}
