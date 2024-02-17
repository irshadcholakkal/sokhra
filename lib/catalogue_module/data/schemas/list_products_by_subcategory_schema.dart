class ListProductsBySubCategorySchema {
  String listProductsBySubCategory = """
    query customerPoducts(\$input: PageInput,\$filter: FilterInput, \$sort: SortInput, \$pinCode: String) {
      customerPoducts(input:\$input ,filter: \$filter, sort: \$sort, pinCode: \$pinCode) {
        totalCount
        products {
          _id
          nameEn
          nameAr
          nameFr
          descriptionEn
          descriptionAr
          descriptionFr
          featured
          hasOffer
          active
         # status
          order
          approved
          avatar
          categories{
            $_category
          }
          subCategories{
            $_subCategory
          }
          tags{
            $_tag
          }
          tax{
            $_tax
          }
          color{
            $_color
          }
          thumbnailImage
          variantName
          brand {
            _id
            name
            nameAr
            isActive
            isTrending
            image
            logo
            order
            __typename
          }
          variants {
            ...Variant
            __typename
          }
          __typename
        }
        __typename
      }
    }
    
    fragment Variant on Variant {
      _id
      name
      isDefault
      name
      minimumQuantity
      maximumQuantity
      reductionPrice
      price
      quantity
      choiceType
      status
      subChoices{
        $_subChoice
      }
      __typename
    }
  """;

  static const _subChoice = """
_id                    
choiceId                    
name                    
price                    
quantity                    
reductionPrice                    
colorCode                    

""";
  static const _color = """
_id
name
nameAr
nameFr
code

""";
  static const _tax = """
_id              
hsnCode             
hsnTaxCode             
tax{
  _id            
name            
percentage            
}             
""";
  static const _tag = """
_id
nameEn
nameAr
""";
  static const _subCategory = """
_id                     
code                     
nameEn                     
nameAr                     
nameFr                     
avatar                     
order                     
category{
  $_category
}
""";

  static const _category = """
_id
code                   
nameEn                   
nameAr                   
nameFr                   
order                    
avatar                   
active                   
listProductsInHomePage                                    
isBigImage                  
descriptionEn                   
descriptionAr                   
descriptionFr

""";
}
