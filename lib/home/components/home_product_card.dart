import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../base_module/domain/entity/app.dart';
import '../../base_module/domain/entity/color_scheme.dart';
import '../../base_module/domain/entity/translation.dart';
import '../../base_module/presentation/component/images/custom_network_image.dart';
import '../../base_module/presentation/core/values/app_assets.dart';
import '../../base_module/presentation/core/values/app_constants.dart';
import '../../base_module/presentation/util/string_modifiers.dart';
import '../../catalogue_module/domain/models/products_by_subcategory_model.dart';
import '../../catalogue_module/presentation/feature/details/widgets/product_detailse_bottom_sheet.dart';
import '../../globals.dart';
import '../../new_cart_module/domain/new_cart_model.dart';
import '../../new_cart_module/presentation/widget/increment_decrement_button.dart';
import '../../new_cart_module/presentation/widget/new_add_to_cart_button.dart';
import '../../new_cart_module/presentation/widget/out_of_stock_button.dart';
import '../../user_module/domain/user_data.dart';

class HomeProductCard extends StatelessWidget {
  final Product product;
  final bool isInCart;
  final bool isInStock;
  final Cart? cartItem;
  final int itemQuantity;
  final EdgeInsetsGeometry? margin;

  const HomeProductCard({
    Key? key,
    required this.product,
    required this.isInCart,
    required this.isInStock,
    required this.cartItem,
    required this.itemQuantity,
    this.margin,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: margin,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: AppColorScheme.onPrimaryLight,
          //border: Border.all(color: AppColorScheme.productCardBorderColor),
          borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(13),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      print("************************${cartItem?.id}");
                      
                      // _productDetailsBottomSheet(
                      //   product: product,
                      //   isInCart: isInCart,
                      //   cartItem: cartItem,
                      //   itemQuantity: itemQuantity,
                      // );

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              productData: product,
                              isInCart: isInCart,
                              cartItem: cartItem,
                              itemQuantity: itemQuantity,
                            ),
                          ));

                      //           ProductDetails(
                      //   productData: product,
                      //   isInCart: isInCart,
                      //   cartItem: cartItem,
                      //   itemQuantity: itemQuantity,
                      // );
                    },
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  AppConstants.cornerRadius / 1.1,
                                ),
                                topRight: Radius.circular(
                                  AppConstants.cornerRadius / 1.1,
                                ),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: CustomNetworkImage(
                                urlList: [
                                  StringModifiers.toUrl(product.thumbnailImage),
                                ],
                                // borderRadius: AppConstants.cornerRadius / 1.5,
                                fit: BoxFit.cover,
                                imageAsset: ThemeAssets.dummy_image_product,
                                opacity: 0.5,
                                placeHolderFit: BoxFit.contain,
                                //placeHolderPadding: EdgeInsets.all(12),
                              ),
                            ),
                          ),
                          Text(
                            product.variants?.firstOrNull?.name ?? "- -",
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(0.75),
                                    ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            ( 
                              translation.isArabic?product.nameAr ?? product.nameEn!:
                              translation.isFrench?product.nameFr ?? product.nameEn!:
                              product.nameEn ?? ""
                             //product.brand?.name??""
                              ),
                            textAlign: TextAlign.start,
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      fontSize: 10.04,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Expanded(
                        //   child: Text(
                        //     (product.nameEn ?? ""),
                        //     style: Theme.of(context).textTheme.caption?.copyWith(
                        //           fontSize: 10,
                        //           fontWeight: FontWeight.w500,
                        //           color:
                        //               Theme.of(context).colorScheme.onBackground,
                        //         ),
                        //     maxLines: 2,
                        //     overflow: TextOverflow.ellipsis,
                        //   ),
                        // ),
                        // SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Expanded(
                            //   child: Text(
                            //     product.variants?.firstOrNull?.name ?? "- -",
                            //     style:
                            //         Theme.of(context).textTheme.caption?.copyWith(
                            //               fontWeight: FontWeight.w500,
                            //               color: Theme.of(context)
                            //                   .colorScheme
                            //                   .onBackground
                            //                   .withOpacity(0.75),
                            //             ),
                            //     maxLines: 1,
                            //     overflow: TextOverflow.ellipsis,
                            //   ),
                            // ),
                            Text(
                              "MAD ${product.variants?.firstOrNull?.price?.toString().split('.').first ?? ""}",
                              style: Theme.of(context).textTheme.caption?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: AppColorScheme.primaryColor
                                  //Theme.of(context).colorScheme.onBackground,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  "BHD ${product.variants?.firstOrNull?.reductionPrice?.toString().split('.').first ?? ""}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          color: Color(0xFFD5BBFC)
                                          //Theme.of(context).colorScheme.onBackground,
                                          ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 4.50)
                                    ..rotateZ(-0.15),
                                  child: Container(
                                    width: 50,
                                    height: 2,
                                    decoration:
                                        BoxDecoration(color: Color(0xFFD5BBFC)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      
                        if (isInStock)
                          isInCart
                              ? IncrementDecrementButton(
                                  width: double.infinity,
                                  borderRadius: 8,
                                  cartItemId: cartItem!.id!,
                                  itemQuantity: itemQuantity,
                                  maximumQuantity:
                                      cartItem?.variant?.maximumQuantity ?? 10,
                                  minimumQuantity:
                                      cartItem?.variant?.minimumQuantity ?? 1,
                                  pincode: userData.pinCode,
                                  // pincode: "560038",
                                )
                              : AddToCartButtonNew(
                            
                                  width: double.infinity,
                                  borderRadius: 8,
                                  choiceId: product.variants?.first.id ?? "",
                                  deviceId: App().deviceId!,
                                  pincode: userData.pinCode,
                                  
                                  // pincode: "560038",
                                  productId: product.id!,
                                  quantity:
                                      product.variants?.first.minimumQuantity ??
                                          1,
                                          variantChoiceId: product.variants?.first.id??"",
                                  text: "Add",
                                )
                                    else
                          OutOfStockButton(
                            width: double.infinity,
                            borderRadius: 8,
                          )
                          
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
            Container(
              width: 46,
              height: 21,
              decoration: ShapeDecoration(
                color: Color(0xFFFFAD46),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(6)),
                ),
              ),
              child: Center(
                child: Text(
                  translation.of("product_card.new"),
                  //'New ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColorScheme.onPrimaryLight,
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _productDetailsBottomSheet({
    Product? product,
    bool? isInCart,
    Cart? cartItem,
    int? itemQuantity,
  }) {
    showBottomSheetPopup(
      builder: (context) {
        return ProductDetails(
          productData: product,
          isInCart: isInCart,
          cartItem: cartItem,
          itemQuantity: itemQuantity,
        );
      },
    );
  }
}
