class DisplayAllAppBannersSchema{
  String customerGetAllBanners = """
  query customerGetAllBanners {
  customerGetAllBanners {
    _id
    name
    sortOrder
    subHeader
    avatar
    isActive
    type
   
  }
}
""";
}
// __typename