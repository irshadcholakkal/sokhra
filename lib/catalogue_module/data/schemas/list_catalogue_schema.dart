class ListCatalogueSchema {
  static const _subCategoryField = """
  _id
  nameEn
  avatar
  """;

  static const _subCategory = """
   subCategories{
     $_subCategoryField
   }
   """;

  static const _categoryField = """
  _id
  nameEn
  avatar
  active
  """;

  final getCategories = """
    query categories(\$pinCode: String){
      categories(pincode: \$pinCode){
        $_categoryField
        $_subCategory
      }
    }
  """;
}
