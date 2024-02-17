class CarousalSchema {
  static const _bannersField = """
  _id
  name
  type
  avatar
  isActive
  """;

  static const _banners = """
  banners{
  $_bannersField
  }
  """;

  final getAllBanners = """
  query getAllBanners(){
  getAllBanners{
    $_banners
  }
  }
  """;
}
