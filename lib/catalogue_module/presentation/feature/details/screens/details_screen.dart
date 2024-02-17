import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../base_module/domain/entity/app.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/appbar/custom_appbar.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/component/pincode/pincode.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../cart_wishlist_module/data/entity/input_models/add_to_cart_input.dart';
import '../../../../../cart_wishlist_module/data/entity/input_models/wish_list_input.dart';
import '../../../../../cart_wishlist_module/domain/models/cart.dart';
import '../../../../../cart_wishlist_module/presentation/core/values/cart_router.dart';
import '../../../../../cart_wishlist_module/presentation/core/values/string_modifiers.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/add_to_cart_bloc/add_to_cart_bloc.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/add_to_cart_bloc/add_to_cart_event.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/add_to_cart_bloc/add_to_cart_state.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_bloc.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_event.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_state.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/variant_cubit/variant_cubit.dart';
import '../../../../../cart_wishlist_module/presentation/feature/wishlist/blocs/customer_wishlist_bloc/customer_wishlist_bloc.dart';
import '../../../../../user_module/domain/entity/authentication.dart';
import '../../../../../user_module/domain/user_data.dart';
import '../../../../domain/catalogue_data.dart';
import '../../../../domain/models/delivery_check_response.dart';
import '../../../../domain/models/product.dart';
import '../../../../domain/models/sub_choices.dart';
import '../../../../domain/models/variant.dart';
import '../../../components/custom_quantity_widget.dart';
import '../blocs/delivery_check_cubit/delivery_check_cubit.dart';
import '../blocs/product_count_cubit/product_count_cubit.dart';
import '../widgets/details_image_carousal.dart';

class DetailsScreen extends StatefulWidget {
  final Product? product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool checkPressed = false;
  double _dividerThickness = 1;
  Variant? index;
  bool _isDiscountAvailable = false;
  bool isWishListed = false;
  final _pinCodeKey = GlobalKey<FormBuilderState>();
  Radius _radius = Radius.circular(AppConstants.cornerRadius * 2);
  Product? product;
  String? wishlistId;
  int selectedIndex = 0;
  int selectedTypeIndex = 0;
  int selectedChoiceIndex = 0;
  SubChoice? _subChoices;

  List<SubChoice>? _subChoicesList = [];

  bool? productIsAlreadyInCart = false;

  String? subChoiceId = "";

  String? getVariantId = "";

  List<Variant> _variants = [];

  @override
  void initState() {
    getCart();
    getWishList();
    _variants = widget.product?.variants ?? [];
    if (_variants.isNotEmpty) {
      _variants.forEach((element) {
        if (element.isDefault == true) {
          index = element;
          _subChoices =
              (index?.subChoices?.isNotEmpty ?? index?.subChoices != [])
                  ? index?.subChoices?.first
                  : null;
          BlocProvider.of<VariantCubit>(context)
              .setVariant(variant: index, subChoice: _subChoices);
          if (index?.subChoices?.isNotEmpty ??
              index?.subChoices?.isNotEmpty != []) {
            _subChoices =
                (index?.subChoices?.isNotEmpty ?? index?.subChoices != [])
                    ? index?.subChoices?.first
                    : null;
          }
        } else {
          index = _variants[0];
          _subChoices =
              (index?.subChoices?.isNotEmpty ?? index?.subChoices != [])
                  ? index?.subChoices?.first
                  : null;
          BlocProvider.of<VariantCubit>(context)
              .setVariant(variant: index, subChoice: _subChoices);
        }
      });
    }
    if (_variants[0].subChoices?.isNotEmpty ?? _variants[0].subChoices != []) {
      setState(() {
        _subChoicesList?.clear();
        _subChoicesList?.addAll(_variants[0].subChoices ?? []);
      });
    }
    BlocProvider.of<VariantCubit>(context)
        .setVariant(variant: index, subChoice: _subChoices);
    product = widget.product;
    super.initState();
  }

  getWishList() {
    BlocProvider.of<CustomerWishlistBloc>(context).add(
        CustomerWishListFetchEvent(
            reFetch: true, lat: userData.lat, lng: userData.lng));
  }

