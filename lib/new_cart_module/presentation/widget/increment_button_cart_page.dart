import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/new_cart_module/presentation/widget/increment_decrement_button.dart';
import 'package:lumiereorganics_app/new_cart_module/presentation/widget/increment_decrement_button_remove_item.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../base_module/domain/entity/color_scheme.dart';
import '../../../base_module/domain/entity/translation.dart';
import '../../../base_module/presentation/component/images/custom_network_image.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../../base_module/presentation/util/string_modifiers.dart';
import '../../../catalogue_module/domain/models/product.dart';
import '../../domain/new_cart_model.dart';
import '../blocs/new_cart_bloc/new_cart_bloc.dart';
import '../blocs/new_cart_bloc/new_cart_event.dart';
import '../blocs/new_update_cart_bloc/new_update_cart_bloc.dart';
import '../blocs/new_update_cart_bloc/new_update_cart_event.dart';
import '../blocs/new_update_cart_bloc/new_update_cart_state.dart';

class IncrementDecrementButtonCartPage extends StatefulWidget {
  final int itemQuantity;
  final int minimumQuantity;
  final int maximumQuantity;
  final String cartItemId;
  final String pincode;
  final bool showDelete;
  final bool hideCount;
  final double? borderRadius;
  final double? width;
  final double? height;
  dynamic products;
  dynamic selectedProducts;

  IncrementDecrementButtonCartPage(
      {Key? key,
      required this.cartItemId,
      required this.itemQuantity,
      required this.maximumQuantity,
      required this.minimumQuantity,
      required this.pincode,
      this.selectedProducts,
      this.showDelete = false,
      this.hideCount = false,
      this.borderRadius,
      this.width,
      this.height,
      this.products})
      : super(key: key);

  @override
  State<IncrementDecrementButtonCartPage> createState() =>
      _IncrementDecrementButtonCartPageState();
}

