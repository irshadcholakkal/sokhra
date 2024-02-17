import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/catalogue_module/presentation/feature/list_catalogue/widgets/bottom_navigation.dart';
import 'package:lumiereorganics_app/new_cart_module/presentation/blocs/new_cart_bloc/new_cart_state.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../base_module/domain/entity/color_scheme.dart';
import '../../../base_module/domain/entity/translation.dart';
import '../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../base_module/presentation/component/buttons/custom_close_button.dart';
import '../../../base_module/presentation/component/images/custom_image_view.dart';
import '../../../base_module/presentation/component/images/custom_network_image.dart';
import '../../../base_module/presentation/core/values/app_assets.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../../base_module/presentation/util/string_modifiers.dart';
import '../../../catalogue_module/presentation/feature/details/blocs/delivery_check_cubit/delivery_check_cubit.dart';
import '../../../catalogue_module/presentation/feature/list_catalogue/widgets/check_out_item_list.dart';
import '../../../check_out_module/presentation/feature/check_out/check_out_screen.dart';
import '../../../user_module/domain/user_data.dart';
import '../../domain/new_cart_model.dart';
import '../blocs/new_cart_bloc/new_cart_bloc.dart';
import '../blocs/new_cart_bloc/new_cart_event.dart';

class CartBottomBar extends StatefulWidget {
  final List<Cart>? cartList;
  final VoidCallback? onPress;
  const CartBottomBar({Key? key, this.cartList, this.onPress})
      : super(key: key);

  @override
  State<CartBottomBar> createState() => _CartBottomBarState();
}

class _CartBottomBarState extends State<CartBottomBar> {
  bool _isShowItems = false;
  List<Cart> _cartList = [];

  double cartValue = 0;
  double _totalAmount = 0;
  double _taxAmount = 0;
  bool _isloading = false;

