class ListAllCategorySchema {
  String listAllCategory = """
  query categories() {
  categories() {
    ...Category
    __typename
  }
}

fragment Category on Category {
  _id
  nameEn
  nameAr
  nameFr
  order
  avatar
  active
  isBigImage
  descriptionEn
  descriptionAr
  descriptionFr
  subCategories {
    ...SubCategory
  }
}
fragment SubCategory on SubCategory {
  _id
  code
  nameEn
  nameAr
  nameFr
  avatar
  order
  __typename
}
""";
}

// fragment SubCategory on SubCategory {
//   _id
//   nameEn
//   nameAr
//   avatar
//   thumbnail
//   order
//   __typename
// }
// """;




//  query categories(\$pincode: String) {
//   categories(pincode: \$pincode) {
//     ...Category
//     __typename
//   }
// }