  getCart() {
    BlocProvider.of<CartBloc>(context).add(
      CartFetchEvent(
          deviceId: app.deviceId!, lng: userData.lng, lat: userData.lat),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider<VariantCubit>(
          create: (context) => VariantCubit(),
        ),
        BlocProvider<ProductCountCubit>(
          create: (context) => ProductCountCubit(),
        )
      ],
      child: Builder(builder: (context) {
        wishListFn(context);

        return Material(
          child: WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: Scaffold(
              appBar: CustomAppbar(
                isHome: false,
                context: context,
              ),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              body:
                  // Material(
                  //   child:
                  BlocListener<CustomerWishlistBloc, CustomerWishlistState>(
                listener: (context, state) {
                  if (state is CustomerWishlistFailedState) {
                    if (authentication.isAuthenticated == false) {
                      showFlash(
                        context: context,
                        duration: const Duration(seconds: 2),
                        builder: (_, controller) {
                          return FlashAlert(
                              flashController: controller,
                              color: Colors.red,
                              iconData: Icons.error,
                              message: "Please Login");
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("something went wrong"),
                      ));
                    }
                  }
                },
                child: Hero(
                    tag: widget.product?.productId.toString() ?? '',
                    child: widget.product != null
                        ? _productNotNull(context)
                        : productNull(context)),
              ),
              // )
            ),
          ),
        );
      }),
    );
  }

  Center productNull(BuildContext context) {
    return Center(
      child: Text(
        translation.of("unexpected_error_occurred"),
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  BlocListener<AddToCartBloc, AddToCartState> _productNotNull(
      BuildContext context) {
    return BlocListener<AddToCartBloc, AddToCartState>(
      listener: (context, addToCartState) {
        bool isSuccess = false;
        String? message;
        if (addToCartState is AddToCartSuccess) {
          isSuccess = true;

          message = StringModifiers.capitalize(
            translation.of("cart.added_to_cart"),
          );

          BlocProvider.of<CartBloc>(context).add(
            CartFetchEvent(
                deviceId: app.deviceId!, lng: userData.lng, lat: userData.lat),
          );
        }

        if (message != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            backgroundColor: isSuccess
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.error,
          ));
        }
      },
      child: Container(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Material(
                          child:
                              DetailsImageCarousal(imageList: product?.avatar),
                        ),
                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: wishlistWidget(context))
                      ],
                    ),
                    Container(
                      constraints: BoxConstraints(
                          minHeight:
                              MediaQuery.of(context).size.longestSide * 0.7),
                      padding: EdgeInsets.only(
                          left: AppConstants.defaultPadding,
                          top: AppConstants.defaultPadding,
                          right: AppConstants.defaultPadding),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.only(
                              topLeft: _radius, topRight: _radius)),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  product?.nameEn ?? translation.of("n/a"),
                                  key: UniqueKey(), //name
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: BlocBuilder<VariantCubit, VariantState>(
                                  builder: (choiceContext, choiceState) {
                                    if (choiceState is VariantLoadedState) {
                                      if (choiceState.variant!.reductionPrice !=
                                              null ||
                                          choiceState.variant?.reductionPrice !=
                                              0.toDouble()) {
                                        _isDiscountAvailable = true;
                                      }
                                      return Column(
                                        // crossAxisAlignment:
                                        // CrossAxisAlignment.end,
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            _subChoices != null
                                                ? "₹ ${choiceState.variant!.price! + _subChoices!.choicePrice!.toDouble() - choiceState.variant!.reductionPrice!.toDouble()}"
                                                : "₹ ${choiceState.variant!.price! - choiceState.variant!.reductionPrice!.toDouble()}",
                                            //price
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 14,
                                                ),
                                          ),
                                          Text(
                                            _subChoices != null
                                                ? "₹ ${choiceState.variant!.price! + _subChoices!.choicePrice!.toDouble()}"
                                                : "₹ ${choiceState.variant!.price}",
                                            //price
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
                                                    color: AppColorScheme
                                                        .primaryColorLight,
                                                    fontSize: 12,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                          ),
                                        ],
                                      );
                                      //   Row(
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.end,
                                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      //   children: [
                                      //     Text(
                                      //       _subChoices != null ?
                                      //       "₹ ${choiceState.variant!.price! + _subChoices!.choicePrice!.toDouble() - choiceState.variant!.reductionPrice!.toDouble()}":
                                      //
                                      //       "₹ ${choiceState.variant!.price! - choiceState.variant!.reductionPrice!.toDouble()}",
                                      //       //price
                                      //       style: Theme.of(context)
                                      //           .textTheme
                                      //           .headline6!
                                      //           .copyWith(
                                      //             color: Theme.of(context)
                                      //                 .primaryColor,
                                      //             fontSize: 14,
                                      //           ),
                                      //     ),
                                      //     // Text(
                                      //     //   _subChoices != null ?
                                      //     //   "₹ ${choiceState.variant!.price! + _subChoices!.choicePrice!.toDouble()}":
                                      //     //
                                      //     //   "₹ ${choiceState.variant!.price}",
                                      //     //   //price
                                      //     //   style: Theme.of(context)
                                      //     //       .textTheme
                                      //     //       .headline6!
                                      //     //       .copyWith(
                                      //     //     color: AppColorScheme.primaryColorLight,
                                      //     //     fontSize: 12,
                                      //     //     decoration: TextDecoration.lineThrough
                                      //     //   ),
                                      //     // ),
                                      //   ],
                                      // );
                                    } else {
                                      return Text(translation.of("n/a"), //price
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const AppPadding(
                            dividedBy: 6,
                          ),
                          product?.nameEn != null
                              ? const AppPadding(
                                  dividedBy: 6,
                                )
                              : Container(),
                          product?.brand?.name != null
                              ? Container(
                                  width: double.infinity,
                                  child: Text(
                                    "${product?.brand?.name!}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                )
                              : Container(),
                          const AppPadding(
                            dividedBy: 2,
                          ),
                          AppPadding(
                            dividedBy: 4,
                          ),

                          // _choiceChip(context),

                          _chipWidgets(variants: _variants, context: context),
                          AppPadding(
                            dividedBy: 3.5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _quantityWidget(context),
                              ],
                            ),
                          ),

                          const AppPadding(
                            dividedBy: 4,
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Divider(
                              thickness: _dividerThickness,
                            ),
                          ),

                          const AppPadding(
                            dividedBy: 4.5,
                          ),

                          // _pinCodeDeliveryCheck(
                          //     productId: product?.productId ?? ""),
                          // const AppPadding(
                          //   dividedBy: 4.5,
                          // ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 3),
                          //   child: Divider(
                          //     thickness: _dividerThickness,
                          //   ),
                          // ),
                          const AppPadding(),
                          Container(
                            width: double.infinity,
                            child: Text(
                              translation.of("catalogue.description"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          ),
                          const AppPadding(
                            dividedBy: 4,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              product?.descriptionEn ?? translation.of("n/a"),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(0.5)),
                            ),
                          ),

                          const AppPadding(),

                          Container(
                              width: double.infinity,
                              child: _addToCartButton(
                                  context: context,
                                  productId: product?.productId)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  wishlistWidget(BuildContext context) {
    return BlocBuilder<CustomerWishlistBloc, CustomerWishlistState>(
      builder: (context, state) {
        if (state is CustomerWishlistMutationSuccessState) {
          wishListFn(context);
          return Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onPrimary),
            child: isWishListed
                ? Material(
                    child: InkWell(
                        onTap: () async {
                          BlocProvider.of<CustomerWishlistBloc>(context).add(
                              CustomerWishListRemoveEvent(
                                  wishListId: wishlistId));
                          await getWishList();
                        },
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )))
                : Material(
                    child: InkWell(
                        onTap: () {
                          BlocProvider.of<CustomerWishlistBloc>(context).add(
                              CustomerWishListAddEvent(
                                  wishListInput: WishListInput(
                                      pinCode: userData.pinCode,
                                      variant:
                                          BlocProvider.of<VariantCubit>(context)
                                              .variant
                                              ?.variantId,
                                      product: product?.productId,
                                      deviceId: app.deviceId),
                                  lat: userData.lat,
                                  lng: userData.lng));
                          getWishList();
                        },
                        child: Icon(
                          Icons.favorite_outline,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  ),
          );
        } else if (state is CustomerWishlistFailedState) {
          return Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onPrimary),
            child: isWishListed
                ? InkWell(
                    onTap: () {
                      BlocProvider.of<CustomerWishlistBloc>(context).add(
                          CustomerWishListRemoveEvent(wishListId: wishlistId));
                      getWishList();
                    },
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ))
                : Material(
                    child: InkWell(
                        onTap: () {
                          BlocProvider.of<CustomerWishlistBloc>(context).add(
                              CustomerWishListAddEvent(
                                  wishListInput: WishListInput(
                                      pinCode: userData.pinCode,
                                      variant:
                                          BlocProvider.of<VariantCubit>(context)
                                              .variant
                                              ?.variantId,
                                      product: product?.productId,
                                      deviceId: app.deviceId),
                                  lng: userData.lng,
                                  lat: userData.lat));
                          getWishList();
                        },
                        child: Icon(
                          Icons.favorite_outline,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  ),
          );
        } else if (state is CustomerWishlistLoadingState) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CustomerWishlistFetchSuccessState) {
          wishListFn(context);
          return Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onPrimary),
            child: isWishListed
                ? Material(
                    child: InkWell(
                        onTap: () {
                          BlocProvider.of<CustomerWishlistBloc>(context).add(
                              CustomerWishListRemoveEvent(
                                  wishListId: wishlistId));
                          getWishList();
                        },
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )),
                  )
                : Material(
                    child: InkWell(
                        onTap: () {
                          BlocProvider.of<CustomerWishlistBloc>(context).add(
                              CustomerWishListAddEvent(
                                  wishListInput: WishListInput(
                                      pinCode: userData.pinCode,
                                      variant:
                                          BlocProvider.of<VariantCubit>(context)
                                              .variant
                                              ?.variantId,
                                      product: product?.productId,
                                      deviceId: app.deviceId),
                                  lat: userData.lat,
                                  lng: userData.lng));
                          getWishList();
                        },
                        child: Icon(
                          Icons.favorite_outline,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  ),
          );
        } else {
          return
              // Container(
              //   width: 30,
              //   height: 30,
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: Theme.of(context).colorScheme.onPrimary),
              //   child: isWishListed
              //       ? InkWell(
              //       onTap: () => BlocProvider.of<CustomerWishlistBloc>(context)
              //           .add(CustomerWishListRemoveEvent(
              //           wishListId: wishlistId)),
              //       child: Icon(
              //         Icons.favorite,
              //         color: Colors.red,
              //       ))
              //       : Material(
              //     child: InkWell(
              //         onTap: () => BlocProvider.of<CustomerWishlistBloc>(
              //             context)
              //             .add(CustomerWishListAddEvent(
              //             wishListInput: WishListInput(
              //                 pinCode: userData.pinCode,
              //                 variant:
              //                 BlocProvider.of<VariantCubit>(context)
              //                     .variant
              //                     ?.variantId,
              //                 product: product?.productId,
              //                 deviceId: app.deviceId),
              //             lng: userData.lng,
              //             lat: userData.lat
              //         )),
              //         child: Icon(
              //           Icons.favorite_outline,
              //           color: Theme.of(context).colorScheme.primary,
              //         )),
              //   ),
              // );
              Container(
            child: Center(
              child: Text("error"),
            ),
          );
        }
      },
    );
  }

  wishListFn(BuildContext context) {
    if (BlocProvider.of<CustomerWishlistBloc>(context)
        .map
        .containsKey(widget.product?.productId)) {
      Map<String, String> data = BlocProvider.of<CustomerWishlistBloc>(context)
              .map[widget.product!.productId!] ??
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

  _pinCodeDeliveryCheck({required String productId}) {
    return BlocListener<DeliveryCheckCubit, DeliveryCheckState>(
      listener: (context, state) {
        if (state is DeliveryCheckSuccess) {
          showSuccessFlash(
              context: context,
              message: "Delivery  by ${state.data.deliveryDate}");
        }
      },
      child: BlocBuilder<DeliveryCheckCubit, DeliveryCheckState>(
          builder: (context, state) {
        if (state is DeliveryCheckLoading) {
          return PinCode(
              initialValue:
                  BlocProvider.of<DeliveryCheckCubit>(context).pinCode,
              formKey: _pinCodeKey,
              onPressed: () {
                bool? status =
                    _pinCodeKey.currentState?.fields['pincode']?.isValid;
                String? value =
                    _pinCodeKey.currentState?.fields['pincode']?.value;
                // debugPrint("pincode check pressed");
                // debugPrint("value:${value}");

                if (status != true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(translation.of("pincode_failed")),
                  ));
                } else {
                  BlocProvider.of<DeliveryCheckCubit>(context).checkPinCode(
                      pincode: value ?? "",
                      lng: userData.lng,
                      lat: userData.lat,
                      place: userData.place);
                }
              },
              location: null,
              message: null);
        } else if (state is DeliveryCheckFailed) {
          return PinCode(
              initialValue:
                  BlocProvider.of<DeliveryCheckCubit>(context).pinCode,
              formKey: _pinCodeKey,
              onPressed: () {
                bool? status =
                    _pinCodeKey.currentState?.fields['pincode']?.isValid;
                String? value =
                    _pinCodeKey.currentState?.fields['pincode']?.value;
                // debugPrint("pincode check pressed");
                // debugPrint("value:${value}");

                if (status != true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(translation.of("pincode_failed")),
                  ));
                } else {
                  BlocProvider.of<DeliveryCheckCubit>(context).checkPinCode(
                      pincode: value ?? "",
                      lat: userData.lat,
                      lng: userData.lng,
                      place: userData.place);
                }
              },
              location: null,
              message: state.message);
        } else if (state is DeliveryCheckSuccess) {
          final DeliveryCheckResponse data = state.data;
          return PinCode(
              initialValue:
                  BlocProvider.of<DeliveryCheckCubit>(context).pinCode,
              formKey: _pinCodeKey,
              onPressed: () {
                bool? status =
                    _pinCodeKey.currentState?.fields['pincode']?.isValid;
                String? value =
                    _pinCodeKey.currentState?.fields['pincode']?.value;
                // debugPrint("pincode check pressed");
                // debugPrint("value:${value}");

                if (status != true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(translation.of("pincode_failed")),
                  ));
                } else {
                  BlocProvider.of<DeliveryCheckCubit>(context).checkPinCode(
                      pincode: value ?? "",
                      lng: userData.lng,
                      lat: userData.lat,
                      place: userData.place);
                }
              },
              location: data.zoneName,
              message:
                  "Delivery by ${data.deliveryDay?.isNotEmpty == true ? data.deliveryDay ?? "not provided" : "not provided"}");
        } else {
          return PinCode(
              initialValue:
                  BlocProvider.of<DeliveryCheckCubit>(context).pinCode,
              formKey: _pinCodeKey,
              onPressed: () {
                bool? status =
                    _pinCodeKey.currentState?.fields['pincode']?.isValid;
                String? value =
                    _pinCodeKey.currentState?.fields['pincode']?.value;
                debugPrint("pincode check pressed");
                debugPrint("value:${value}");

                if (status != true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(translation.of("pincode_failed")),
                  ));
                } else {
                  BlocProvider.of<DeliveryCheckCubit>(context).checkPinCode(
                      pincode: value ?? "",
                      lat: userData.lat,
                      lng: userData.lng,
                      place: userData.place);
                }
              },
              location: null,
              message: "an error occurred");
        }
      }),
    );
  }

  /////// og size chip Start

  //
  //
  // Container _sizeChips(
  //     {required List<Variant> variants, required BuildContext parentContext}) {
  //   if (variants.isNotEmpty) {
  //     variants.forEach((element) {
  //       if (element.isDefault == true) {
  //         index = element;
  //         BlocProvider.of<VariantCubit>(parentContext)
  //             .setVariant(variant: index);
  //       } else {
  //         index = variants[0];
  //         BlocProvider.of<VariantCubit>(parentContext)
  //             .setVariant(variant: index);
  //       }
  //     });
  //   }
  //   return Container(
  //       width: double.infinity,
  //       child: BlocBuilder<VariantCubit, VariantState>(
  //           builder: (choiceContext, choiceState) {
  //             if (choiceState is VariantLoadedState) {
  //               return Wrap(children: [
  //                 ...variants.map((e) {
  //                   return Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 3),
  //                       child: ChoiceChip(
  //                         onSelected: (bool onChecked) {
  //                           onChecked
  //                               ? BlocProvider.of<VariantCubit>(choiceContext)
  //                               .setVariant(variant: e)
  //                               : BlocProvider.of<VariantCubit>(choiceContext)
  //                               .setVariant(variant: index);
  //                         },
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(
  //                               AppConstants.cornerRadius * 0.6),
  //                           side: BorderSide(
  //                               width: 1.5,
  //                               color: choiceState.variant != e
  //                                   ? Theme.of(context)
  //                                   .colorScheme
  //                                   .primary
  //                                   .withOpacity(0.3)
  //                                   : Theme.of(context).colorScheme.primary),
  //                         ),
  //                         disabledColor: Theme.of(context)
  //                             .colorScheme
  //                             .primary
  //                             .withOpacity(0.5),
  //                         selectedColor: Theme.of(context).colorScheme.onPrimary,
  //                         labelPadding: EdgeInsets.symmetric(horizontal: 2),
  //                         labelStyle: choiceState.variant != e
  //                             ? Theme.of(context).textTheme.button!.copyWith(
  //                             color: Theme.of(context)
  //                                 .colorScheme
  //                                 .primary
  //                                 .withOpacity(0.5))
  //                             : Theme.of(context).textTheme.button,
  //                         label: Text("${e.name}"),
  //                         selected: choiceState == e,
  //                       ));
  //                 }).toList(),
  //
  //
  //
  //
  //               ]);
  //             } else {
  //               return Container();
  //             }
  //           }));
  // }

  ///////// og size chip end

  Container _sizeChips(
      {required List<Variant> variants, required BuildContext parentContext}) {
    if (variants.isNotEmpty) {
      variants.forEach((element) {
        if (element.isDefault == true) {
          index = element;
          BlocProvider.of<VariantCubit>(parentContext)
              .setVariant(variant: index, subChoice: _subChoices);
          if (index?.subChoices?.isNotEmpty ??
              index?.subChoices?.isNotEmpty != []) {
            _subChoices = index?.subChoices?[0];
          }
        } else {
          index = variants[0];
          _subChoices = index?.subChoices?[0];
          BlocProvider.of<VariantCubit>(parentContext)
              .setVariant(variant: index, subChoice: _subChoices);
        }
      });
    }
    return Container(
        width: double.infinity,
        child: BlocBuilder<VariantCubit, VariantState>(
            builder: (choiceContext, choiceState) {
          if (choiceState is VariantLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(children: [
                  ...variants.map((e) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Material(
                          child: ChoiceChip(
                            onSelected: (bool onChecked) {
                              onChecked
                                  ? BlocProvider.of<VariantCubit>(choiceContext)
                                      .setVariant(variant: e)
                                  : BlocProvider.of<VariantCubit>(choiceContext)
                                      .setVariant(variant: index);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  AppConstants.cornerRadius * 0.6),
                              side: BorderSide(
                                  width: 1.5,
                                  color: choiceState.variant != e
                                      ? Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.3)
                                      : Theme.of(context).colorScheme.primary),
                            ),
                            disabledColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5),
                            selectedColor:
                                Theme.of(context).colorScheme.onPrimary,
                            labelPadding: EdgeInsets.symmetric(horizontal: 2),
                            labelStyle: choiceState.variant != e
                                ? Theme.of(context).textTheme.button!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.5))
                                : Theme.of(context).textTheme.button,
                            label: Text("${e.name}"),
                            selected: choiceState == e,
                          ),
                        ));
                  }).toList(),
                ]),
              ],
            );
          } else {
            return Container();
          }
        }));
  }

  Container _chipWidgets(
      {required List<Variant> variants, required BuildContext context}) {
    BlocProvider.of<VariantCubit>(context)
        .setVariant(variant: index, subChoice: _subChoices);
    // if (variants.isNotEmpty) {
    //   variants.forEach((element) {
    //     if (element.isDefault == true) {
    //       index = element;
    //       BlocProvider.of<VariantCubit>(context)
    //           .setVariant(variant: index,
    //           subChoice: _subChoices
    //       );
    //       if(index?.subChoices?.isNotEmpty ??index?.subChoices?.isNotEmpty !=[]){
    //         _subChoices = index?.subChoices?[0];
    //       }
    //     } else {
    //       index = variants[0];
    //       _subChoices = index?.subChoices?[0];
    //       BlocProvider.of<VariantCubit>(context)
    //           .setVariant(variant: index,
    //           subChoice: _subChoices
    //       );
    //     }
    //   });
    // }
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              // color: Colors.yellow,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: variants.length,
                  itemBuilder: (context, variantIndex) {
                    return Material(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: ChoiceChip(
                                onSelected: (bool onChecked) {
                                  setState(() {
                                    _subChoicesList?.clear();
                                    _subChoicesList?.addAll(
                                        variants[variantIndex].subChoices ??
                                            []);
                                    selectedTypeIndex = variantIndex;
                                    index = variants[variantIndex];
                                    // _subChoices =_subChoicesList?[0];
                                    _subChoices = _subChoicesList?.isNotEmpty ??
                                            _subChoicesList != []
                                        ? _subChoicesList?.first
                                        : null;
                                    selectedChoiceIndex = 0;
                                  });

                                  onChecked
                                      ? BlocProvider.of<VariantCubit>(context)
                                          .setVariant(
                                              variant: variants[variantIndex])
                                      : BlocProvider.of<VariantCubit>(context)
                                          .setVariant(variant: index);
                                  getCart();
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.cornerRadius * 0.6),
                                  side: BorderSide(
                                      width: 1.5,
                                      color: selectedTypeIndex != variantIndex
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.3)
                                          : Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                                disabledColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.5),
                                selectedColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                labelPadding:
                                    EdgeInsets.symmetric(horizontal: 2),
                                labelStyle: selectedTypeIndex != variantIndex
                                    ? Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.5))
                                    : Theme.of(context).textTheme.button,
                                label: Text("${variants[variantIndex].name}"),
                                selected: selectedTypeIndex == variantIndex,
                              )),
                        ],
                      ),
                    );
                  }),
            ),
            (_subChoicesList?.length != 0 ||
                    (_subChoicesList?.isNotEmpty ?? _subChoicesList != []))
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _subChoicesList?.length,
                        itemBuilder: (ctx, choiceIndex) {
                          return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Material(
                                color: Colors.transparent,
                                child: ChoiceChip(
                                  onSelected: (bool onChecked) {
                                    setState(() {
                                      selectedChoiceIndex = choiceIndex;
                                      _subChoices =
                                          _subChoicesList?[choiceIndex];
                                    });

                                    // onChecked
                                    //     ? BlocProvider.of<VariantCubit>(context)
                                    //     .setVariant(variant: variants[index])
                                    //     : BlocProvider.of<VariantCubit>(context)
                                    //     .setVariant(variant: variants[index]);
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppConstants.cornerRadius * 0.6),
                                    side: BorderSide(
                                        width: 1.5,
                                        color:
                                            selectedChoiceIndex != choiceIndex
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                    .withOpacity(0.3)
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                  ),
                                  disabledColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.5),
                                  selectedColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  labelPadding:
                                      EdgeInsets.symmetric(horizontal: 2),
                                  labelStyle: selectedChoiceIndex != choiceIndex
                                      ? Theme.of(context)
                                          .textTheme
                                          .button!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.5))
                                      : Theme.of(context).textTheme.button,
                                  label: Text(
                                      "${_subChoicesList?[choiceIndex].name}"),
                                  selected: selectedChoiceIndex == choiceIndex,
                                ),
                              ));
                        }),
                  )
                : SizedBox()
          ],
        ));
  }

  Container _quantityWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: BlocBuilder<ProductCountCubit, ProductCountState>(
        builder: (context, state) {
          if (state is ProductCountLoaded) {
            return CustomQuantityWidget(
              quantity: state.quantity.toString(),
              onRemovePressed: () {
                if (state.quantity > 1) {
                  BlocProvider.of<ProductCountCubit>(context).decrement();
                }
              },
              onAddPressed: () {
                BlocProvider.of<ProductCountCubit>(context).increment();
              },
            );
          } else {
            return CustomQuantityWidget(
              quantity: 1.toString(),
              onRemovePressed: () {
                BlocProvider.of<ProductCountCubit>(context).decrement();
              },
              onAddPressed: () {
                BlocProvider.of<ProductCountCubit>(context).increment();
              },
            );
          }
        },
      ),
    );
  }

