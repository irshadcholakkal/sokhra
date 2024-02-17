import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base_module/domain/entity/app.dart';
import '../../../base_module/presentation/component/buttons/add_to_cart_button.dart';
import '../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../base_module/presentation/core/values/app_assets.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../../catalogue_module/domain/catalogue_data.dart';
import '../../../catalogue_module/presentation/components/custom_quantity_widget.dart';
import '../../../user_module/domain/user_data.dart';
import '../../data/entity/input_models/add_to_cart_input.dart';
import '../../data/entity/input_models/wish_list_input.dart';
import '../../domain/models/wish_list.dart';
import '../feature/cart/blocs/add_to_cart_bloc/add_to_cart_bloc.dart';
import '../feature/cart/blocs/add_to_cart_bloc/add_to_cart_event.dart';
import '../feature/cart/blocs/cart_bloc/cart_bloc.dart';
import '../feature/cart/blocs/cart_bloc/cart_event.dart';
import '../feature/wishlist/blocs/customer_wishlist_bloc/customer_wishlist_bloc.dart';

class WishlistCard extends StatefulWidget {
  WishlistCard({required this.wishListItem, Key? key}) : super(key: key);
  final WishList wishListItem;

  @override
  State<WishlistCard> createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  double _textBoxWidth = 180;
  WishList? wishList;
  bool _addedToCart = false;
  double cardWidth = 185;
  bool isWishListed = false;
  String? wishlistId;

  // var base64 = Base64Codec();
  // late List<String> urlList;

  @override
  void initState() {
    wishList = widget.wishListItem;
    super.initState();
  }

