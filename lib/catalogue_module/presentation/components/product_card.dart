import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../base_module/domain/entity/app.dart';
import '../../../base_module/domain/entity/color_scheme.dart';
import '../../../base_module/domain/entity/translation.dart';
import '../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../base_module/presentation/core/values/app_assets.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../../cart_wishlist_module/data/entity/input_models/wish_list_input.dart';
import '../../../cart_wishlist_module/presentation/feature/cart/blocs/variant_cubit/variant_cubit.dart';
import '../../../cart_wishlist_module/presentation/feature/wishlist/blocs/customer_wishlist_bloc/customer_wishlist_bloc.dart';
import '../../../user_module/domain/user_data.dart';
import '../../domain/catalogue_data.dart';
import '../../domain/models/product.dart';
import '../../domain/models/variant.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final Variant? wishlistVariant;
  final bool isWishListed;
  final double width;
  const ProductCard(
      {Key? key,
      required this.product,
      required this.width,
      this.isWishListed = false,
      this.wishlistVariant})
      : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  List<Variant>? _list;
  // double cardWidth = 185;
  double cardWidth = 200;
  bool _addedToCart = false;
  bool _isDiscountAvailable = false;
  bool isWishListed = false;
  Variant? firstVariant;
  String? wishlistId;

  getWishList() {
    BlocProvider.of<CustomerWishlistBloc>(context).add(
        CustomerWishListFetchEvent(
            reFetch: true, lat: userData.lat, lng: userData.lng));
  }

  @override
  void initState() {
    List<Variant> list =
        widget.wishlistVariant != null ? [widget.wishlistVariant!] : [];
    _list = widget.product.variants ?? list;
    firstVariant = _list!.isNotEmpty
        ? _list?.firstWhere((element) => element.isDefault == true,
            orElse: () => _list!.first)
        : null;

    // urlList =
    //     "${widget.product.avatar.isNotEmpty ? widget.product.avatar[0] : ""}"
    //         .split(",");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VariantCubit>(
      create: (context) => VariantCubit()..setVariant(variant: firstVariant),
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.cornerRadius)),
          child: Stack(
            children: [
              Container(
                width: widget.width,
                // width: cardWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          // color: Colors.yellow,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: widget.product.thumbnailImage != null
                                ? Image.network(
                                    AppConstants.filesUrl +
                                        widget.product.thumbnailImage!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, object, stack) {
                                      return Image.asset(
                                        ThemeAssets.dummy_image_product,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;

                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: AppColorScheme
                                            .onPrimaryLight
                                            .withOpacity(0.6),
                                        period: Duration(seconds: 5),
                                        child: Container(
                                          color:
                                              AppColorScheme.surfaceColorLight,
                                          width: double.infinity,
                                        ),
                                      );
                                    },
                                  )
                                : Image.asset(
                                    ThemeAssets.dummy_image_product,
                                    fit: BoxFit.cover,
                                  ),
                          )
                          // widget.product.thumbnailImage != null
                          //     ? Image.network(
                          //   AppConstants.filesUrl +
                          //       widget.product.thumbnailImage!,
                          //   fit: BoxFit.cover,
                          //
                          //   errorBuilder: (_, object, stack) {
                          //     return
                          //       Image.asset(ThemeAssets.dummy_image_product,fit: BoxFit.cover,);
                          //   },
                          //   loadingBuilder:
                          //       (context, child, loadingProgress) {
                          //     if (loadingProgress == null) return child;
                          //
                          //     return  Shimmer.fromColors(
                          //       baseColor: Colors.grey.shade300,
                          //       highlightColor: AppColorScheme.onPrimaryLight.withOpacity(0.6),
                          //       period: Duration(seconds: 5),
                          //       child: Container(
                          //         color: AppColorScheme.surfaceColorLight,
                          //
                          //         width: double.infinity,
                          //       ),
                          //     );
                          //   },
                          //
                          // )
                          //     : Image.asset(
                          //   ThemeAssets.dummy_image_product,
                          //   fit: BoxFit.cover,
                          // ),
                          ),
                    ),
                    const AppPadding(
                      dividedBy: 2,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.defaultPadding / 2.2),
                      width: cardWidth * 0.8,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.product.nameEn ?? translation.of("n/a"),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15),
                        ),
                      ),
                    ),
                    // const AppPadding(
                    //   dividedBy: 4,
                    // ),
                    // _list!.isNotEmpty
                    //     ? Container(
                    //         padding: const EdgeInsets.symmetric(
                    //             horizontal: AppConstants.defaultPadding / 2.2),
                    //         child: Container(
                    //           padding: const EdgeInsets.symmetric(
                    //               horizontal:
                    //                   AppConstants.defaultPadding / 2.2),
                    //           height: 35,
                    //           width: (cardWidth -
                    //               (AppConstants.defaultPadding / 2.2)),
                    //           decoration: BoxDecoration(
                    //               color:
                    //                   Theme.of(context).colorScheme.background,
                    //               borderRadius: BorderRadius.circular(
                    //                   AppConstants.cornerRadius * 0.6)),
                    //           child: Center(
                    //             child: Builder(
                    //               builder: (context) {
                    //                 if (_list!.isNotEmpty) {
                    //                   return BlocBuilder<VariantCubit,
                    //                       VariantState>(
                    //                     builder:
                    //                         (variantContext, variantState) {
                    //                       if (variantState
                    //                           is VariantLoadedState) {
                    //                         return DropdownButton<Variant>(
                    //                           onChanged: (Variant? val) {
                    //                             BlocProvider.of<VariantCubit>(
                    //                                     variantContext)
                    //                                 .setVariant(variant: val);
                    //                           },
                    //                           isExpanded: true,
                    //                           value: variantState.variant,
                    //                           underline: Container(),
                    //                           items: _list!
                    //                               .map((e) => DropdownMenuItem<
                    //                                       Variant>(
                    //                                   key: PageStorageKey(
                    //                                       "CHOICEDROPDOWNKEY"),
                    //                                   value: e,
                    //                                   child: Text(
                    //                                     e.name ?? "",
                    //                                     style: Theme.of(context)
                    //                                         .textTheme
                    //                                         .subtitle1!
                    //                                         .copyWith(
                    //                                             fontSize: 10),
                    //                                   )))
                    //                               .toList(),
                    //                         );
                    //                       } else {
                    //                         return DropdownButton<Variant>(
                    //                           onChanged: (Variant? val) {
                    //                             BlocProvider.of<VariantCubit>(
                    //                                     variantContext)
                    //                                 .setVariant(variant: val);
                    //                           },
                    //                           isExpanded: true,
                    //                           underline: Container(),
                    //                           items: _list!
                    //                               .map((e) => DropdownMenuItem<
                    //                                       Variant>(
                    //                                   key: PageStorageKey(
                    //                                       "CHOICEDROPDOWNKEY"),
                    //                                   value: e,
                    //                                   child: Text(
                    //                                     e.name ?? "",
                    //                                     style: Theme.of(context)
                    //                                         .textTheme
                    //                                         .subtitle1!
                    //                                         .copyWith(
                    //                                             fontSize: 10),
                    //                                   )))
                    //                               .toList(),
                    //                         );
                    //                       }
                    //                     },
                    //                   );
                    //                 } else {
                    //                   return Container();
                    //                 }
                    //               },
                    //             ),
                    //           ),
                    //         ),
                    //       )
                    //     : Container(),
                    const AppPadding(
                      dividedBy: 3,
                    ),

                    BlocBuilder<VariantCubit, VariantState>(
                        builder: (choiceContext, choiceState) {
                      if (choiceState is VariantLoadedState) {
                        if (CatalogueData.map
                            .containsKey(widget.product.productId)) {
                          if (CatalogueData.map[widget.product.productId]!
                              .containsKey(choiceState.variant!.variantId)) {
                            _addedToCart = true;
                          } else {
                            _addedToCart = false;
                          }
                        }
                        ;
                        return Container(
                          padding: const EdgeInsets.only(
                              left: AppConstants.defaultPadding / 2.2,
                              right: AppConstants.defaultPadding / 2.2,
                              bottom: AppConstants.defaultPadding / 2.2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Text(
                                    "₹ ${choiceState.variant?.price ?? ""}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   flex: 4,
                              //   child: CustomQuantityWidget(
                              //     quantity:
                              //         "${CatalogueData.map[widget.product.productId] != null ? CatalogueData.map[widget.product.productId]![choiceState.variant!.variantId]!["quantity"] : 1}",
                              //     onRemovePressed: () {
                              //       if (CatalogueData.map[widget
                              //                   .product.productId]![
                              //               choiceState.variant!
                              //                   .variantId]!["quantity"] >
                              //           1) {
                              //         BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
                              //             pincode: userData.pinCode,
                              //             cartId: CatalogueData
                              //                     .map[widget.product.productId]![
                              //                 choiceState.variant!
                              //                     .variantId]!["cartId"],
                              //             quantity: (CatalogueData
                              //                         .map[widget.product.productId]![
                              //                     choiceState.variant!
                              //                         .variantId]!["quantity"] -
                              //                 1)));
                              //       }
                              //
                              //       if (CatalogueData.map[
                              //               widget.product
                              //                   .productId]![choiceState
                              //               .variant!
                              //               .variantId]!["quantity"] ==
                              //           1) {
                              //         BlocProvider.of<CartBloc>(context)
                              //             .add(CartDeleteEvent(
                              //                 choiceId: choiceState
                              //                     .variant!.variantId!,
                              //                 productId: widget
                              //                     .product.productId,
                              //                 cartId: CatalogueData.map[
                              //                             widget.product
                              //                                 .productId]![
                              //                         choiceState.variant!
                              //                             .variantId]![
                              //                     "cartId"]));
                              //       }
                              //     },
                              //     onAddPressed: () {
                              //       if (CatalogueData.map[
                              //               widget.product
                              //                   .productId]![choiceState
                              //               .variant!
                              //               .variantId]!["quantity"] >=
                              //           1) {
                              //         BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
                              //             pincode: userData.pinCode,
                              //             cartId: CatalogueData
                              //                     .map[widget.product.productId]![
                              //                 choiceState.variant!
                              //                     .variantId]!["cartId"],
                              //             quantity: (CatalogueData
                              //                         .map[widget.product.productId]![
                              //                     choiceState.variant!
                              //                         .variantId]!["quantity"] +
                              //                 1)));
                              //       }
                              //     },
                              //   ),
                              // ),
                            ],
                          ),
                        );
                        // _addedToCart
                        //   ? Container(
                        //       padding: const EdgeInsets.only(
                        //           left: AppConstants.defaultPadding / 2.2,
                        //           right: AppConstants.defaultPadding / 2.2,
                        //           bottom: AppConstants.defaultPadding / 2.2),
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Expanded(
                        //             flex: 3,
                        //             child: Padding(
                        //               padding: const EdgeInsets.symmetric(
                        //                   horizontal: 4.0),
                        //               child: Text(
                        //                 "₹ ${choiceState.variant?.price ?? ""}",
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .subtitle2!
                        //                     .copyWith(
                        //                         color: Theme.of(context)
                        //                             .colorScheme
                        //                             .primary),
                        //               ),
                        //             ),
                        //           ),
                        //           // Expanded(
                        //           //   flex: 4,
                        //           //   child: CustomQuantityWidget(
                        //           //     quantity:
                        //           //         "${CatalogueData.map[widget.product.productId] != null ? CatalogueData.map[widget.product.productId]![choiceState.variant!.variantId]!["quantity"] : 1}",
                        //           //     onRemovePressed: () {
                        //           //       if (CatalogueData.map[widget
                        //           //                   .product.productId]![
                        //           //               choiceState.variant!
                        //           //                   .variantId]!["quantity"] >
                        //           //           1) {
                        //           //         BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
                        //           //             pincode: userData.pinCode,
                        //           //             cartId: CatalogueData
                        //           //                     .map[widget.product.productId]![
                        //           //                 choiceState.variant!
                        //           //                     .variantId]!["cartId"],
                        //           //             quantity: (CatalogueData
                        //           //                         .map[widget.product.productId]![
                        //           //                     choiceState.variant!
                        //           //                         .variantId]!["quantity"] -
                        //           //                 1)));
                        //           //       }
                        //           //
                        //           //       if (CatalogueData.map[
                        //           //               widget.product
                        //           //                   .productId]![choiceState
                        //           //               .variant!
                        //           //               .variantId]!["quantity"] ==
                        //           //           1) {
                        //           //         BlocProvider.of<CartBloc>(context)
                        //           //             .add(CartDeleteEvent(
                        //           //                 choiceId: choiceState
                        //           //                     .variant!.variantId!,
                        //           //                 productId: widget
                        //           //                     .product.productId,
                        //           //                 cartId: CatalogueData.map[
                        //           //                             widget.product
                        //           //                                 .productId]![
                        //           //                         choiceState.variant!
                        //           //                             .variantId]![
                        //           //                     "cartId"]));
                        //           //       }
                        //           //     },
                        //           //     onAddPressed: () {
                        //           //       if (CatalogueData.map[
                        //           //               widget.product
                        //           //                   .productId]![choiceState
                        //           //               .variant!
                        //           //               .variantId]!["quantity"] >=
                        //           //           1) {
                        //           //         BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
                        //           //             pincode: userData.pinCode,
                        //           //             cartId: CatalogueData
                        //           //                     .map[widget.product.productId]![
                        //           //                 choiceState.variant!
                        //           //                     .variantId]!["cartId"],
                        //           //             quantity: (CatalogueData
                        //           //                         .map[widget.product.productId]![
                        //           //                     choiceState.variant!
                        //           //                         .variantId]!["quantity"] +
                        //           //                 1)));
                        //           //       }
                        //           //     },
                        //           //   ),
                        //           // ),
                        //         ],
                        //       ),
                        //     )
                        //   : Container(
                        //       padding: const EdgeInsets.only(
                        //           left: AppConstants.defaultPadding / 2.2,
                        //           right: AppConstants.defaultPadding / 2.2,
                        //           bottom: AppConstants.defaultPadding / 2.2),
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Expanded(
                        //             child: Padding(
                        //               padding: const EdgeInsets.symmetric(
                        //                   horizontal: 4.0),
                        //               child: Text(
                        //                 "₹ ${choiceState.variant?.price ?? ""}",
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .subtitle2!
                        //                     .copyWith(
                        //                         color: Theme.of(context)
                        //                             .colorScheme
                        //                             .primary),
                        //               ),
                        //             ),
                        //           ),
                        //           // Expanded(
                        //           //   child: AddToCartButton(
                        //           //     id: widget.product.productId,
                        //           //     onPressed: () {
                        //           //       BlocProvider.of<AddToCartBloc>(
                        //           //               context)
                        //           //           .add(AddToCartEvent(
                        //           //               pincode: userData.pinCode,
                        //           //               addToCartInput:
                        //           //                   AddToCartInput(
                        //           //                 choiceId: BlocProvider.of<
                        //           //                             VariantCubit>(
                        //           //                         choiceContext)
                        //           //                     .variant
                        //           //                     ?.variantId,
                        //           //                 deviceId: app.deviceId,
                        //           //                 productId: widget
                        //           //                     .product.productId,
                        //           //                 quantity: 1,
                        //           //               )));
                        //           //     },
                        //           //     width: cardWidth / 2,
                        //           //   ),
                        //           // ),
                        //         ],
                        //       ));
                      } else {
                        return Container();
                      }
                    })
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: BlocBuilder<CustomerWishlistBloc, CustomerWishlistState>(
                  builder: (context, state) {
                    if (state is CustomerWishlistMutationSuccessState) {
                      wishListFn(context);

                      // if (BlocProvider.of<CustomerWishlistBloc>(context)
                      //     .map
                      //     .containsKey(widget.product.productId)) {
                      //   Map<String, dynamic> map =
                      //       BlocProvider.of<CustomerWishlistBloc>(context)
                      //               .map[widget.product.productId] ??
                      //           {};
                      //   if (map.containsKey(
                      //       BlocProvider.of<VariantCubit>(context)
                      //           .variant
                      //           ?.variantId)) {
                      //     wishlistId = map[
                      //         BlocProvider.of<VariantCubit>(context)
                      //             .variant
                      //             ?.variantId];
                      //     isWishListed = true;
                      //   } else {
                      //     isWishListed = false;
                      //   }
                      // } else {
                      //   isWishListed = false;
                      // }

                      return _wishListWidget(context);
                    } else if (state is CustomerWishlistFailedState) {
                      wishListFn(context);
                      return _wishListWidget(context);
                    } else if (state is CustomerWishlistFetchSuccessState) {
                      // getWishList();
                      wishListFn(context);
                      return _wishListWidget(context);
                    } else if (state is CustomerWishlistLoadingState) {
                      wishListFn(context);
                      return _wishListWidget(context);
                      // return Container(
                      //   child: Center(
                      //     child: CircularProgressIndicator(),
                      //   ),
                      // );
                    } else {
                      wishListFn(context);
                      return _wishListWidget(context);
                    }
                  },
                ),
              )
            ],
          )),
    );
  }

  Container _wishListWidget(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onPrimary),
      child: isWishListed
          ? InkWell(
              onTap: () {
                BlocProvider.of<CustomerWishlistBloc>(context)
                    .add(CustomerWishListRemoveEvent(wishListId: wishlistId));
                getWishList();
              },
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ))
          : InkWell(
              // onTap: () => BlocProvider.of<CustomerWishlistBloc>(context).add(
              //     CustomerWishListAddEvent(
              //         wishListInput: WishListInput(
              //             pinCode: userData.pinCode,
              //             deviceId: app.deviceId,
              //             product: widget.product.productId,
              //             variant: BlocProvider.of<VariantCubit>(context)
              //                 .variant
              //                 ?.variantId))
              onTap: () {
                // print(BlocProvider.of<VariantCubit>(context)
                //     .variant
                //     ?.variantId);
                BlocProvider.of<CustomerWishlistBloc>(context).add(
                    CustomerWishListAddEvent(
                        wishListInput: WishListInput(
                            pinCode: userData.pinCode,
                            deviceId: app.deviceId,
                            product: widget.product.productId,
                            variant: BlocProvider.of<VariantCubit>(context)
                                .variant
                                ?.variantId),
                        lng: userData.lng,
                        lat: userData.lat));
                getWishList();
              },
              child: Icon(
                Icons.favorite_outline,
                color: Theme.of(context).colorScheme.primary,
              )),
    );
  }

  wishListFn(BuildContext context) {
    if (BlocProvider.of<CustomerWishlistBloc>(context)
        .map
        .containsKey(widget.product.productId)) {
      Map<String, String> data = BlocProvider.of<CustomerWishlistBloc>(context)
              .map[widget.product.productId!] ??
          {};
      if (data.containsKey(
          BlocProvider.of<VariantCubit>(context).variant?.variantId)) {
        wishlistId =
            data[BlocProvider.of<VariantCubit>(context).variant?.variantId];

        isWishListed = true;
      } else {
        isWishListed = false;
      }
    } else {
      isWishListed = false;
    }
  }
}
















// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shimmer/shimmer.dart';
//
// import '../../../base_module/domain/entity/app.dart';
// import '../../../base_module/domain/entity/color_scheme.dart';
// import '../../../base_module/domain/entity/translation.dart';
// import '../../../base_module/presentation/component/buttons/add_to_cart_button.dart';
// import '../../../base_module/presentation/component/padding/app_padding.dart';
// import '../../../base_module/presentation/core/values/app_assets.dart';
// import '../../../base_module/presentation/core/values/app_constants.dart';
// import '../../../cart_wishlist_module/data/entity/input_models/add_to_cart_input.dart';
// import '../../../cart_wishlist_module/data/entity/input_models/wish_list_input.dart';
// import '../../../cart_wishlist_module/presentation/feature/cart/blocs/add_to_cart_bloc/add_to_cart_bloc.dart';
// import '../../../cart_wishlist_module/presentation/feature/cart/blocs/add_to_cart_bloc/add_to_cart_event.dart';
// import '../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_bloc.dart';
// import '../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_event.dart';
// import '../../../cart_wishlist_module/presentation/feature/cart/blocs/variant_cubit/variant_cubit.dart';
// import '../../../cart_wishlist_module/presentation/feature/wishlist/blocs/customer_wishlist_bloc/customer_wishlist_bloc.dart';
// import '../../../user_module/domain/user_data.dart';
// import '../../domain/catalogue_data.dart';
// import '../../domain/models/product.dart';
// import '../../domain/models/variant.dart';
// import 'custom_quantity_widget.dart';
//
// class ProductCard extends StatefulWidget {
//   final Product product;
//   final Variant? wishlistVariant;
//   final bool isWishListed;
//   const ProductCard(
//       {Key? key,
//       required this.product,
//       this.isWishListed = false,
//       this.wishlistVariant})
//       : super(key: key);
//
//   @override
//   _ProductCardState createState() => _ProductCardState();
// }
//
// class _ProductCardState extends State<ProductCard> {
//   List<Variant>? _list;
//   double cardWidth = 185;
//   bool _addedToCart = false;
//   bool _isDiscountAvailable = false;
//   bool isWishListed = false;
//   Variant? firstVariant;
//   String? wishlistId;
//
//   getWishList(){
//
//     BlocProvider.of<CustomerWishlistBloc>(context)
//         .add(CustomerWishListFetchEvent(
//         reFetch: true,
//         lat: userData.lat,
//         lng:  userData.lng
//     ));
//   }
//   @override
//   void initState() {
//     List<Variant> list =
//         widget.wishlistVariant != null ? [widget.wishlistVariant!] : [];
//     _list = widget.product.variants ?? list;
//     firstVariant = _list!.isNotEmpty
//         ? _list?.firstWhere((element) => element.isDefault == true,
//             orElse: () => _list!.first)
//         : null;
//
//     // urlList =
//     //     "${widget.product.avatar.isNotEmpty ? widget.product.avatar[0] : ""}"
//     //         .split(",");
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<VariantCubit>(
//       create: (context) => VariantCubit()..setVariant(variant: firstVariant),
//       child: Card(
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(AppConstants.cornerRadius)),
//           child: Stack(
//             children: [
//               Container(
//                 width: cardWidth,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         width: double.infinity,
//                         child: widget.product.thumbnailImage != null
//                             ? Image.network(
//                                 AppConstants.filesUrl +
//                                     widget.product.thumbnailImage!,
//                                 fit: BoxFit.cover,
//
//                           errorBuilder: (_, object, stack) {
//                             return
//                               Image.asset(ThemeAssets.dummy_image_product,fit: BoxFit.cover,);
//                           },
//                           loadingBuilder:
//                               (context, child, loadingProgress) {
//                             if (loadingProgress == null) return child;
//
//                             return  Shimmer.fromColors(
//                               baseColor: Colors.grey.shade300,
//                               highlightColor: AppColorScheme.onPrimaryLight.withOpacity(0.6),
//                               period: Duration(seconds: 5),
//                               child: Container(
//                                 color: AppColorScheme.surfaceColorLight,
//
//                                 width: double.infinity,
//                               ),
//                             );
//                           },
//
//                               )
//                             : Image.asset(
//                           ThemeAssets.dummy_image_product,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     const AppPadding(
//                       dividedBy: 2,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: AppConstants.defaultPadding / 2.2),
//                       width: cardWidth * 0.8,
//                       child: Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Text(
//                           widget.product.nameEn ?? translation.of("n/a"),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline6!
//                               .copyWith(
//                                   color: Theme.of(context).primaryColor,
//                                   fontSize: 15),
//                         ),
//                       ),
//                     ),
//                     // const AppPadding(
//                     //   dividedBy: 4,
//                     // ),
//                     // _list!.isNotEmpty
//                     //     ? Container(
//                     //         padding: const EdgeInsets.symmetric(
//                     //             horizontal: AppConstants.defaultPadding / 2.2),
//                     //         child: Container(
//                     //           padding: const EdgeInsets.symmetric(
//                     //               horizontal:
//                     //                   AppConstants.defaultPadding / 2.2),
//                     //           height: 35,
//                     //           width: (cardWidth -
//                     //               (AppConstants.defaultPadding / 2.2)),
//                     //           decoration: BoxDecoration(
//                     //               color:
//                     //                   Theme.of(context).colorScheme.background,
//                     //               borderRadius: BorderRadius.circular(
//                     //                   AppConstants.cornerRadius * 0.6)),
//                     //           child: Center(
//                     //             child: Builder(
//                     //               builder: (context) {
//                     //                 if (_list!.isNotEmpty) {
//                     //                   return BlocBuilder<VariantCubit,
//                     //                       VariantState>(
//                     //                     builder:
//                     //                         (variantContext, variantState) {
//                     //                       if (variantState
//                     //                           is VariantLoadedState) {
//                     //                         return DropdownButton<Variant>(
//                     //                           onChanged: (Variant? val) {
//                     //                             BlocProvider.of<VariantCubit>(
//                     //                                     variantContext)
//                     //                                 .setVariant(variant: val);
//                     //                           },
//                     //                           isExpanded: true,
//                     //                           value: variantState.variant,
//                     //                           underline: Container(),
//                     //                           items: _list!
//                     //                               .map((e) => DropdownMenuItem<
//                     //                                       Variant>(
//                     //                                   key: PageStorageKey(
//                     //                                       "CHOICEDROPDOWNKEY"),
//                     //                                   value: e,
//                     //                                   child: Text(
//                     //                                     e.name ?? "",
//                     //                                     style: Theme.of(context)
//                     //                                         .textTheme
//                     //                                         .subtitle1!
//                     //                                         .copyWith(
//                     //                                             fontSize: 10),
//                     //                                   )))
//                     //                               .toList(),
//                     //                         );
//                     //                       } else {
//                     //                         return DropdownButton<Variant>(
//                     //                           onChanged: (Variant? val) {
//                     //                             BlocProvider.of<VariantCubit>(
//                     //                                     variantContext)
//                     //                                 .setVariant(variant: val);
//                     //                           },
//                     //                           isExpanded: true,
//                     //                           underline: Container(),
//                     //                           items: _list!
//                     //                               .map((e) => DropdownMenuItem<
//                     //                                       Variant>(
//                     //                                   key: PageStorageKey(
//                     //                                       "CHOICEDROPDOWNKEY"),
//                     //                                   value: e,
//                     //                                   child: Text(
//                     //                                     e.name ?? "",
//                     //                                     style: Theme.of(context)
//                     //                                         .textTheme
//                     //                                         .subtitle1!
//                     //                                         .copyWith(
//                     //                                             fontSize: 10),
//                     //                                   )))
//                     //                               .toList(),
//                     //                         );
//                     //                       }
//                     //                     },
//                     //                   );
//                     //                 } else {
//                     //                   return Container();
//                     //                 }
//                     //               },
//                     //             ),
//                     //           ),
//                     //         ),
//                     //       )
//                     //     : Container(),
//                     const AppPadding(
//                       dividedBy: 3,
//                     ),
//
//                     BlocBuilder<VariantCubit, VariantState>(
//                         builder: (choiceContext, choiceState) {
//                       if (choiceState is VariantLoadedState) {
//                         if (CatalogueData.map.containsKey(widget.product.productId)) {
//                           if (CatalogueData.map[widget.product.productId]!.containsKey(choiceState.variant!.variantId)) {
//                             _addedToCart = true;
//                           } else {
//                             _addedToCart = false;
//                           }
//                         };
//                         return  Container(
//                           padding: const EdgeInsets.only(
//                               left: AppConstants.defaultPadding / 2.2,
//                               right: AppConstants.defaultPadding / 2.2,
//                               bottom: AppConstants.defaultPadding / 2.2),
//                           child: Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 flex: 3,
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 4.0),
//                                   child: Text(
//                                     "₹ ${choiceState.variant?.price ?? ""}",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .subtitle2!
//                                         .copyWith(
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .primary),
//                                   ),
//                                 ),
//                               ),
//                               // Expanded(
//                               //   flex: 4,
//                               //   child: CustomQuantityWidget(
//                               //     quantity:
//                               //         "${CatalogueData.map[widget.product.productId] != null ? CatalogueData.map[widget.product.productId]![choiceState.variant!.variantId]!["quantity"] : 1}",
//                               //     onRemovePressed: () {
//                               //       if (CatalogueData.map[widget
//                               //                   .product.productId]![
//                               //               choiceState.variant!
//                               //                   .variantId]!["quantity"] >
//                               //           1) {
//                               //         BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
//                               //             pincode: userData.pinCode,
//                               //             cartId: CatalogueData
//                               //                     .map[widget.product.productId]![
//                               //                 choiceState.variant!
//                               //                     .variantId]!["cartId"],
//                               //             quantity: (CatalogueData
//                               //                         .map[widget.product.productId]![
//                               //                     choiceState.variant!
//                               //                         .variantId]!["quantity"] -
//                               //                 1)));
//                               //       }
//                               //
//                               //       if (CatalogueData.map[
//                               //               widget.product
//                               //                   .productId]![choiceState
//                               //               .variant!
//                               //               .variantId]!["quantity"] ==
//                               //           1) {
//                               //         BlocProvider.of<CartBloc>(context)
//                               //             .add(CartDeleteEvent(
//                               //                 choiceId: choiceState
//                               //                     .variant!.variantId!,
//                               //                 productId: widget
//                               //                     .product.productId,
//                               //                 cartId: CatalogueData.map[
//                               //                             widget.product
//                               //                                 .productId]![
//                               //                         choiceState.variant!
//                               //                             .variantId]![
//                               //                     "cartId"]));
//                               //       }
//                               //     },
//                               //     onAddPressed: () {
//                               //       if (CatalogueData.map[
//                               //               widget.product
//                               //                   .productId]![choiceState
//                               //               .variant!
//                               //               .variantId]!["quantity"] >=
//                               //           1) {
//                               //         BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
//                               //             pincode: userData.pinCode,
//                               //             cartId: CatalogueData
//                               //                     .map[widget.product.productId]![
//                               //                 choiceState.variant!
//                               //                     .variantId]!["cartId"],
//                               //             quantity: (CatalogueData
//                               //                         .map[widget.product.productId]![
//                               //                     choiceState.variant!
//                               //                         .variantId]!["quantity"] +
//                               //                 1)));
//                               //       }
//                               //     },
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         );
//                           // _addedToCart
//                           //   ? Container(
//                           //       padding: const EdgeInsets.only(
//                           //           left: AppConstants.defaultPadding / 2.2,
//                           //           right: AppConstants.defaultPadding / 2.2,
//                           //           bottom: AppConstants.defaultPadding / 2.2),
//                           //       child: Row(
//                           //         mainAxisAlignment:
//                           //             MainAxisAlignment.spaceBetween,
//                           //         children: [
//                           //           Expanded(
//                           //             flex: 3,
//                           //             child: Padding(
//                           //               padding: const EdgeInsets.symmetric(
//                           //                   horizontal: 4.0),
//                           //               child: Text(
//                           //                 "₹ ${choiceState.variant?.price ?? ""}",
//                           //                 style: Theme.of(context)
//                           //                     .textTheme
//                           //                     .subtitle2!
//                           //                     .copyWith(
//                           //                         color: Theme.of(context)
//                           //                             .colorScheme
//                           //                             .primary),
//                           //               ),
//                           //             ),
//                           //           ),
//                           //           // Expanded(
//                           //           //   flex: 4,
//                           //           //   child: CustomQuantityWidget(
//                           //           //     quantity:
//                           //           //         "${CatalogueData.map[widget.product.productId] != null ? CatalogueData.map[widget.product.productId]![choiceState.variant!.variantId]!["quantity"] : 1}",
//                           //           //     onRemovePressed: () {
//                           //           //       if (CatalogueData.map[widget
//                           //           //                   .product.productId]![
//                           //           //               choiceState.variant!
//                           //           //                   .variantId]!["quantity"] >
//                           //           //           1) {
//                           //           //         BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
//                           //           //             pincode: userData.pinCode,
//                           //           //             cartId: CatalogueData
//                           //           //                     .map[widget.product.productId]![
//                           //           //                 choiceState.variant!
//                           //           //                     .variantId]!["cartId"],
//                           //           //             quantity: (CatalogueData
//                           //           //                         .map[widget.product.productId]![
//                           //           //                     choiceState.variant!
//                           //           //                         .variantId]!["quantity"] -
//                           //           //                 1)));
//                           //           //       }
//                           //           //
//                           //           //       if (CatalogueData.map[
//                           //           //               widget.product
//                           //           //                   .productId]![choiceState
//                           //           //               .variant!
//                           //           //               .variantId]!["quantity"] ==
//                           //           //           1) {
//                           //           //         BlocProvider.of<CartBloc>(context)
//                           //           //             .add(CartDeleteEvent(
//                           //           //                 choiceId: choiceState
//                           //           //                     .variant!.variantId!,
//                           //           //                 productId: widget
//                           //           //                     .product.productId,
//                           //           //                 cartId: CatalogueData.map[
//                           //           //                             widget.product
//                           //           //                                 .productId]![
//                           //           //                         choiceState.variant!
//                           //           //                             .variantId]![
//                           //           //                     "cartId"]));
//                           //           //       }
//                           //           //     },
//                           //           //     onAddPressed: () {
//                           //           //       if (CatalogueData.map[
//                           //           //               widget.product
//                           //           //                   .productId]![choiceState
//                           //           //               .variant!
//                           //           //               .variantId]!["quantity"] >=
//                           //           //           1) {
//                           //           //         BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
//                           //           //             pincode: userData.pinCode,
//                           //           //             cartId: CatalogueData
//                           //           //                     .map[widget.product.productId]![
//                           //           //                 choiceState.variant!
//                           //           //                     .variantId]!["cartId"],
//                           //           //             quantity: (CatalogueData
//                           //           //                         .map[widget.product.productId]![
//                           //           //                     choiceState.variant!
//                           //           //                         .variantId]!["quantity"] +
//                           //           //                 1)));
//                           //           //       }
//                           //           //     },
//                           //           //   ),
//                           //           // ),
//                           //         ],
//                           //       ),
//                           //     )
//                           //   : Container(
//                           //       padding: const EdgeInsets.only(
//                           //           left: AppConstants.defaultPadding / 2.2,
//                           //           right: AppConstants.defaultPadding / 2.2,
//                           //           bottom: AppConstants.defaultPadding / 2.2),
//                           //       child: Row(
//                           //         mainAxisAlignment:
//                           //             MainAxisAlignment.spaceBetween,
//                           //         children: [
//                           //           Expanded(
//                           //             child: Padding(
//                           //               padding: const EdgeInsets.symmetric(
//                           //                   horizontal: 4.0),
//                           //               child: Text(
//                           //                 "₹ ${choiceState.variant?.price ?? ""}",
//                           //                 style: Theme.of(context)
//                           //                     .textTheme
//                           //                     .subtitle2!
//                           //                     .copyWith(
//                           //                         color: Theme.of(context)
//                           //                             .colorScheme
//                           //                             .primary),
//                           //               ),
//                           //             ),
//                           //           ),
//                           //           // Expanded(
//                           //           //   child: AddToCartButton(
//                           //           //     id: widget.product.productId,
//                           //           //     onPressed: () {
//                           //           //       BlocProvider.of<AddToCartBloc>(
//                           //           //               context)
//                           //           //           .add(AddToCartEvent(
//                           //           //               pincode: userData.pinCode,
//                           //           //               addToCartInput:
//                           //           //                   AddToCartInput(
//                           //           //                 choiceId: BlocProvider.of<
//                           //           //                             VariantCubit>(
//                           //           //                         choiceContext)
//                           //           //                     .variant
//                           //           //                     ?.variantId,
//                           //           //                 deviceId: app.deviceId,
//                           //           //                 productId: widget
//                           //           //                     .product.productId,
//                           //           //                 quantity: 1,
//                           //           //               )));
//                           //           //     },
//                           //           //     width: cardWidth / 2,
//                           //           //   ),
//                           //           // ),
//                           //         ],
//                           //       ));
//                       } else {
//                         return Container();
//                       }
//                     })
//                   ],
//                 ),
//               ),
//               Positioned(
//                 right: 10,
//                 top: 10,
//                 child: BlocBuilder<CustomerWishlistBloc, CustomerWishlistState>(
//                   builder: (context, state) {
//                     if (state is CustomerWishlistMutationSuccessState) {
//                       wishListFn(context);
//
//                       // if (BlocProvider.of<CustomerWishlistBloc>(context)
//                       //     .map
//                       //     .containsKey(widget.product.productId)) {
//                       //   Map<String, dynamic> map =
//                       //       BlocProvider.of<CustomerWishlistBloc>(context)
//                       //               .map[widget.product.productId] ??
//                       //           {};
//                       //   if (map.containsKey(
//                       //       BlocProvider.of<VariantCubit>(context)
//                       //           .variant
//                       //           ?.variantId)) {
//                       //     wishlistId = map[
//                       //         BlocProvider.of<VariantCubit>(context)
//                       //             .variant
//                       //             ?.variantId];
//                       //     isWishListed = true;
//                       //   } else {
//                       //     isWishListed = false;
//                       //   }
//                       // } else {
//                       //   isWishListed = false;
//                       // }
//
//                       return _wishListWidget(context);
//                     } else if (state is CustomerWishlistFailedState) {
//                       wishListFn(context);
//                       return _wishListWidget(context);
//                     } else if (state is CustomerWishlistFetchSuccessState) {
//                       // getWishList();
//                       wishListFn(context);
//                       return _wishListWidget(context);
//                     } else if (state is CustomerWishlistLoadingState) {
//                       wishListFn(context);
//                       return _wishListWidget(context);
//                       // return Container(
//                       //   child: Center(
//                       //     child: CircularProgressIndicator(),
//                       //   ),
//                       // );
//                     } else {
//                       wishListFn(context);
//                       return _wishListWidget(context);
//                     }
//                   },
//                 ),
//               )
//             ],
//           )),
//     );
//   }
//
//   Container _wishListWidget(BuildContext context) {
//     return Container(
//       width: 30,
//       height: 30,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Theme.of(context).colorScheme.onPrimary),
//       child: isWishListed
//           ? InkWell(
//               onTap: () => BlocProvider.of<CustomerWishlistBloc>(context)
//                   .add(CustomerWishListRemoveEvent(wishListId: wishlistId)),
//               child: Icon(
//                 Icons.favorite,
//                 color: Colors.red,
//               ))
//           : InkWell(
//               // onTap: () => BlocProvider.of<CustomerWishlistBloc>(context).add(
//               //     CustomerWishListAddEvent(
//               //         wishListInput: WishListInput(
//               //             pinCode: userData.pinCode,
//               //             deviceId: app.deviceId,
//               //             product: widget.product.productId,
//               //             variant: BlocProvider.of<VariantCubit>(context)
//               //                 .variant
//               //                 ?.variantId))
//         onTap: (){
//           // print(BlocProvider.of<VariantCubit>(context)
//           //     .variant
//           //     ?.variantId);
//         BlocProvider.of<CustomerWishlistBloc>(context).add(
//               CustomerWishListAddEvent(
//                   wishListInput: WishListInput(
//                       pinCode: userData.pinCode,
//                       deviceId: app.deviceId,
//                       product: widget.product.productId,
//                       variant: BlocProvider.of<VariantCubit>(context)
//                           .variant
//                           ?.variantId),
//               lng: userData.lng,lat: userData.lat
//               ));
//         },
//
//
//
//               child: Icon(
//                 Icons.favorite_outline,
//                 color: Theme.of(context).colorScheme.primary,
//               )),
//     );
//   }
//
//   wishListFn(BuildContext context) {
//     if (BlocProvider.of<CustomerWishlistBloc>(context)
//         .map
//         .containsKey(widget.product.productId)) {
//       Map<String, String> data = BlocProvider.of<CustomerWishlistBloc>(context)
//               .map[widget.product.productId!] ??
//           {};
//       if (data.containsKey(
//           BlocProvider.of<VariantCubit>(context).variant?.variantId)) {
//         wishlistId =
//             data[BlocProvider.of<VariantCubit>(context).variant?.variantId];
//
//
//         isWishListed = true;
//       } else {
//         isWishListed = false;
//       }
//     } else {
//       isWishListed = false;
//     }
//
//
//   }
// }
