class ZoneSchema{
  final getAllZones="""
    query getAllZones {
    getAllZones {
      zones {
        _id
        zoneName
        zoneNameAr
        zoneNameFr
        pincodes
        isActive
        deliveryDays
        deliveryCharge
        minimumPurchaseAmount
      }
      totalCount
    }
  }
""";
}