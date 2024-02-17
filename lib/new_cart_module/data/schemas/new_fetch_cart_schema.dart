// class FetchCartSchema{
//   String fetchCartItemsFromServer = """
//   query cart( \$pinCode: String) {
//   cart(pinCode: \$pinCode) {
//     _id
//     variant {
//       ...Variant
//       __typename
//     }
//     isDeliveryAvailable
//     deliveryCharge
//     minimumPurchaseAmount
//     product {
//       _id
//       nameEn
//       status
//       thumbnailImage
//       avatar
//       descriptionEn
//       nameEn
//       variantName
//       brand {
//         _id
//         name
//         __typename
//       }
//       variants {
//         ...Variant
//         __typename
//       }
//       nameEn
//       categories {
//         nameEn
//         __typename
//       }
//       tax {
//         tax {
//           percentage
//         }
//       }
//       __typename
//     }
//     quantity
//     user {
//       _id
//       __typename
//     }
//     deviceId
//     createdAt
//     __typename
//   }
// }

// fragment Variant on Variant {
//   _id
//   name
//   isDefault
//   name
//   minimumQuantity
//   maximumQuantity
//   reductionPrice
//   price
//   quantity
//   __typename
// }
// """;
// }





import '../../../catalogue_module/data/schemas/list_products_by_subcategory_schema.dart';
import '../../../catalogue_module/domain/models/sub_choices.dart';

class FetchCartSchema{
//   String fetchCartItemsFromServer = """
//   query cart( \$pinCode: String) {
//   cart(pinCode: \$pinCode) {
//     basePrice
//     netPrice
//     tax
//     promoCode
//     discount
//     price
//     discountedPrice
//     deliveryCharge
//      cart{
//         _id
//       variantChoiceName
//       quantity
//       deliveryCharge
//       minimumPurchaseAmount
//       tax
//       deviceId
//       isDeliveryAvailable
//       price
//       reductionPrice
//       product{
//         _id
//         code
//         nameEn
//         nameAr
//         nameFr
//         descriptionEn
//         descriptionAr
//         descriptionFr
//         thumbnailImage
//         featured
//         hasOffer
//         active
//         sku
//         order
//         approved
//         variantName
//         variants{
//            ...Variant
//           }
//         }
//       }
//     }
//   }
// fragment Variant on Variant {
//       _id
//       name
//       isDefault
//       name
//       minimumQuantity
//       maximumQuantity
//       reductionPrice
//       price
//       quantity
//       choiceType
//       status
//       subChoices{
      
//        $_subChoice
      
//       }
//       __typename
// }
// """;

// static const _subChoice = """
// _id                    
// choiceId                    
// name                    
// price                    
// quantity                    
// reductionPrice                    
// colorCode                    

// """;




String fetchCartItemsFromServer = """

query cart( \$pinCode: String){
 cart ( pinCode: \$pinCode){
    basePrice
    netPrice
    tax
    promoCode
    discount
    price
    discountedPrice
    deliveryCharge
    
     cart{
        _id
      variantChoiceName
      quantity
      deliveryCharge
      minimumPurchaseAmount
      tax
      deviceId
      isDeliveryAvailable
      price
      reductionPrice
      variant{
      _id                                                        
name                                                        
minimumQuantity                                                        
maximumQuantity                                                        
isDefault                                                        
price                                                       
quantity                                                        
reductionPrice   
choiceType                               
                                
status                                                                                     
    }
      product{
        _id
        code
        nameEn
        nameAr
        nameFr
        descriptionEn
        descriptionAr
        descriptionFr
        thumbnailImage
        featured
        hasOffer
        active
        sku
        order
        approved
        variantName
        variants{
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
            _id                    
choiceId                    
name                    
price                    
quantity                    
reductionPrice                    
colorCode 
          }
        }
       
        }
      }
    
  }
}









""";



















 }

