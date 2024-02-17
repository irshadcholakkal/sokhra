class ProductsListSchema {
  static const _regionField = """
  _id
  name  
  """;

  static const _region = """
  region{
  $_regionField
  }
  """;

  static const _currentAvailabilityField = """
  price
  quantity
  $_region
  """;

  static const _currentAvailability = """
  currentAvailability{
  $_currentAvailabilityField
  }
  """;

  static const _choicesField = """
  _id
  name
  offerReductionPrice
  isDefault
  $_currentAvailability
  """;
  static const _subChoicesField = """
  _id
  name
  choicePrice
  """;

  static const _choices = """
  choices{
  $_choicesField
  }
  """;

  // static const _subChoices = """
  //   subChoices{
  //     $_subChoicesField
  //   }
  // """;

  static const _variantField = """
  _id
  name
  minimumQuantity
  maximumQuantity
  isDefault
  price
  quantity
  reductionPrice
  """;

  static const _variant = """
  variants{
  $_variantField
  }
  """;

  static const _brandField = """
  _id
  name
  """;

  static const _brand = """
  brand{
  $_brandField
  }
  """;

  static const _categoryField = """
  _id
  nameEn
  avatar
  active
  """;

  static const _category = """
  categories{
    $_categoryField
  }
  """;

  static const productsField = """
  _id
  avatar
  nameEn
  descriptionEn
  thumbnailImage
  $_category
  $_brand
  $_variant
  """;

  static const productListProductsField = """
  _id
  avatar
  nameEn
  $_category
  $_brand
  $_variant
  descriptionEn
  """;

  static const _products = """
  products{
  $productListProductsField
  }
  """;

  final getProducts = """
  query customerPoducts(\$sort:SortInput,\$filter:FilterInput,\$input:PageInput!, \$pinCode:String){
    customerPoducts(sort:\$sort,filter:\$filter,input:\$input, pinCode: \$pinCode){
      $_products
      totalCount
    }
    }
  """;
}