  getWishList(){

    BlocProvider.of<CustomerWishlistBloc>(context)
        .add(CustomerWishListFetchEvent(
        reFetch: true,
        lat: userData.lat,
        lng:  userData.lng
    ));
  }
  @override
  Widget build(BuildContext context) {
    // widget.cartItem.product.variant?.choices?.forEach((element) {
    //   if (element?.choiceId == widget.cartItem.choice) {
    //     _choice = element;
    //     // debugPrint("choice id set is ${_choice?.choiceId}");
    //   }
    // });
    return Stack(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.cornerRadius)),
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding * 0.8,
                vertical: AppConstants.defaultPadding * 0.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _productInfo(_textBoxWidth, context),
                Divider(
                  thickness: 1,
                ),
                _productRate(_textBoxWidth, context)
              ],
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: 5,
          child: BlocBuilder<CustomerWishlistBloc, CustomerWishlistState>(
            builder: (context, state) {
              if (state is CustomerWishlistMutationSuccessState) {

                getWishList();

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
    );
  }

  Row _productRate(double _textBoxWidth, BuildContext context) {
    double total = 0.0;
    if (wishList?.variant?.price != null) {
      double rate = (wishList!.variant!.price!);
      double reduction = (double.parse(wishList?.variant?.reductionPrice != null
          ? "${wishList!.variant!.reductionPrice!}"
          : "0.0"));
      total = ((rate - reduction) * (1));
    } else {
      total = 0.0;
    }
    ;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: _textBoxWidth * 0.5,
          child: Text(
            "₹ ${total * (CatalogueData.map[wishList?.product?.productId]?[wishList?.variant?.variantId]?["quantity"] != null ? CatalogueData.map[wishList?.product?.productId]![wishList?.variant!.variantId]!["quantity"] : 1)}",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     // DeleteButton(
        //     //   onPressed: () {},
        //     //   // id: "$id",
        //     // ),
        //     cartButton(context),
        //   ],
        // )
        // Expanded(child: SizedBox()),
        // Expanded(flex: 1, child: cartButton(context)),
      ],
    );
  }

  Widget cartButton(BuildContext context) {
    if (CatalogueData.map.containsKey(wishList?.product?.productId)) {
      if (CatalogueData.map[wishList!.product!.productId]!
          .containsKey(wishList!.variant?.variantId)) {
        _addedToCart = true;
      } else {
        _addedToCart = false;
      }
    }
    ;
    return _addedToCart
        ? Container(
            // padding: const EdgeInsets.only(
            //     left: AppConstants.defaultPadding / 2.2,
            //     right: AppConstants.defaultPadding / 2.2,
            //     bottom: AppConstants.defaultPadding / 2.2),
            child: CustomQuantityWidget(
            quantity:
                "${CatalogueData.map[wishList?.product?.productId] != null ? CatalogueData.map[wishList!.product!.productId]![wishList!.variant!.variantId]!["quantity"] : 1}",
            onRemovePressed: () {
              if (CatalogueData.map[wishList?.product?.productId]![
                      wishList?.variant!.variantId]!["quantity"] >
                  1) {
                BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
                    pincode: userData.pinCode,
                    cartId: CatalogueData.map[wishList?.product?.productId]![
                        wishList?.variant!.variantId]!["cartId"],
                    quantity: (CatalogueData.map[wishList?.product?.productId]![
                            wishList?.variant!.variantId]!["quantity"] -
                        1)));
              }

              if (CatalogueData.map[wishList?.product?.productId]![
                      wishList?.variant!.variantId]!["quantity"] ==
                  1) {
                BlocProvider.of<CartBloc>(context).add(CartDeleteEvent(
                    choiceId: wishList!.variant!.variantId!,
                    productId: wishList!.product?.productId,
                    cartId: CatalogueData.map[wishList!.product!.productId]![
                        wishList?.variant!.variantId]!["cartId"]));
              }
            },
            onAddPressed: () {
              if (CatalogueData.map[wishList?.product?.productId]![
                      wishList!.variant!.variantId]!["quantity"] >=
                  1) {
                BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
                    pincode: userData.pinCode,
                    cartId: CatalogueData.map[wishList?.product!.productId]![
                        wishList?.variant!.variantId]!["cartId"],
                    quantity: (CatalogueData.map[wishList?.product?.productId]![
                            wishList?.variant!.variantId]!["quantity"] +
                        1)));
              }
            },
          ))
        : Container(
            padding: const EdgeInsets.only(
                left: AppConstants.defaultPadding / 2.2,
                right: AppConstants.defaultPadding / 2.2,
                bottom: AppConstants.defaultPadding / 2.2),
            child: AddToCartButton(
              id: wishList?.product?.productId,
              onPressed: () {
                BlocProvider.of<AddToCartBloc>(context).add(AddToCartEvent(
                    pincode: userData.pinCode,
                    addToCartInput: AddToCartInput(
                      choiceId: wishList?.variant?.variantId,
                      deviceId: app.deviceId,
                      productId: wishList?.product?.productId,
                      quantity: 1,
                    )));
              },
              width: cardWidth / 2,
            ));
  }

  Row _productInfo(double _textBoxWidth, BuildContext context) {
    // debugPrint("productInfo choice is ${_choice.toString()}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70,
          child: wishList?.product?.thumbnailImage != null
              ? Image.network(
                  AppConstants.filesUrl + wishList!.product!.thumbnailImage!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, object, stackTrace) =>  Image.asset(ThemeAssets.dummy_image_product,fit: BoxFit.cover),
                )
              : Image.asset(ThemeAssets.dummy_image_product,fit: BoxFit.cover),
          // child: urlList.length == 2
          //     ? Image.memory(base64.decode("${urlList[1]}"))
          //     : Image.network(
          //         AppConstants.filesUrl + urlList[0],
          //         errorBuilder: (context, stackTrace, error) {
          //           return Image.network(
          //             AppConstants.dummyImage,
          //             fit: BoxFit.cover,
          //           );
          //         },
          //         fit: BoxFit.cover,
          //       ),
        ),
        const AppPadding(),
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: _textBoxWidth,
                  child: Text(
                    "${wishList?.product?.nameEn ?? ""}",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(),
                  ),
                ),
                const AppPadding(
                  dividedBy: 6,
                ),
                Container(
                  width: _textBoxWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        child: Text(wishList?.variant?.name ?? "",
                            style: Theme.of(context).textTheme.subtitle2!),
                      ),
                      const AppPadding(
                        dividedBy: 3,
                      ),
                      Container(
                        width: _textBoxWidth * 0.4,
                        child: Text(
                            "₹ ${wishList?.variant?.price == null ? "N/A" : (wishList!.variant!.price! - (double.tryParse(wishList?.variant?.reductionPrice != null ? "${wishList?.variant!.reductionPrice!}" : "0.0") ?? 0))}",
                            style: Theme.of(context).textTheme.bodyText2!),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // DeleteButton(
        //   id: "$id",
        // )
      ],
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
              onTap: () => BlocProvider.of<CustomerWishlistBloc>(context)
                  .add(CustomerWishListRemoveEvent(wishListId: wishlistId)),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ))
          : InkWell(
              onTap: () => BlocProvider.of<CustomerWishlistBloc>(context).add(
                  CustomerWishListAddEvent(
                      wishListInput: WishListInput(
                          pinCode: userData.pinCode,
                          deviceId: app.deviceId,
                          product: wishList?.product?.productId,
                          variant: wishList?.variant?.variantId),
                    lng: userData.lng,
                    lat: userData.lat
                  )),
              child: Icon(
                Icons.favorite_outline,
                color: Theme.of(context).colorScheme.primary,
              )),
    );
  }

  wishListFn(BuildContext context) {
    if (BlocProvider.of<CustomerWishlistBloc>(context)
        .map
        .containsKey(wishList?.product?.productId)) {
      Map<String, String> data = BlocProvider.of<CustomerWishlistBloc>(context)
              .map[wishList?.product?.productId!] ??
          {};
      if (data.containsKey(wishList?.variant?.variantId)) {
        wishlistId = data[wishList?.variant?.variantId];

        isWishListed = true;
      } else {
        isWishListed = false;
      }
    } else {
      isWishListed = false;
    }
  }
}