  @override
  void initState() {
    _cartList = widget.cartList ?? [];

    super.initState();
    _getTotal();
    BlocProvider.of<NewCartBloc>(context)
        .add(FetchCartItems(pincode: userData.pinCode));
        print("_cartList${_cartList}");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewCartBloc, NewCartState>(
        listener: (context, state) {
          if (state is CartLoading) {
            setState(() {
              _isloading = true;
            });
          }
          if (state is CartLoaded) {
            setState(() {
              _cartList = state.cartList ?? [];
              _getTotal();
              cartValue = _cartList.fold<double>(
                0,
                (result, cart) =>
                    result +
                    ((cart.quantity ?? 0) * (cart.variant?.price ?? 0)),
              );

              // if (cartValue <= 0) {
              //   return SizedBox();
              // }
            });
          }
        },

        // _cartList = widget.cartList ?? [];
        // final cartValue = _cartList.fold<double>(
        //   0,
        //   (result, cart) =>
        //       result + ((cart.quantity ?? 0) * (cart.variant?.price ?? 0)),
        // );
        // // if (cartValue <= 0) {
        // //   return SizedBox();
        // // }

        child: Scaffold(
          appBar: SimpleAppBar(
              title: translation.of('cart.shopping_cart'),
              //"Shopping cart",
              color: AppColorScheme.backgroundLight,
              ontap: widget.onPress),
          body: _isloading!=true
              ? Center(child: CupertinoActivityIndicator())
              : _cartList.isNotEmpty == true
                  ? Container(
                      width: double.infinity,
                      // height: !_isShowItems ? 144 : double.infinity,
                      height: double.infinity,
                      //!_isShowItems ? 116 : double.infinity,
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // if (_isShowItems) ...[
                          //   SizedBox(
                          //     height: MediaQuery.of(context).size.height * .2,
                          //   ),
                          //   CustomCloseButton(
                          //     onTap: () {
                          //       setState(() {
                          //         _isShowItems = false;
                          //       });
                          //     },
                          //   ),
                          //   SizedBox(height: 20),
                          // ],
                          Expanded(
                            child: Container(
                              // decoration: BoxDecoration(
                              //   color: AppColorScheme.sheetBackgroundColor,
                              //   borderRadius: BorderRadius.only(
                              //     topLeft: Radius.circular(AppConstants.cornerRadius),
                              //     topRight: Radius.circular(AppConstants.cornerRadius),
                              //   ),
                              // ),
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  // if (_isShowItems)
                                  Expanded(
                                    child: Container(
                                      child: CheckOutItemList(
                                        // ontap: () {
                                        //   setState(() {
                                        //     _isShowItems = false;
                                        //   });
                                        // },
                                        cartList: _cartList,
                                        //showItems: _isShowItems,
                                      ),
                                      // padding: EdgeInsets.only(top: 20),
                                    ),
                                  ),
                                  BlocBuilder<DeliveryCheckCubit,
                                      DeliveryCheckState>(
                                    builder: (context, state) {
                                      final deliveryInfo =
                                          state is DeliveryCheckSuccess
                                              ? state.data
                                              : null;
                                      final minimumPurchaseAmount =
                                          deliveryInfo?.minimumPurchaseAmount ??
                                              -1;
                                      final freeDeliveryAmount =
                                          minimumPurchaseAmount - cartValue;

                                      final dummies = [0, 1, 2, 3]
                                          .take(min(4, _cartList.length));

                                      return Container(
                                        // height: 144,
                                        height: 90,
                                        padding: EdgeInsetsDirectional.only(
                                          start:
                                              AppConstants.defaultPadding / 2,
                                          end: AppConstants.defaultPadding / 2,
                                          top:
                                              AppConstants.defaultPadding / 2.5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                AppConstants.cornerRadius),
                                            topRight: Radius.circular(
                                                AppConstants.cornerRadius),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColorScheme.onBlack
                                                  .withOpacity(0.2),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            // Row(
                                            //   mainAxisAlignment: MainAxisAlignment.start,
                                            //   crossAxisAlignment:
                                            //       CrossAxisAlignment.center,
                                            //   children: [
                                            //     Container(
                                            //       width: 28,
                                            //       height: 28,
                                            //       // color: Colors.red,
                                            //       padding: EdgeInsets.all(4),
                                            //       decoration: BoxDecoration(
                                            //         borderRadius: BorderRadius.circular(
                                            //           AppConstants.cornerRadius / 2,
                                            //         ),
                                            //         color: AppColorScheme
                                            //             .secondaryBackgroundColor,
                                            //       ),
                                            //       child: CustomImageView(
                                            //         svgPath: ThemeAssets.pedalBike,
                                            //         fit: BoxFit.cover,
                                            //       ),
                                            //     ),
                                            //     SizedBox(width: 10),
                                            //     SizedBox(
                                            //       child: Column(
                                            //         crossAxisAlignment:
                                            //             CrossAxisAlignment.start,
                                            //         mainAxisAlignment:
                                            //             MainAxisAlignment.center,
                                            //         children: [
                                            //           Text(
                                            //             freeDeliveryAmount < 0
                                            //                 ? "You got FREE delivery"
                                            //                 : "Get FREE delivery",
                                            //             style: Theme.of(context)
                                            //                 .textTheme
                                            //                 .caption
                                            //                 ?.copyWith(
                                            //                   color: AppColorScheme
                                            //                       .freeDeliveryColor,
                                            //                   fontWeight: FontWeight.w600,
                                            //                 ),
                                            //           ),
                                            //           // SizedBox(height: 2),
                                            //           if (freeDeliveryAmount >= 0) ...[
                                            //             Text(
                                            //               freeDeliveryAmount < 0
                                            //                   // ? "Your cart value is ₹$cartValue"
                                            //                   ? "Looks like your cart is on a shopping spree"
                                            //                   : "Add products worth ₹$freeDeliveryAmount more",
                                            //               style: Theme.of(context)
                                            //                   .textTheme
                                            //                   .caption
                                            //                   ?.copyWith(
                                            //                     color: Theme.of(context)
                                            //                         .colorScheme
                                            //                         .onBackground
                                            //                         .withOpacity(0.65),
                                            //                     fontSize: 10,
                                            //                     fontWeight:
                                            //                         FontWeight.w400,
                                            //                   ),
                                            //             ),
                                            //           ],
                                            //           // Text(
                                            //           //   freeDeliveryAmount < 0
                                            //           //       // ? "Your cart value is ₹$cartValue"
                                            //           //       ? "Looks like your cart is on a shopping spree"
                                            //           //       : "Add products worth ₹$freeDeliveryAmount more",
                                            //           //   style: Theme.of(context)
                                            //           //       .textTheme
                                            //           //       .caption
                                            //           //       ?.copyWith(
                                            //           //         color: Theme.of(context)
                                            //           //             .colorScheme
                                            //           //             .onBackground
                                            //           //             .withOpacity(0.65),
                                            //           //         fontSize: 10,
                                            //           //         fontWeight: FontWeight.w400,
                                            //           //       ),
                                            //           // ),
                                            //           SizedBox(height: 4),
                                            //           LinearPercentIndicator(
                                            //             padding: EdgeInsets.zero,
                                            //             width: MediaQuery.of(context)
                                            //                     .size
                                            //                     .width -
                                            //                 AppConstants.defaultPadding *
                                            //                     2.2,
                                            //             lineHeight: 2.0,
                                            //             percent: freeDeliveryAmount > 0
                                            //                 ? (cartValue /
                                            //                     minimumPurchaseAmount)
                                            //                 : 1,
                                            //             progressColor: AppColorScheme
                                            //                 .freeDeliveryColor,
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     )
                                            //   ],
                                            // ),
                                            //SizedBox(height: 12),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // SizedBox(
                                                //   child: Row(
                                                //     crossAxisAlignment:
                                                //         CrossAxisAlignment.center,
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment.start,
                                                //     children: [
                                                //       Container(
                                                //         // color:Colors.red,
                                                //         width: 36 + (3 * 8),
                                                //         height: 36,
                                                //         child: Stack(
                                                //           children: dummies.mapIndexed((
                                                //             index,
                                                //             e,
                                                //           ) {
                                                //             return Positioned(
                                                //               left: e * 8.0,
                                                //               child: Container(
                                                //                 width: 36,
                                                //                 height: 36,
                                                //                 decoration: BoxDecoration(
                                                //                   color: Theme.of(context)
                                                //                       .colorScheme
                                                //                       .background,
                                                //                   border: Border.all(
                                                //                       color: Theme.of(
                                                //                               context)
                                                //                           .colorScheme
                                                //                           .tertiary
                                                //                           .withOpacity(
                                                //                               0.25)),
                                                //                   borderRadius:
                                                //                       BorderRadius.all(
                                                //                     Radius.circular(
                                                //                         AppConstants
                                                //                                 .cornerRadius /
                                                //                             2),
                                                //                   ),
                                                //                 ),
                                                //                 child: dummies.length -
                                                //                             1 ==
                                                //                         index
                                                //                     ? CustomNetworkImage(
                                                //                         width: 36,
                                                //                         height: 36,
                                                //                         urlList: [
                                                //                           StringModifiers
                                                //                               .toUrl(_cartList
                                                //                                   .firstOrNull
                                                //                                   ?.product
                                                //                                   ?.thumbnailImage)
                                                //                         ],
                                                //                         borderRadius:
                                                //                             AppConstants
                                                //                                     .cornerRadius /
                                                //                                 2,
                                                //                         fit: BoxFit
                                                //                             .contain,
                                                //                       )
                                                //                     : null,
                                                //               ),
                                                //             );
                                                //           }).toList(),
                                                //         ),
                                                //       ),
                                                //       SizedBox(width: 8),
                                                //       InkWell(
                                                //         onTap: () {
                                                //           setState(() {
                                                //             _isShowItems = !_isShowItems;
                                                //           });
                                                //           // _checkOutIemSheetBottomSheet();
                                                //         },
                                                //         child: Row(
                                                //           children: [
                                                //             Text(
                                                //               "${_cartList.length}"
                                                //               " ITEMS",
                                                //               style: Theme.of(context)
                                                //                   .textTheme
                                                //                   .bodySmall
                                                //                   ?.copyWith(
                                                //                       fontSize: 12,
                                                //                       fontWeight:
                                                //                           FontWeight.w600,
                                                //                       color: Theme.of(
                                                //                               context)
                                                //                           .colorScheme
                                                //                           .onBackground),
                                                //             ),
                                                //             // Icon(
                                                //             //   _isShowItems == false
                                                //             //       ? Icons.arrow_drop_up
                                                //             //       : Icons.arrow_drop_down,
                                                //             //   color: Theme.of(context)
                                                //             //       .colorScheme
                                                //             //       .onBackground,
                                                //             // )
                                                //           ],
                                                //         ),
                                                //       )
                                                //     ],
                                                //   ),
                                                // ),
                                                Column(
                                                  children: [
                                                    Text(
                                                       translation.of('cart.total_price'),

                                                      
                                                      
                                                      //'Total price',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: AppColorScheme
                                                            .onBlack
                                                            .withOpacity(0.5),
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text.rich(
                                                      TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'MAD',
                                                            style: TextStyle(
                                                              color:
                                                                  AppColorScheme
                                                                      .onBlack,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                ' ${_totalAmount}',
                                                            style: TextStyle(
                                                              color:
                                                                  AppColorScheme
                                                                      .onBlack,
                                                              fontSize: 22,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  height: 48,
                                                  width: 163,
                                                  decoration: BoxDecoration(
                                                      color: AppColorScheme
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: MaterialButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (_) =>
                                                              CheckOutScreen(
                                                            cartList: _cartList,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            translation.of(
                                                                "cart.checkout"),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .subtitle1
                                                                ?.copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .surface,
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                ),
                                                          ),
                                                          // SizedBox(width: 3),
                                                          // Padding(
                                                          //   padding: EdgeInsetsDirectional
                                                          //       .fromSTEB(
                                                          //     0,
                                                          //     3,
                                                          //     0,
                                                          //     0,
                                                          //   ),
                                                          //   child: Icon(
                                                          //     Icons.arrow_right,
                                                          //     color: Theme.of(context)
                                                          //         .colorScheme
                                                          //         .surface,
                                                          //   ),
                                                          // )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: Text(
                         translation.of('cart.cart_is_empty'),
                     // "Cart is empty",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: AppColorScheme.onBlack),
                    )),
        ));
  }

  void _getTotal() {
    double totalPrice = 0.0;
    double totalTax = 0.0;

    _cartList.forEach((item) {
      final variant = item.variant ?? 
          item.product?.variants?.firstWhereOrNull(
            (element) => element.id == item.variant?.id,
          );
          print("varientIds${variant}");

      final tax = item.product?.tax?.tax?.fold<double>(0.0, (result, element) {
            return result + (element.percentage ?? 0.0);
          }) ??
          0.0;

      final variantPrice = variant?.price ?? 0.0;
      final reductionPrice = variant?.reductionPrice ?? 0.0;

      final itemQuantity = item.quantity ?? 0.0;
      final itemPrice = variantPrice - reductionPrice;

      final itemTotalPrice = itemQuantity * itemPrice;
      totalPrice += itemTotalPrice;
      totalTax += itemTotalPrice * tax / (100 + tax);
    });

    // final deliveryCharge = _cartList?.isNotEmpty == true
    //     ? _cartList?.first.deliveryCharge ?? 0.0
    //     : 0.0;

    setState(() {
      _totalAmount = totalPrice;
      _taxAmount = totalTax;
    });
  }
}