////// add to cart og start
//   _addToCartButton(
//       {required BuildContext context, required String? productId}) {
//
//     return BlocListener<CartBloc, CartState>(
//   listener: (context, state) {
//     if(state is ListLoaded){
//       if(state.carts.cartList.isNotEmpty){
//         final subChoiceData = state.carts.cartList.firstWhere(
//               (element) => element.variant?.variantId == index?.variantId,
//           orElse: () => Cart(),
//         );
//         if(subChoiceData != null){
//           setState((){
//             productIsAlreadyInCart = true;
//           });
//         }
//       }
//     }
//     },
//   child: BlocBuilder<VariantCubit, VariantState>(
//       builder: (context, state) {
//         if (state is VariantLoadedState) {
//           if (CatalogueData.map[widget.product?.productId]
//                   ?[state.variant?.variantId] !=
//               null) {
//             return ElevatedButton(
//               style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
//                   backgroundColor: MaterialStateProperty.all(
//                       Theme.of(context).colorScheme.primary.withOpacity(0.4))),
//               onPressed: () {},
//               child: Text(
//                 "Item added to cart".toUpperCase(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .button!
//                     .copyWith(color: Theme.of(context).colorScheme.onPrimary),
//               ),
//             );
//           }
//
//
//           else {
//             return ElevatedButton(
//               onPressed: () {
//                 // if(state.variant?.subChoices?.length !=0||(state.variant?.subChoices?.isNotEmpty ?? state.variant?.subChoices !=[])){
//                 if(_subChoicesList?.length !=0||(_subChoicesList?.isNotEmpty ?? _subChoicesList!=[])){
//
//
//                   BlocProvider.of<AddToCartBloc>(context).add(AddToCartEvent(
//                       pincode: userData.pinCode,
//                       addToCartInput: AddToCartInput(
//                           choiceId: index?.variantId,
//                           deviceId: app.deviceId,
//                           productId: productId,
//                           quantity: BlocProvider
//                               .of<ProductCountCubit>(context)
//                               .count,
//                         variantChoice: _subChoices?.id
//                       )),
//                   // BlocProvider.of<AddToCartBloc>(context).add(AddToCartEvent(
//                   //     pincode: userData.pinCode,
//                   //     addToCartInput: AddToCartInput(
//                   //         choiceId: state.variant?.variantId,
//                   //         deviceId: app.deviceId,
//                   //         productId: productId,
//                   //         quantity: BlocProvider
//                   //             .of<ProductCountCubit>(context)
//                   //             .count,
//                   //       variantChoice: _subChoices?.id
//                   //     )),
//
//                   );
//
//
//                 }else {
//
//                   BlocProvider.of<AddToCartBloc>(context).add(AddToCartEvent(
//                       pincode: userData.pinCode,
//                       addToCartInput: AddToCartInput(
//                           choiceId: state.variant?.variantId,
//                           deviceId: app.deviceId,
//                           productId: productId,
//                           quantity: BlocProvider
//                               .of<ProductCountCubit>(context)
//                               .count)));
//                 }
//                 },
//               child: Text(
//                 translation.of("cart.add_to_cart").toUpperCase(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .button!
//                     .copyWith(color: Theme.of(context).colorScheme.onPrimary),
//               ),
//             );
//           }
//         }
//
//
//
//         else {
//           return ElevatedButton(
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text(translation.of("something_went_wrong"))));
//             },
//             child: Text(
//               translation.of("cart.add_to_cart").toUpperCase(),
//               style: Theme.of(context)
//                   .textTheme
//                   .button!
//                   .copyWith(color: Theme.of(context).colorScheme.onPrimary),
//             ),
//           );
//         }
//       },
//     ),
// );
//   }
////////// add to cart end

  _addToCartButton({
    required BuildContext context,
    required String? productId,
  }) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is ListLoaded) {
          if (state.carts.cartList?.isNotEmpty == true) {
            final cartData = state.carts.cartList?.firstWhere(
              (element) => element.variant?.variantId == index?.variantId,
              orElse: () => Cart(),
            );

            if (cartData != null) {
              setState(() {
                productIsAlreadyInCart = true;
                subChoiceId = cartData.variantChoice;
                getVariantId = cartData.variant?.variantId;
              });
            }
          }
        }
      },
      child: BlocBuilder<VariantCubit, VariantState>(
        builder: (context, state) {
          if (state is VariantLoadedState) {
            if (CatalogueData.map[widget.product?.productId]
                    ?[state.variant?.variantId] !=
                null) {
              final subChoiceDataFromVariant =
                  state.variant?.subChoices?.firstWhere(
                (element) => element.id == subChoiceId,
                orElse: () => SubChoice(),
              );

              return subChoiceDataFromVariant != null
                  ? (subChoiceDataFromVariant.id == _subChoices?.id)
                      ? ElevatedButton(
                          // style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                          //     backgroundColor: MaterialStateProperty.all(
                          //         Theme.of(context).colorScheme.primary.withOpacity(0.4))),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              CartRouter.cartScreen,
                            );
                          },
                          child: Text(
                            "Go to Cart".toUpperCase(),
                            style: Theme.of(context).textTheme.button!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            // if(state.variant?.subChoices?.length !=0||(state.variant?.subChoices?.isNotEmpty ?? state.variant?.subChoices !=[])){
                            if (_subChoicesList?.length != 0 ||
                                (_subChoicesList?.isNotEmpty ??
                                    _subChoicesList != [])) {
                              BlocProvider.of<AddToCartBloc>(context).add(
                                AddToCartEvent(
                                    pincode: userData.pinCode,
                                    addToCartInput: AddToCartInput(
                                        choiceId: index?.variantId,
                                        deviceId: app.deviceId,
                                        productId: productId,
                                        quantity:
                                            BlocProvider.of<ProductCountCubit>(
                                                    context)
                                                .count,
                                        variantChoice: _subChoices?.id)),
                                // BlocProvider.of<AddToCartBloc>(context).add(AddToCartEvent(
                                //     pincode: userData.pinCode,
                                //     addToCartInput: AddToCartInput(
                                //         choiceId: state.variant?.variantId,
                                //         deviceId: app.deviceId,
                                //         productId: productId,
                                //         quantity: BlocProvider
                                //             .of<ProductCountCubit>(context)
                                //             .count,
                                //       variantChoice: _subChoices?.id
                                //     )),
                              );
                            } else {
                              BlocProvider.of<AddToCartBloc>(context).add(
                                  AddToCartEvent(
                                      pincode: userData.pinCode,
                                      addToCartInput: AddToCartInput(
                                          choiceId: state.variant?.variantId,
                                          deviceId: app.deviceId,
                                          productId: productId,
                                          quantity: BlocProvider.of<
                                                  ProductCountCubit>(context)
                                              .count)));
                            }
                          },
                          child: Text(
                            translation.of("cart.add_to_cart").toUpperCase(),
                            style: Theme.of(context).textTheme.button!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        )
                  : (getVariantId == index?.variantId)
                      ? ElevatedButton(
                          // style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                          //     backgroundColor: MaterialStateProperty.all(
                          //         Theme.of(context).colorScheme.primary.withOpacity(0.4))),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              CartRouter.cartScreen,
                            );
                          },
                          child: Text(
                            "Go to Cart".toUpperCase(),
                            style: Theme.of(context).textTheme.button!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            // if(state.variant?.subChoices?.length !=0||(state.variant?.subChoices?.isNotEmpty ?? state.variant?.subChoices !=[])){
                            if (_subChoicesList?.length != 0 ||
                                (_subChoicesList?.isNotEmpty ??
                                    _subChoicesList != [])) {
                              BlocProvider.of<AddToCartBloc>(context).add(
                                AddToCartEvent(
                                    pincode: userData.pinCode,
                                    addToCartInput: AddToCartInput(
                                        choiceId: index?.variantId,
                                        deviceId: app.deviceId,
                                        productId: productId,
                                        quantity:
                                            BlocProvider.of<ProductCountCubit>(
                                                    context)
                                                .count,
                                        variantChoice: _subChoices?.id)),
                              );
                            } else {
                              BlocProvider.of<AddToCartBloc>(context).add(
                                  AddToCartEvent(
                                      pincode: userData.pinCode,
                                      addToCartInput: AddToCartInput(
                                          choiceId: state.variant?.variantId,
                                          deviceId: app.deviceId,
                                          productId: productId,
                                          quantity: BlocProvider.of<
                                                  ProductCountCubit>(context)
                                              .count)));
                            }
                          },
                          child: Text(
                            translation.of("cart.add_to_cart").toUpperCase(),
                            style: Theme.of(context).textTheme.button!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        );
            } else {
              return ElevatedButton(
                onPressed: () {
                  // if(state.variant?.subChoices?.length !=0||(state.variant?.subChoices?.isNotEmpty ?? state.variant?.subChoices !=[])){
                  if (_subChoicesList?.length != 0 ||
                      (_subChoicesList?.isNotEmpty ?? _subChoicesList != [])) {
                    BlocProvider.of<AddToCartBloc>(context).add(
                      AddToCartEvent(
                          pincode: userData.pinCode,
                          addToCartInput: AddToCartInput(
                              choiceId: index?.variantId,
                              deviceId: app.deviceId,
                              productId: productId,
                              quantity:
                                  BlocProvider.of<ProductCountCubit>(context)
                                      .count,
                              variantChoice: _subChoices?.id)),
                      // BlocProvider.of<AddToCartBloc>(context).add(AddToCartEvent(
                      //     pincode: userData.pinCode,
                      //     addToCartInput: AddToCartInput(
                      //         choiceId: state.variant?.variantId,
                      //         deviceId: app.deviceId,
                      //         productId: productId,
                      //         quantity: BlocProvider
                      //             .of<ProductCountCubit>(context)
                      //             .count,
                      //       variantChoice: _subChoices?.id
                      //     )),
                    );
                  } else {
                    BlocProvider.of<AddToCartBloc>(context).add(AddToCartEvent(
                        pincode: userData.pinCode,
                        addToCartInput: AddToCartInput(
                            choiceId: state.variant?.variantId,
                            deviceId: app.deviceId,
                            productId: productId,
                            quantity:
                                BlocProvider.of<ProductCountCubit>(context)
                                    .count)));
                  }
                },
                child: Text(
                  translation.of("cart.add_to_cart").toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              );
            }
          } else {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(translation.of("something_went_wrong"))));
              },
              child: Text(
                translation.of("cart.add_to_cart").toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            );
          }
        },
      ),
    );
  }