class _IncrementDecrementButtonCartPageState
    extends State<IncrementDecrementButtonCartPage> {
  List<Cart> cartList = [];
  int _itemQuantity = 1;
  final _newUpdateCartBloc = NewUpdateCartBloc();

  @override
  void initState() {
    super.initState();
    _itemQuantity = widget.itemQuantity;
  }

  @override
  void dispose() {
    _newUpdateCartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _itemQuantity = widget.itemQuantity;

    return Container(
      width: widget.width ?? 23.49,
      height: widget.height ?? 69.64,
      decoration: widget.hideCount
          ? null
          : BoxDecoration(
              color: AppColorScheme.onPrimaryLight,
              borderRadius: BorderRadius.circular(
                widget.borderRadius ?? AppConstants.cornerRadius / 3,
              ),
            ),
      child: BlocConsumer<NewUpdateCartBloc, NewUpdateCartState>(
        bloc: _newUpdateCartBloc,
        listener: (context, state) {
          if (state is UpdateCartLoaded) {
            setState(() {
              _itemQuantity = state.quantity!;
            });

            BlocProvider.of<NewCartBloc>(context).add(
              FetchCartItems(pincode: widget.pincode),
            );
          }
        },
        builder: (context, state) {
          if (state is UpdateCartLoading) {
            return Center(
              child: CupertinoActivityIndicator(color: AppColorScheme.onPrimaryLight),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!widget.hideCount)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            final newQuantity = _itemQuantity - 1;

                            if (newQuantity > 0) {
                              setState(() {
                                _itemQuantity = newQuantity;
                              });

                              _newUpdateCartBloc.add(
                                DecrementCartItemValue(
                                  cartItemId: widget.cartItemId,
                                  pincode: widget.pincode,
                                  quantity: _itemQuantity,
                                ),
                              );
                            } else {
                              _showDeleteConfirmBottomSheet();
                              // _showDeleteConfirmDialog();
                            }
                          },
                          child: Container(
                            width: 23.49,
                            height: 23.49,
                            //padding: const EdgeInsets.symmetric(horizontal: 16),
                            //clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFCBC4CF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.92)),
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 20,
                              color: AppColorScheme.onPrimaryLight,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              _itemQuantity.toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    fontSize: 11.75,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: AppColorScheme.primaryColor,
                                  ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (_itemQuantity < widget.maximumQuantity) {
                              setState(() {
                                _itemQuantity = _itemQuantity + 1;
                              });

                              _newUpdateCartBloc.add(
                                IncrementCartItemValue(
                                  cartItemId: widget.cartItemId,
                                  pincode: widget.pincode,
                                  quantity: _itemQuantity,
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: 23.49,
                            height: 23.49,
                            //  padding:
                            // const EdgeInsets.symmetric(horizontal: 16),
                            // clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: AppColorScheme.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.92)),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: AppColorScheme.onPrimaryLight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (widget.showDelete) ...[
                  if (!widget.hideCount) SizedBox(width: 8),
                  InkWell(
                    onTap: _showDeleteConfirmBottomSheet,
                    // _showDeleteConfirmDialog,
                    child: Icon(
                      MdiIcons.deleteOutline,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  )
                ],
              ],
            );
          }
        },
      ),
    );
  }

  // void _showDeleteConfirmDialog() {
  //   bool isDeleting = false;
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return StatefulBuilder(builder: (context, setState2) {
  //         return BlocListener<NewUpdateCartBloc, NewUpdateCartState>(
  //           bloc: _newUpdateCartBloc,
  //           listener: (context, state) {
  //             if (state is DeleteCartSuccess) {
  //               BlocProvider.of<NewCartBloc>(context).add(
  //                 FetchCartItems(pincode: widget.pincode),
  //               );
  //               Navigator.of(context).pop();
  //             } else if (state is DeleteCartFailed) {
  //               setState2(() {
  //                 isDeleting = false;
  //               });
  //             }
  //           },
  //           child: AlertDialog(
  //             insetPadding: const EdgeInsets.all(AppConstants.defaultPadding),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
  //             ),
  //             title: Text(
  //               "Confirm delete",
  //               style: Theme.of(context).textTheme.headline6?.copyWith(
  //                     color: Theme.of(context).colorScheme.onBackground,
  //                   ),
  //             ),
  //             content: Text(
  //               "Are you sure to remove this item from cart?",
  //               style: Theme.of(context).textTheme.subtitle2?.copyWith(
  //                     color: Theme.of(context).colorScheme.onBackground,
  //                   ),
  //             ),
  //             actionsAlignment: MainAxisAlignment.spaceAround,
  //             actions: [
  //               ElevatedButton(
  //                 onPressed: () {
  //                   if (isDeleting) return;
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text(
  //                   translation.of('no').toUpperCase(),
  //                   style: Theme.of(context).textTheme.button?.copyWith(
  //                         color: Theme.of(context).colorScheme.onPrimary,
  //                       ),
  //                 ),
  //                 style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
  //                       padding: MaterialStateProperty.all(
  //                         const EdgeInsets.symmetric(horizontal: 45),
  //                       ),
  //                     ),
  //               ),
  //               OutlinedButton(
  //                 onPressed: () {
  //                   if (isDeleting) return;
  //                   setState2(() {
  //                     isDeleting = true;
  //                   });
  //                   _newUpdateCartBloc.add(
  //                     DeleteCartItem(cartItemId: widget.cartItemId),
  //                   );
  //                 },
  //                 child: isDeleting
  //                     ? CupertinoActivityIndicator()
  //                     : Text(
  //                         translation.of("yes").toUpperCase(),
  //                         style: Theme.of(context).textTheme.button?.copyWith(
  //                             color: Theme.of(context).colorScheme.error),
  //                       ),
  //                 style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
  //                       padding: MaterialStateProperty.all(
  //                         const EdgeInsets.symmetric(horizontal: 45),
  //                       ),
  //                       side: MaterialStateProperty.all(
  //                         BorderSide(
  //                           color: Theme.of(context).colorScheme.error,
  //                         ),
  //                       ),
  //                     ),
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  //     },
  //   );
  // }

  void _showDeleteConfirmBottomSheet() {
    bool isDeleting = false;

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppConstants.cornerRadius)),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState2) {
          return BlocListener<NewUpdateCartBloc, NewUpdateCartState>(
            bloc: _newUpdateCartBloc,
            listener: (context, state) {
              if (state is DeleteCartSuccess) {
                BlocProvider.of<NewCartBloc>(context).add(
                  FetchCartItems(pincode: widget.pincode),
                );

                Navigator.of(context).pop();
              } else if (state is DeleteCartFailed) {
                setState2(() {
                  isDeleting = false;
                });
              }
            },
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Iconsax.arrow_left,
                            size: 18,
                          )),
                      Text(
                        'Remove from cart ?',
                        style: TextStyle(
                          color: Color(0xFF1D1B1E),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    height: 0.50,
                  ),
                  // Text(
                  //   "Confirm delete",
                  //   style: Theme.of(context).textTheme.headline6?.copyWith(
                  //         color: Theme.of(context).colorScheme.onBackground,
                  //       ),
                  // ),
                  SizedBox(height: 12),

                  // Text(
                  //   widget.products?.nameEn ?? '-',
                  //     style: Theme.of(context).textTheme.caption?.copyWith(
                  //           fontWeight: FontWeight.w600,
                  //           color: Theme.of(context).colorScheme.onBackground,
                  //         ),
                  //     maxLines: 1,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),

                  _singleProduct(),

                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (isDeleting) return;
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          translation.of("cancel").toUpperCase(),
                          style: TextStyle(
                            color: AppColorScheme.primaryColor,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 45, vertical: 15),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                Color(0xFFF7F2FA),
                              ),
                            ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (isDeleting) return;

                          setState2(() {
                            isDeleting = true;
                          });

                          _newUpdateCartBloc.add(
                            DeleteCartItem(cartItemId: widget.cartItemId),
                          );
                        },
                        child: isDeleting
                            ? CupertinoActivityIndicator()
                            : Text(
                                translation.of("remove"),
                                style: TextStyle(
                                  color: AppColorScheme.onPrimaryLight,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 45, vertical: 15),
                              ),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: AppColorScheme.primaryColor,
                                ),
                              ),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Widget _singleProduct() {
    return Container(
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
                      widget.products?.thumbnailImage,
                    ),
                  ],
                  border: Border.all(
                    color: AppColorScheme.productCardBorderColor,
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
                      widget.products?.nameEn ?? '-',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: Theme.of(context).colorScheme.onBackground,
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
                          side:
                              BorderSide(width: 0.38, color: Color(0xFFCBC4CF)),
                          borderRadius: BorderRadius.circular(4.52),
                        ),
                      ),
                      child: Text(
                        widget.selectedProducts.variant?.name??"-",
                       // widget.products?.variants?.first?.name ?? "- -",
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 9.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1D1A20),
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'MAD',
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      color: AppColorScheme.primaryColor,
                                      fontSize: 12.57,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          TextSpan(
                            text:
                            '${widget.selectedProducts?.variant?.price.toString().split('.').first ?? "- -"}',
                               // ' ${widget.products?.variants?.first?.price.toString().split('.').first ?? "- -"}',
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      color: AppColorScheme.primaryColor,
                                      fontSize: 17.29,
                                      fontFamily: 'Poppins',
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
              // if (isInStock)
              IncrementDecrementButtonRemoveItem(
                cartItemId: widget.cartItemId,
                itemQuantity: widget.itemQuantity,
                maximumQuantity: widget.maximumQuantity,
                minimumQuantity: widget.minimumQuantity,
                pincode: widget.pincode,

              )
              // else
              //   OutOfStockButton(),
              //   SizedBox(width: 22.51,)
            ],
          ),
        ));
  }
}
