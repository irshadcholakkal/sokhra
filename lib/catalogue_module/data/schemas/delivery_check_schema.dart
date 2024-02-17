class DeliveryCheckSchema {
  // static const _deliveryCheckFields = """
  //   zoneName
  //   deliveryDay
  //   deliveryDate
  //   hasSameDayDelivery
  //   hasSameDayShipping
  //   minimumPurchaseAmount
  // """;


  static const _deliveryCheckFields = """
    zoneName
    zoneNameAr
    zoneNameFr
    deliveryDay
    deliveryDate
    hasSameDayDelivery
    hasSameDayShipping
  """;

  

  final deliveryCheckUsingPincode = """
    query deliveryCheckUsingPincode(\$pincode:String){
      deliveryCheckUsingPincode(pincode:\$pincode){
        $_deliveryCheckFields
      }
    }
  """;

  
  


final String getDeliveryShiftsByZone = """
    query getDeliveryShiftsByZone(\$zone: ID){
  getDeliveryShiftsByZone(zone: \$zone){
    _id
    startTime
    endTime
    isAvailableforBooking
  }}
  """;









  
}