// SizedBox _choiceChip(BuildContext parentContext){
//  return SizedBox(
//     width: MediaQuery.of(context).size.width,
//     child: BlocBuilder<VariantCubit, VariantState>(
//         builder: (choiceContext, choiceState) {
//           if (choiceState is VariantLoadedState) {
//             return ((choiceState.variant?.subChoices !=
//                 0) ||
//                 (choiceState.variant?.subChoices
//                     ?.isNotEmpty ??
//                     choiceState.variant?.subChoices !=
//                         []))
//                 ? Column(
//               crossAxisAlignment:
//               CrossAxisAlignment.start,
//               mainAxisAlignment:
//               MainAxisAlignment.start,
//               children: [
//                 Text("Type",
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyText2!
//                         .copyWith(
//                         fontWeight:
//                         FontWeight.w600)),
//                 SizedBox(
//                   height: 60,
//                   width: MediaQuery.of(context)
//                       .size
//                       .width,
//                   child: ListView.builder(
//                       padding: EdgeInsets.zero,
//                       shrinkWrap: true,
//                       scrollDirection:
//                       Axis.horizontal,
//                       itemCount: choiceState.variant
//                           ?.subChoices?.length ??
//                           0,
//                       itemBuilder:
//                           (choiceContext, i) {
//                         return InkWell(
//                           onTap: (){
//                             setState((){
//                               _subChoices = choiceState.variant
//                                   ?.subChoices?[i];
//                               selectedIndex = i;
//
//                             });
//                           },
//                           child: Padding(
//                             padding:
//                             EdgeInsets.symmetric(
//                                 horizontal: 3),
//                             child:
//                             ChoiceChip(
//                               onSelected:
//                                   (bool onChecked) {
//                                 setState((){
//                                   _subChoices = choiceState.variant
//                                       ?.subChoices?[i];
//                                   selectedIndex = i;
//
//                                 });
//                                 },
//                               shape:
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius
//                                     .circular(AppConstants
//                                     .cornerRadius *
//                                     0.6),
//                                 side: BorderSide(
//                                     width: 1.5,
//                                     color:
//                                     // choiceState.variant != e
//                                     selectedIndex != i
//                                         ? Theme.of(
//                                         context)
//                                         .colorScheme
//                                         .primary
//                                         .withOpacity(
//                                         0.3)
//                                         : Theme.of(
//                                         context)
//                                         .colorScheme
//                                         .primary),
//                               ),
//                               disabledColor:
//                               Theme.of(context)
//                                   .colorScheme
//                                   .primary
//                                   .withOpacity(0.5),
//                               selectedColor:
//                               Theme.of(context)
//                                   .colorScheme
//                                   .onPrimary,
//                               labelPadding:
//                               EdgeInsets.symmetric(
//                                   horizontal: 2),
//                               labelStyle:
//                               // choiceState.variant != e
//                               //     ?
//                               selectedIndex !=
//                                   i
//                                   ? Theme.of(
//                                   context)
//                                   .textTheme
//                                   .button!
//                                   .copyWith(
//                                   color: Theme.of(
//                                       context)
//                                       .colorScheme
//                                       .primary
//                                       .withOpacity(
//                                       0.5))
//                                   : Theme.of(
//                                   context)
//                                   .textTheme
//                                   .button,
//                               label: Text(
//                                   "${choiceState.variant?.subChoices?[i].name}"),
//                               selected: choiceState == choiceState.variant,
//                             ),
//                           ),
//                         );
//                       }),
//                 ),
//               ],
//             )
//                 : SizedBox();
//           }
//
//           else {
//             return Container(
//               // width: 50,
//               // height: 50,
//               // color: Colors.blue,
//             );
//           }
//         }),
//   );
// }

// Container _quantityWidget(BuildContext context) {
//   return Container(
//     padding: const EdgeInsets.all(0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 4.0),
//           child: Text(
//             translation.of("catalogue.quantity"),
//             style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                 color:
//                     Theme.of(context).colorScheme.primary.withOpacity(0.5)),
//           ),
//         ),
//         const AppPadding(
//           dividedBy: 4,
//         ),
//         BlocBuilder<ProductCountCubit, ProductCountState>(
//           builder: (context, state) {
//             if (state is ProductCountLoaded) {
//               return CustomQuantityWidget(
//                 quantity: state.quantity.toString(),
//                 onRemovePressed: () {
//                   BlocProvider.of<ProductCountCubit>(context).decrement();
//                 },
//                 onAddPressed: () {
//                   BlocProvider.of<ProductCountCubit>(context).increment();
//                 },
//               );
//             } else {
//               return CustomQuantityWidget(
//                 quantity: 1.toString(),
//                 onRemovePressed: () {
//                   BlocProvider.of<ProductCountCubit>(context).decrement();
//                 },
//                 onAddPressed: () {
//                   BlocProvider.of<ProductCountCubit>(context).increment();
//                 },
//               );
//             }
//           },
//         ),
//       ],
//     ),
//   );
// }
}
