import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/images/custom_network_image.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../base_module/presentation/util/string_modifiers.dart';
import '../../../../../new_cart_module/domain/new_cart_model.dart';
import '../../../../../new_cart_module/presentation/widget/increment_button_cart_page.dart';
import '../../../../../new_cart_module/presentation/widget/out_of_stock_button.dart';
import '../../../../../user_module/domain/user_data.dart';
import '../../../../domain/models/product_status.dart';
import '../../details/blocs/delivery_check_cubit/delivery_check_cubit.dart';

class ItemListWidget extends StatefulWidget {
  final List<Cart>? cartList;

  const ItemListWidget({Key? key, this.cartList});

  @override
  State<ItemListWidget> createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  String? _deliveryDate;

  @override
  void initState() {
    super.initState();
    _checkDelivery();
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    List<Cart> inStockItems = [];
    List<Cart> outStockItems = [];

    widget.cartList?.forEach((cart) {
      if (cart.product?.variants?.first.status != ProductStatus.IN_STOCK.name) {
        //if (cart.variant?.status!= ProductStatus.IN_STOCK.name) {
        outStockItems.add(cart);
      } else {
        inStockItems.add(cart);
      }
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (outStockItems.isNotEmpty) ...[
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppConstants.cornerRadiusLarge),
              color: Theme.of(context).colorScheme.background,
              border: Border.all(
                color: AppColorScheme.outOfStockColor.withOpacity(0.25),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding / 2,
                    vertical: AppConstants.defaultPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        AppConstants.cornerRadiusLarge * 0.9,
                      ),
                      topRight: Radius.circular(
                        AppConstants.cornerRadiusLarge * 0.9,
                      ),
                    ),
                    color: AppColorScheme.outOfStockBackgroundColor,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Sorry! ${outStockItems.length} item(s) not in stock",
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColorScheme.outOfStockColor,
                              ),
                        ),
                      )
                    ],
                  ),
                ),
                // SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding / 2,
                    vertical: AppConstants.defaultPadding / 2,
                  ),
                  child: Column(
                    children: outStockItems.mapIndexed((index, cart) {
                      final product = outStockItems[index].product;
                      final inStockData = inStockItems[index];

                      int itemQuantity = 1;

                      final cartItem = outStockItems.firstWhere(
                        (element) => element.product?.id == product?.id,
                        orElse: () => Cart(),
                      );
                      print("cartItem=${cartItem}");

                      if (cartItem.id != null) {
                        itemQuantity = cartItem.quantity ?? 1;
                      }
                      return
                          // Container(
                          //   margin: EdgeInsetsDirectional.only(bottom: 8),
                          //   child: IntrinsicHeight(
                          //     child: Row(
                          //       children: [
                          //         AspectRatio(
                          //           aspectRatio: 1,
                          //           child: CustomNetworkImage(
                          //             urlList: [
                          //               StringModifiers.toUrl(
                          //                 product?.thumbnailImage,
                          //               ),
                          //             ],
                          //             border: Border.all(
                          //               color:
                          //                   AppColorScheme.productCardBorderColor,
                          //             ),
                          //             borderRadius: AppConstants.cornerRadius,
                          //             // padding: EdgeInsetsDirectional.all(8),
                          //             height: 62,
                          //             width: 62,
                          //             fit: BoxFit.contain,
                          //           ),
                          //         ),
                          //         SizedBox(width: 8),
                          //         Expanded(
                          //           child: Column(
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: [
                          //               Text(
                          //                 product?.nameEn ?? '-',
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .caption
                          //                     ?.copyWith(
                          //                       fontWeight: FontWeight.w600,
                          //                       color: Theme.of(context)
                          //                           .colorScheme
                          //                           .onBackground,
                          //                     ),
                          //                 maxLines: 1,
                          //                 overflow: TextOverflow.ellipsis,
                          //               ),
                          //               SizedBox(height: 4),
                          //               Text(
                          //                 product?.variants?.firstOrNull?.name ??
                          //                     "- -",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .caption
                          //                     ?.copyWith(
                          //                       fontWeight: FontWeight.w500,
                          //                       color: Theme.of(context)
                          //                           .colorScheme
                          //                           .onBackground
                          //                           .withOpacity(0.5),
                          //                     ),
                          //                 maxLines: 1,
                          //                 overflow: TextOverflow.ellipsis,
                          //               ),
                          //               SizedBox(height: 4),
                          //               Text(
                          //                 "MAD ${product?.variants?.firstOrNull?.price.toString().split('.').first ?? "- -"}",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .caption
                          //                     ?.copyWith(
                          //                       fontWeight: FontWeight.w600,
                          //                       color: Theme.of(context)
                          //                           .colorScheme
                          //                           .onBackground,
                          //                     ),
                          //                 maxLines: 1,
                          //                 overflow: TextOverflow.ellipsis,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //         SizedBox(width: 8),
                          //         IncrementDecrementButton(
                          //           cartItemId: cartItem.id!,
                          //           itemQuantity: itemQuantity,
                          //           maximumQuantity:
                          //               cartItem.variant?.maximumQuantity ?? 10,
                          //           minimumQuantity:
                          //               cartItem.variant?.minimumQuantity ?? 1,
                          //           pincode: userData.pinCode,
                          //           hideCount: true,
                          //           showDelete: true,
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // );
                          GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsetsDirectional.only(bottom: 16),
                          width: 350,
                          height: 116,
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            bottom: 8,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: AppColorScheme.onPrimaryLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x0C000000),
                                blurRadius: 7,
                                offset: Offset(0, 3),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: CustomNetworkImage(
                                    urlList: [
                                      StringModifiers.toUrl(
                                        product?.thumbnailImage,
                                      ),
                                    ],
                                    border: Border.all(
                                      color:
                                          AppColorScheme.productCardBorderColor,
                                    ),
                                    borderRadius: AppConstants.cornerRadius,
                                    height: 62,
                                    width: 62,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                    width: AppConstants.defaultPadding * 0.4),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        translation.isArabic
                                            ? product?.nameAr ??
                                                product?.nameEn ??
                                                '-'
                                            : translation.isFrench
                                                ? product?.nameFr ??
                                                    product?.nameEn ??
                                                    '-'
                                                : product?.nameEn ?? '-',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            // width:
                                            // 46.56,
                                            height: 18.07,

                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 0.38,
                                                    color: AppColorScheme
                                                        .primaryColorDark),
                                                borderRadius:
                                                    BorderRadius.circular(4.52),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                inStockData.variant?.name ?? "",
                                                // product?.variants?.firstOrNull?.name ??"- -",

                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    ?.copyWith(
                                                      fontSize: 9.05,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFF1D1A20),
                                                    ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'MAD',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.copyWith(
                                                    color: AppColorScheme
                                                        .primaryColor,
                                                    fontSize: 12.57,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${inStockData.variant?.price}',
                                              // ' ${product?.variants?.firstOrNull?.price.toString().split('.').first ?? "- -"}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.copyWith(
                                                    color: AppColorScheme
                                                        .primaryColor,
                                                    fontSize: 17.29,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: AppConstants.defaultPadding * 0.4),
                                // if (isInStock)
                                IncrementDecrementButtonCartPage(
                                  products: product,
                                  selectedProducts: inStockData,
                                  cartItemId: cartItem.id ?? "",
                                  itemQuantity: itemQuantity,
                                  maximumQuantity:
                                      cartItem.variant?.maximumQuantity ?? 10,
                                  minimumQuantity:
                                      cartItem.variant?.minimumQuantity ?? 1,
                                  pincode: userData.pinCode,
                                )
                                // else
                                //   OutOfStockButton(),
                                // SizedBox(
                                //   width: 22.51,
                                // )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          AppPadding(dividedBy: 2),
        ],
        // Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(
        //       AppConstants.cornerRadiusLarge,
        //     ),
        //     color: Theme.of(context).colorScheme.background,
        //   ),
        //   padding: EdgeInsets.symmetric(
        //     horizontal: AppConstants.defaultPadding / 2,
        //     vertical: AppConstants.defaultPadding / 2,
        //   ),
        //   child:

        // BlocBuilder<DeliveryCheckCubit, DeliveryCheckState>(
        //   builder: (context, state) {
        //     if (state is DeliveryCheckLoading) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else if (state is DeliveryCheckSuccess) {
        //       final deliveryDate = DateTime.fromMillisecondsSinceEpoch(
        //         int.parse(state.data.deliveryDate ?? ""),
        //       );

        //       final difference = deliveryDate.difference(currentDate);

        //       final sameDay = isSameDay(currentDate, deliveryDate);

        //       if (sameDay == true) {
        //         if (difference.isNegative == false) {
        //           _deliveryDate = "${difference.inHours} :"
        //               "${difference.inMinutes}"
        //               " Minutes";
        //         } else {
        //           _deliveryDate = "Today";
        //         }
        //       } else {
        //         _deliveryDate = DateFormat('dd-MM-yyyy').format(deliveryDate);
        //       }

        //       return
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   // color: Colors.red,
            //   child: Row(
            //     children: [
            //       Container(
            //         padding: EdgeInsets.all(4),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(
            //             AppConstants.cornerRadius / 2,
            //           ),
            //           color: AppColorScheme.secondaryBackgroundColor,
            //         ),
            //         child: CustomImageView(
            //           width: 24,
            //           height: 24,
            //           svgPath: ThemeAssets.timer,
            //         ),
            //       ),
            //       SizedBox(width: 8),
            //       Expanded(
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: [
            //             Text(
            //               "Delivery in  ${_deliveryDate}",
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .caption
            //                   ?.copyWith(
            //                     fontWeight: FontWeight.w600,
            //                     color: Theme.of(context)
            //                         .colorScheme
            //                         .onBackground,
            //                   ),
            //             ),
            //             SizedBox(height: 2),
            //             Text(
            //               "Shipment of ${inStockItems.length} items",
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .caption
            //                   ?.copyWith(
            //                     fontSize: 10,
            //                     fontWeight: FontWeight.w500,
            //                     color: Theme.of(context)
            //                         .colorScheme
            //                         .onBackground
            //                         .withOpacity(0.5),
            //                   ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            if (inStockItems.isNotEmpty == true)
              Container(
                // color: Colors.yellow,
                child: Column(
                  children: inStockItems.mapIndexed((index, cart) {
                    final product = inStockItems[index].product;
                    final inStockData = inStockItems[index];
                    int itemQuantity = 1;
                    bool isInStock = false;
                    // ignore: sdk_version_since
                    // product?.status == ProductStatus.IN_STOCK.name;
                    // product?.variants?[index].status == ProductStatus.IN_STOCK.name;
                    product?.variants?.forEach((element) {
                      if (element.status == ProductStatus.IN_STOCK.name) {
                        isInStock = true;
                      } else {
                        // isInStock = false;
                      }
                    });

                    final cartItem = inStockItems.firstWhere(
                      (element) => element.product?.id == product?.id,
                      orElse: () => Cart(),
                    );

                    if (cartItem.id != null) {
                      itemQuantity = cartItem.quantity ?? 1;
                    }

                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsetsDirectional.only(bottom: 16),
                        width: 350,
                        height: 116,
                        padding: const EdgeInsets.only(
                          top: 8,
                          left: 8,
                          // right: 22.51,
                          bottom: 8,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: AppColorScheme.onPrimaryLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x0C000000),
                              blurRadius: 7,
                              offset: Offset(0, 3),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: CustomNetworkImage(
                                  urlList: [
                                    StringModifiers.toUrl(
                                      product?.thumbnailImage,
                                    ),
                                  ],
                                  border: Border.all(
                                    color:
                                        AppColorScheme.productCardBorderColor,
                                  ),
                                  borderRadius: AppConstants.cornerRadius,
                                  // padding: EdgeInsetsDirectional.all(8),
                                  height: 62,
                                  width: 62,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      translation.isArabic
                                          ? product?.nameAr ??
                                              product?.nameEn ??
                                              '-'
                                          : translation.isFrench
                                              ? product?.nameFr ??
                                                  product?.nameEn ??
                                                  '-'
                                              : product?.nameEn ?? '-',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // SizedBox(height: 4),
                                    Container(
                                      // width: 46.56,
                                      height: 18.07,
                                      // padding: const EdgeInsets.symmetric(
                                      //     horizontal: 5.28, vertical: 0),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 0.38,
                                              color: AppColorScheme
                                                  .primaryColorDark),
                                          borderRadius:
                                              BorderRadius.circular(4.52),
                                        ),
                                      ),
                                      child: Text(
                                        inStockData.variant?.name ?? "",
                                        // product?.variants?.firstOrNull
                                        //         ?.name ??
                                        //     "- -",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            ?.copyWith(
                                              fontSize: 9.05,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF1D1A20),
                                            ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    //SizedBox(height: 4),
                                    // Text(
                                    //   "MAD ${product?.variants?.firstOrNull?.price.toString().split('.').first ?? "- -"}",
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .caption
                                    //       ?.copyWith(
                                    //         fontSize: 12.57,
                                    //         fontFamily: AppConstants.defaultFont,
                                    //         fontWeight: FontWeight.w400,
                                    //         color:
                                    //             AppColorScheme.primaryColor,
                                    //       ),
                                    //   maxLines: 1,
                                    //   overflow: TextOverflow.ellipsis,
                                    // ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'MAD',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption
                                                ?.copyWith(
                                                  color: AppColorScheme
                                                      .primaryColor,
                                                  fontSize: 12.57,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          TextSpan(
                                            text:
                                                '${inStockData.variant?.price}',
                                            // ' ${product?.variants?.firstOrNull?.price.toString().split('.').first ?? "- -"}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption
                                                ?.copyWith(
                                                  color: AppColorScheme
                                                      .primaryColor,
                                                  fontSize: 17.29,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //SizedBox(width: 8),
                              if (isInStock)
                                IncrementDecrementButtonCartPage(
                                  products: product,
                                  selectedProducts: inStockData,
                                  cartItemId: cartItem.id!,
                                  itemQuantity: itemQuantity,
                                  maximumQuantity:
                                      cartItem.variant?.maximumQuantity ?? 10,
                                  minimumQuantity:
                                      cartItem.variant?.minimumQuantity ?? 1,
                                  pincode: userData.pinCode,
                                )
                              else
                                OutOfStockButton(),
                              SizedBox(
                                width: 22.51,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            // ],
            //  );
            // } else if (state is DeliveryCheckFailed) {
            //   return Center(
            //     child: Text(state.message),
            //   );
            // } else {
            //   return Center(
            //     child: Text("Some error"),
            //   );
            //  }
            //   },
            // ),
            // //),
          ],
        )
      ],
    );
  }

  _checkDelivery() {
    BlocProvider.of<DeliveryCheckCubit>(context).checkPinCode(
      pincode: userData.pinCode,
      place: userData.place,
      lat: userData.lat,
      lng: userData.lng,
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
