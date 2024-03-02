import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../../base_module/presentation/component/appbar/custom_appbar.dart';
import '../../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../base_module/domain/entity/app.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/navbar/custom_nav_bar.dart';
import '../../../../../base_module/presentation/util/string_modifiers.dart';
import '../../../../../payment_module/presentation/feature/payment/blocs/payment_bloc/payment_bloc.dart';
import '../../../../../user_module/domain/entity/authentication.dart';
import '../../../../../user_module/domain/entity/models/role.dart';
import '../../../../../user_module/domain/user_data.dart';
import '../../../../domain/models/cart.dart';
import '../../../../domain/models/cart_list.dart';
import '../../../components/cart_card.dart';
import '../../../core/values/cart_router.dart';
import '../blocs/cart_bloc/cart_bloc.dart';
import '../blocs/cart_bloc/cart_event.dart';
import '../blocs/cart_bloc/cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String deviceId = app.deviceId!;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          return true;
        } else {
          return false;
          // ExitPopupHelper.showExitPopup(context);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: CustomAppbar(
          context: context,
          isHome: true,
          isTitleText: true,
          titleText: translation.of("cart.cart"),
        ),
        bottomNavigationBar: CustomNavBar(),
        body: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<CartBloc>(context).add(CartFetchEvent(
                deviceId: app.deviceId!,
                // pinCode: userData.pinCode,
                lat: userData.lat,
                lng: userData.lng));
          },
          child: ListView(
            children: [
              Container(
                child: BlocListener<PaymentBloc, PaymentState>(
                  listener: (context, state) {
                    if (state is InitiatePaymentSuccess ||
                        state is CreatePaymentSuccess ||
                        state is CreatePaymentFailed) {
                      // debugPrint(
                      //     "initiate payment from cart Screen ${state.response.toJson()}");
                      BlocProvider.of<CartBloc>(context).add(CartFetchEvent(
                          deviceId: app.deviceId!,
                          // pinCode: userData.pinCode,
                          lng: userData.lng,
                          lat: userData.lat));
                    }
                  },
                  child: BlocConsumer<CartBloc, CartState>(
                    listener: (context, state) {
                      bool isSuccess = false;
                      String? message;
                      if (state is DeleteCartSuccess) {
                        message = StringModifiers.capitalize(
                          translation.of("cart.from_cart"),
                        );
                        isSuccess = true;
                        BlocProvider.of<CartBloc>(context).add(
                          CartFetchEvent(
                              deviceId: deviceId,
                              lat: userData.lat,
                              lng: userData.lng),
                        );
                      } else if (state is DeleteCartFailed) {
                        message = state.message == 'SOME_ERROR'
                            ? translation.of("something_went_wrong")
                            : state.message;
                      }

                      if (state is UpdateCartSuccess) {
                        message = StringModifiers.capitalize(
                          translation.of("cart.quantity_updated"),
                        );
                        isSuccess = true;
                        //////// check latandlng
                        BlocProvider.of<CartBloc>(context).add(
                          CartFetchEvent(
                              deviceId: deviceId,
                              lng: userData.lng,
                              lat: userData.lat),
                        );
                      } else if (state is UpdateCartFailed) {
                        message = state.message == 'SOME_ERROR'
                            ? translation.of("something_went_wrong")
                            : state.message;
                      }

                      if (message != null) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(message),
                          backgroundColor: isSuccess
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.error,
                        ));
                      }
                    },
                    builder: (context, state) {
                      if (state is ListLoading) {
                        final cartList = state.previousCart;

                        double totalPrice =
                            cartList.cartList?.fold(0, (num? results, item) {
                                  double price = 0;
                                  item.product?.variants?.forEach((element) {
                                    if (element.variantId ==
                                        item.variant?.variantId) {
                                      price = (element.price != null
                                          ? ((element.price!) -
                                              (double.parse(
                                                  "${element.reductionPrice == null ? "0.0" : element.reductionPrice}")))
                                          : 0.0);
                                    }
                                  });
                                  return results! +
                                      ((item.quantity!) * (price));
                                }) ??
                                0;
                        return _CartListScrollView(
                            cartList: cartList,
                            totalPrice: totalPrice,
                            deliveryCharge: state.deliveryCharge ?? 0,
                            minimumPurchaseAmount:
                                state.minimumPurchaseAmount ?? 0);
                        // return Center(
                        //   child: CupertinoActivityIndicator(),
                        // );
                      } else if (state is ListLoaded) {
                        if (state.carts.cartList?.isNotEmpty == true) {
                          final cartList = state.carts;

                          double totalPrice =
                              cartList.cartList?.fold(0, (num? results, item) {
                                    double price = 0;
                                    item.product?.variants?.forEach((element) {
                                      if (element.variantId ==
                                          item.variant?.variantId) {
                                        price = (element.price != null
                                            ? ((element.price!) -
                                                (double.parse(
                                                    "${element.reductionPrice == null ? "0.0" : element.reductionPrice}")))
                                            : 0.0);
                                      }
                                    });
                                    return results! +
                                        ((item.quantity!) * (price));
                                  }) ??
                                  0;

                          return _CartListScrollView(
                            cartList: cartList,
                            totalPrice: totalPrice,
                            deliveryCharge: state.deliveryCharge ?? 0,
                            minimumPurchaseAmount:
                                state.minimumPurchaseAmount ?? 0,
                          );
                        } else {
                          return SizedBox(
                            height: 200,
                            child: Center(
                              child: Text(translation.of("cart.cart_is_empty")),
                            ),
                          );
                        }
                      } else {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Text(translation.of("cart.cart_is_empty")),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CartListScrollView extends StatelessWidget {
  const _CartListScrollView({
    Key? key,
    required this.cartList,
    required this.totalPrice,
    required this.minimumPurchaseAmount,
    required this.deliveryCharge,
  }) : super(key: key);
  final CartList cartList;
  final double totalPrice, minimumPurchaseAmount, deliveryCharge;

  @override
  Widget build(BuildContext context) {
    final carts = cartList.cartList ?? [];

    return Container(
      width: double.infinity,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 420),
          child: Column(
            children: [
              AnimationLimiter(
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: carts.length,
                      itemBuilder: (context, index) {
                        Cart cartItem = carts[index];

                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            // horizontalOffset: 20.0,
                            verticalOffset: 50.00,
                            child: FadeInAnimation(
                              child: CartCard(
                                cartItem: cartItem,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              const AppPadding(),
              Card(
                child: Container(
                  padding: EdgeInsets.all(AppConstants.defaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(translation.of("cart.total"),
                              style: Theme.of(context).textTheme.headline6),
                          Text("₹ " + totalPrice.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.headline6),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
              const AppPadding(
                dividedBy: 2.5,
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultPadding),
                  child: ElevatedButton(
                      onPressed: () {
                        if (authentication.role == Role.CUSTOMER) {
                          Navigator.of(context)
                              .pushNamed(CartRouter.shippingDetailsScreen);
                          // pushNewScreenWithRouteSettings(context,
                          //     settings: RouteSettings(
                          //       name: CartRouter.shippingDetailsScreen,
                          //     ),
                          //     screen: ShippingDetailsScreen());
                        } else {
                          // Navigator.of(context)
                          //     .pushNamed(UserRouter.signInScreen);
                          // pushNewScreenWithRouteSettings(context,
                          //     settings: RouteSettings(
                          //       name: UserRouter.signInScreen,
                          //     ),
                          //     withNavBar: false,
                          //     screen: SignInScreen());
                        }
                      },
                      child: Text(
                        translation.of("cart.checkout").toUpperCase(),
                        style: Theme.of(context).textTheme.button!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ))),
              const AppPadding(
                dividedBy: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
