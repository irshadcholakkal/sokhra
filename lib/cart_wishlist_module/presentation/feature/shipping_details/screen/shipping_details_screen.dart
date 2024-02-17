import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base_module/presentation/component/appbar/custom_appbar.dart';
import '../../../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../../payment_module/presentation/core/values/payments_router.dart';
import '../../../../../app_settings_module/domain/entity/models/shipping_address.dart';
import '../../../../../app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import '../../../../../base_module/domain/entity/app.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/promocode/promocode.dart';
import '../../../../../base_module/presentation/util/string_modifiers.dart';
import '../../../../../catalogue_module/presentation/feature/details/blocs/delivery_check_cubit/delivery_check_cubit.dart';
import '../../../../../payment_module/data/entity/models/initiate_payment_input.dart';
import '../../../../../payment_module/data/entity/models/payment_type.dart';
import '../../../../../payment_module/domain/entity/models/initiate_payment_response.dart';
import '../../../../../payment_module/domain/entity/payment_screen_args.dart';
import '../../../../../payment_module/domain/entity/payment_status_screen_args.dart';
import '../../../../../payment_module/presentation/feature/payment/blocs/payment_bloc/payment_bloc.dart';
import '../../../../../payment_module/presentation/feature/promocode/blocs/promo_code_bloc/promo_code_bloc.dart';
import '../../../../../payment_module/presentation/feature/wallet/blocs/wallet_balance_bloc/wallet_balance_bloc.dart';
import '../../../../../user_module/domain/user_data.dart';
import '../../../core/values/cart_router.dart';
import '../../cart/blocs/cart_bloc/cart_bloc.dart';
import '../../cart/blocs/cart_bloc/cart_event.dart';
import '../../cart/blocs/cart_bloc/cart_state.dart';
import '../blocs/address_selection_bloc/address_selection_bloc.dart';

class ShippingDetailsScreen extends StatefulWidget {
  const ShippingDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ShippingDetailsScreenState createState() => _ShippingDetailsScreenState();
}

class _ShippingDetailsScreenState extends State<ShippingDetailsScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _promoKey = GlobalKey<FormBuilderState>();
  bool promoApplied = false;
  bool _loading = false;
  num? _deliveryCharge;
  num? _walletBalance;
  String? _promoCode;
  num _cartPrice = 0;
  String? _addressId;
  num? _promoCodeDiscount;
  num? _gst;
  bool _useWallet = false;

  // List<String> paymentType = ["PAYMENT_GATEWAY", "COD"];
  num _effBalance = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WalletBalanceBloc>(context)
        .add(WalletBalanceFetchEvent(reFetch: true));
    if (userData.defaultAddressMap != "") {
      BlocProvider.of<AddressSelectionBloc>(context).add(
          AddressSelectionSetEvent(
              address: ShippingAddress.fromJson(
                  jsonDecode(userData.defaultAddressMap)),
              addressText: userData.defaultAddress));
    } else {
      BlocProvider.of<AddressSelectionBloc>(context)
          .add(AddressSelectionSetEvent(address: null, addressText: null));
    }
    _gst = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context: context,
        isHome: false,
        isTitleText: true,
        titleText: translation.of("cart.shipping_details"),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 0), () {
            if (userData.defaultAddressMap != "") {
              BlocProvider.of<AddressSelectionBloc>(context).add(
                  AddressSelectionSetEvent(
                      address: ShippingAddress.fromJson(
                          jsonDecode(userData.defaultAddressMap)),
                      addressText: userData.defaultAddress));
            } else {
              BlocProvider.of<AddressSelectionBloc>(context).add(
                  AddressSelectionSetEvent(address: null, addressText: null));
            }
            return true;
          });
        },
        child: BlocListener<CartBloc, CartState>(
          listener: (context, state) {
            if (state is ListLoaded) {
              final carts = state.carts.cartList ?? [];

              if (carts.isNotEmpty) {
                final cartList = state.carts;
                double totalPrice = carts.fold(0, (results, item) {
                      double price = 0;

                      item.product?.variants?.forEach((element) {
                        if (element.variantId == item.variant?.variantId) {
                          price = (element.price != null
                              ? ((element.price!) -
                                  (double.parse(
                                      "${element.reductionPrice == null ? "0.0" : element.reductionPrice}")))
                              : 0.0);
                        }
                      });
                      return results! + ((item.quantity)! * (price));
                    }) ??
                    0;
                _cartPrice = totalPrice;
                setState(() {});
              } else {
                _cartPrice = 0;
              }
            }
          },
          child: BlocListener<AddressSelectionBloc, AddressSelectionState>(
            listener: (context, state) {
              if (state is AddressSelectionSuccess) {
                BlocProvider.of<DeliveryCheckCubit>(context).checkPinCode(
                    pincode: state.address?.pincode ?? "",
                    lat: userData.lat,
                    lng: userData.lng,
                    place: userData.place);
                BlocProvider.of<CartBloc>(context).add(CartFetchEvent(
                    deviceId: app.deviceId!,
                    // pinCode: state.address?.pincode ?? "",
                    lat: userData.lat,
                    lng: userData.lng));
              }
            },
            child: BlocListener<PaymentBloc, PaymentState>(
              listener: (context, paymentState) {
                if (paymentState is InitiatePaymentSuccess) {
                  InitiatePaymentResponse response = paymentState.response;
                  debugPrint("initiate paymentResponse is${response.toJson()}");
                  // if (response.pendingOrderId == null ||
                  //     response.gatewayReceipt == null ||
                  //     response.gatewayId == null ||
                  //     response.amount == null) {
                  //   showErrorFlash(
                  //       context: context,
                  //       message:
                  //           translation.of("invalid_response_from_server"));
                  // } else {
                  if ((paymentState.response.status?.toUpperCase() ==
                          "SUCCESS") &&
                      (_useWallet)) {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(
                        PaymentsRouter.paymentStatusScreen,
                        arguments: PaymentStatusScreenArgs());
                    // pushNewScreenWithRouteSettings(context,
                    //     settings: RouteSettings(
                    //         name: PaymentsRouter.paymentStatusScreen,
                    //         arguments: PaymentStatusScreenArgs()),
                    //     screen: PaymentStatusScreen());
                  } else {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(
                        PaymentsRouter.paymentScreen,
                        arguments:
                            PaymentScreenArgs(response: paymentState.response));
                    // pushNewScreenWithRouteSettings(context,
                    //     settings: RouteSettings(
                    //         name: PaymentsRouter.paymentScreen,
                    //         arguments: PaymentScreenArgs(
                    //             response: paymentState.response)),
                    //     screen: PaymentScreen());
                  }
                  // }
                }
              },
              child: BlocListener<AppDataBloc, AppDataState>(
                listener: (context, state) {
                  if (state is FetchAppDataSuccess) {
                    List<ShippingAddress?> addressList =
                        state.appData.addressDetails!;
                    if (addressList.isNotEmpty) {
                      addressList.forEach((element) {
                        String? type =
                            StringModifiers.enumToString(element?.type)
                                ?.replaceAll("_", " ");
                        debugPrint("type is $type");
                        if (element?.isDefault == true) {
                          String defaultAddress = ("House/Flat :" +
                              (element?.house ?? "") +
                              "\n" +
                              "Street :" +
                              (element?.street ?? "n/a") +
                              "\n" +
                              "Post :" +
                              (element?.post ?? "n/a") +
                              "\n" +
                              "District :" +
                              (element?.district ?? "n/a") +
                              "\n" +
                              "State :" +
                              (element?.state ?? "n/a") +
                              "\n" +
                              ("Pincode :" +
                                  (element?.pincode ?? translation.of("n/a"))) +
                              "\n" +
                              ("Landmark :" +
                                  (element?.landmark ??
                                      translation.of("n/a"))) +
                              "\n" +
                              "Type :" +
                              "${element?.type == null ? translation.of("n/a") : StringModifiers.enumToString(element?.type)?.replaceAll("_", " ")}" +
                              "\n"
                                  "Phone :" +
                              ((element?.phone ?? translation.of("n/a"))));
                          BlocProvider.of<AddressSelectionBloc>(context).add(
                              AddressSelectionSetEvent(
                                  address: element,
                                  addressText: defaultAddress));
                        }
                      });
                    }
                  } else {
                    BlocProvider.of<AddressSelectionBloc>(context).add(
                        AddressSelectionSetEvent(
                            address: null, addressText: null));
                  }
                },
                child: Container(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      child: Center(
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 420),
                          padding:
                              const EdgeInsets.all(AppConstants.defaultPadding),
                          child: FormBuilder(
                            key: _formKey,
                            enabled: !_loading,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const AppPadding(),
                                _addressCard(),
                                const AppPadding(),
                                _delivery(),
                                const AppPadding(),
                                _notesTextField(),
                                const AppPadding(),
                                // _paymentMethod(),
                                const AppPadding(),
                                _promoCodeField(),
                                const AppPadding(),
                                _priceWidget(context),
                                const AppPadding(),
                                _payNowButton(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _delivery() {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Container(
        width: double.infinity,
        child: BlocBuilder<DeliveryCheckCubit, DeliveryCheckState>(
          builder: (context, state) {
            if (state is DeliveryCheckSuccess) {
              String day = state.data.deliveryDay ?? "";
              int deliveryDate =
                  int.tryParse(state.data.deliveryDate ?? "") ?? 0;

              debugPrint("$deliveryDate");
              if (day == "") {
                return Text(
                  "Delivery is available",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.green),
                );
              } else {
                return Text(
                  deliveryDate != 0
                      ? "Delivery is available by ${DateFormat("MMM dd ").format(DateTime.fromMillisecondsSinceEpoch(deliveryDate, isUtc: true).toLocal())}"
                      : "Delivery is available by ${day}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.green),
                ); //FIXME check day
              }
            } else if (state is DeliveryCheckFailed) {
              return Text(
                "${state.message}",
                textAlign: TextAlign.center,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  // FormBuilderRadioGroup<PaymentType> _paymentMethod() {
  //   return FormBuilderRadioGroup<PaymentType>(
  //       name: "paymenttype",
  //       initialValue: PaymentType.values[0],
  //       options: PaymentType.values
  //           .map((e) => FormBuilderFieldOption<PaymentType>(
  //                 value: e,
  //                 child: Text(
  //                     StringModifiers.enumToString(e)?.replaceAll("_", " ") ??
  //                         ""),
  //               ))
  //           .toList());
  // }

  Widget _priceWidget(BuildContext context) {
    return StatefulBuilder(builder: (context, refreshState) {
      return BlocListener<PromoCodeBloc, PromoCodeState>(
        listener: (context, state) {
          if (state is PromoCodeApplySuccess) {
            refreshState(() {});
          }
        },
        child: Column(
          children: [
            _walletBalanceWidget(context),
            const AppPadding(
              dividedBy: 6,
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(AppConstants.defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(translation.of("cart.price"),
                            style: Theme.of(context).textTheme.subtitle1),
                        BlocBuilder<AddressSelectionBloc,
                            AddressSelectionState>(
                          builder: (context, dState) {
                            if (dState is AddressSelectionSuccess) {
                              return Text("${_cartPrice} ₹",
                                  style: Theme.of(context).textTheme.subtitle1);
                            } else {
                              return Text("${translation.of("n/a")} ₹",
                                  style: Theme.of(context).textTheme.subtitle1);
                            }
                          },
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(translation.of("cart.gst"),
                    //         style: Theme.of(context).textTheme.subtitle1),//TODO add gst
                    //     Text("${_gst} ₹",
                    //         style: Theme.of(context).textTheme.subtitle1),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(translation.of("cart.delivery_charge"),
                            style: Theme.of(context).textTheme.subtitle1),
                        BlocBuilder<DeliveryCheckCubit, DeliveryCheckState>(
                          builder: (context, deliveryState) {
                            if (deliveryState is DeliveryCheckSuccess) {
                              _deliveryCharge = _cartPrice >=
                                      BlocProvider.of<CartBloc>(context)
                                          .minimumPurchaseAmount
                                  ? 0
                                  : BlocProvider.of<CartBloc>(context)
                                      .deliveryCharge; //FIXME

                              return Text("${_deliveryCharge} ₹",
                                  style: Theme.of(context).textTheme.subtitle1);
                            } else {
                              _deliveryCharge = 0.0;
                              return Text("${_deliveryCharge} ₹",
                                  style: Theme.of(context).textTheme.subtitle1);
                            }
                          },
                        ),
                      ],
                    ),
                    promoApplied
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(translation.of("cart.promo_applied"),
                                  style: Theme.of(context).textTheme.subtitle1),
                              Text("- ${_promoCodeDiscount} ₹",
                                  style: Theme.of(context).textTheme.subtitle1),
                            ],
                          )
                        : Container(),
                    _useWallet
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(translation.of("cart.wallet"),
                                  style: Theme.of(context).textTheme.subtitle1),
                              Text(
                                  "- ${((_walletBalance ?? 0) > (_cartPrice + (_deliveryCharge ?? 0.0))) ? (_cartPrice + (_deliveryCharge ?? 0.0)) : _walletBalance} ₹",
                                  style: Theme.of(context).textTheme.subtitle1),
                            ],
                          )
                        : Container(),
                    Divider(
                      thickness: 1,
                    ),
                    BlocConsumer<DeliveryCheckCubit, DeliveryCheckState>(
                      listener: (context, deliveryState) {
                        if (deliveryState is DeliveryCheckSuccess) {
                          BlocProvider.of<CartBloc>(context).add(CartFetchEvent(
                              deviceId: app.deviceId,
                              // pinCode: BlocProvider.of<DeliveryCheckCubit>(context).pinCode,
                              lat: userData.lat,
                              lng: userData.lng,
                              reFetch: true));
                        }
                        if (deliveryState is DeliveryCheckFailed) {
                          showErrorFlash(
                              context: context,
                              message: "Delivery is not available");
                        }
                      },
                      builder: (context, deliveryState) {
                        if (deliveryState is DeliveryCheckSuccess) {
                          double delivery =
                              BlocProvider.of<CartBloc>(context).deliveryCharge;

                          double minimumBill =
                              BlocProvider.of<CartBloc>(context)
                                  .minimumPurchaseAmount;
                          // deliveryState.data.minimumPurchaseAmount;
                          if (_cartPrice > (minimumBill)) {
                            delivery = 0;
                          }
                          num add = (_gst ?? 0) + (delivery) + (_cartPrice);
                          num sub = (_useWallet ? _walletBalance ?? 0 : 0) +
                              (_promoCodeDiscount ?? 0);
                          num total = add - sub;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(translation.of("cart.total"),
                                  style: Theme.of(context).textTheme.headline6),
                              Text("${(total > 0) ? (total) : 0} ₹",
                                  style: Theme.of(context).textTheme.headline6),
                            ],
                          );
                        } else {
                          num add = (_gst ?? 0) +
                              (_deliveryCharge ?? 0) +
                              (_cartPrice);

                          num sub = (_useWallet ? _walletBalance ?? 0 : 0) +
                              (_promoCodeDiscount ?? 0);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(translation.of("cart.total"),
                                  style: Theme.of(context).textTheme.headline6),
                              Text("${(add - sub) > 0 ? ((add) - (sub)) : 0} ₹",
                                  style: Theme.of(context).textTheme.headline6),
                            ],
                          );
                        }
                      },
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  BlocBuilder<PromoCodeBloc, PromoCodeState> _promoCodeField() {
    return BlocBuilder<PromoCodeBloc, PromoCodeState>(
      builder: (context, state) {
        if (state is PromoCodeInitial) {
          return PromoCode(
              onPressed: () {
                bool? status =
                    _promoKey.currentState?.fields["promocode"]?.isValid;
                if (status == true) {
                  BlocProvider.of<PromoCodeBloc>(context).add(
                      PromoCodeApplyEvent(
                          promoCode: _promoKey
                                  .currentState?.fields["promocode"]?.value
                                  .toString() ??
                              "",
                          // pinCode: userData.pinCode,
                          deviceId: app.deviceId ?? "",
                          lat: userData.lat,
                          lng: userData.lng));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(translation.of("cart.enter_valid_promocode")),
                  ));
                }
              },
              formKey: _promoKey,
              message: null);
        } else if (state is PromoCodeApplyLoading) {
          return Center(
            child: LinearProgressIndicator(),
          );
        } else if (state is PromoCodeApplyFailed) {
          return PromoCode(
              onPressed: () {
                bool? status =
                    _promoKey.currentState?.fields["promocode"]?.isValid;
                if (status == true) {
                  BlocProvider.of<PromoCodeBloc>(context).add(
                      PromoCodeApplyEvent(
                          promoCode: _promoKey.currentState?.fields["promocode"]
                                  ?.toString() ??
                              "",
                          // pinCode: userData.pinCode,
                          deviceId: app.deviceId ?? "",
                          lat: userData.lat,
                          lng: userData.lng));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(translation.of("cart.enter_valid_promocode")),
                  ));
                }
              },
              formKey: _promoKey,
              message: state.message);
        } else if (state is PromoCodeApplySuccess) {
          if (state.response.discountedPrice != null) {
            _promoCode = state.response.promoCode;
            promoApplied = true;
            _promoCodeDiscount = state.response.discount!;
          } else {
            promoApplied = false;
            _promoCodeDiscount = null;
            _promoCode = null;
          }
          return PromoCode(
            initialValue: _promoCode,
            onPressed: () {
              bool? status =
                  _promoKey.currentState?.fields["promocode"]?.isValid;
              if (status == true) {
                BlocProvider.of<PromoCodeBloc>(context).add(PromoCodeApplyEvent(
                    promoCode: _promoKey.currentState?.fields["promocode"]
                            ?.toString() ??
                        "",
                    // pinCode: userData.pinCode,
                    deviceId: app.deviceId ?? "",
                    lng: userData.lng,
                    lat: userData.lat));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(translation.of("cart.enter_valid_promocode")),
                ));
              }
            },
            formKey: _promoKey,
            message: state.response.discount != null
                ? "Rs ${state.response.discount!} discount available"
                : translation.of("unexpected_error_occurred"),
          );
        } else {
          return Center(
            child: Text(
              translation.of("unexpected_error_occurred"),
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        }
      },
    );
  }

  Container _walletBalanceWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: _useWallet,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _useWallet = newValue!;
                    });
                  }),
              const SizedBox(
                width: 5,
              ),
              Text(translation.of("cart.use_wallet_balance"),
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          BlocBuilder<WalletBalanceBloc, WalletBalanceState>(
            builder: (context, state) {
              if (state is WalletBalanceFetchSuccess) {
                _effBalance = state.walletBalance?.effBalance ?? 0.0;
                _walletBalance = state.walletBalance?.balance ?? 0;
                return Text("${_walletBalance} ₹",
                    style: Theme.of(context).textTheme.subtitle1);
              } else {
                return Text("${translation.of("n/a")} ₹",
                    style: Theme.of(context).textTheme.subtitle1);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _addressCard() {
    return BlocBuilder<AddressSelectionBloc, AddressSelectionState>(
      builder: (context, state) {
        if (state is AddressSelectionSuccess) {
          if (state.address != null) {
            _addressId = state.address?.id;
          } else {
            _addressId = null;
          }
          return Container(
            child: state.address != null
                ? Stack(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppConstants.cornerRadius),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppConstants.defaultPadding * 0.6,
                              horizontal: AppConstants.defaultPadding * 0.6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${state.address?.firstName ?? ""} ${state.address?.lastName ?? ""}",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              AppPadding(
                                dividedBy: 4,
                              ),
                              Container(
                                width: 300,
                                child: Text(
                                  "${state.addressText ?? translation.of("n/a")}",
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              AppPadding(
                                dividedBy: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          right: 10,
                          bottom: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: Theme.of(context)
                                  .outlinedButtonTheme
                                  .style!
                                  .copyWith(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 8)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary)),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(CartRouter.selectAddressScreen);
                                // pushNewScreenWithRouteSettings(context,
                                //     settings: RouteSettings(
                                //       name: CartRouter.selectAddressScreen,
                                //     ),
                                //     screen: SelectAddressScreen());
                              },
                              child: Text(
                                translation.of("change").toUpperCase(),
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                          )),
                    ],
                  )
                : Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppConstants.cornerRadius),
                    ),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppConstants.defaultPadding,
                            horizontal: AppConstants.defaultPadding * 0.6),
                        child: Center(
                          child: ElevatedButton(
                            style: Theme.of(context)
                                .outlinedButtonTheme
                                .style!
                                .copyWith(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 8)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Theme.of(context)
                                            .colorScheme
                                            .onPrimary)),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(CartRouter.selectAddressScreen);
                              // pushNewScreenWithRouteSettings(context,
                              //     settings: RouteSettings(
                              //       name: CartRouter.selectAddressScreen,
                              //     ),
                              //     screen: SelectAddressScreen());
                            },
                            child: Text(
                              translation
                                  .of("cart.select_address")
                                  .toUpperCase(),
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        )),
                  ),
          );
        } else if (state is AddressSelectionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AddressSelectionFailed) {
          return Center(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
              ),
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppConstants.defaultPadding,
                      horizontal: AppConstants.defaultPadding * 0.6),
                  child: Center(
                    child: ElevatedButton(
                      style: Theme.of(context)
                          .outlinedButtonTheme
                          .style!
                          .copyWith(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 8)),
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).colorScheme.onPrimary)),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(CartRouter.selectAddressScreen);
                        // pushNewScreenWithRouteSettings(context,
                        //     settings: RouteSettings(
                        //       name: CartRouter.selectAddressScreen,
                        //     ),
                        //     screen: SelectAddressScreen());
                      },
                      child: Text(
                        translation.of("cart.select_address").toUpperCase(),
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  )),
            ),
          );
        } else {
          return Center(
              child: Text(translation.of("unexpected_error_occurred")));
        }
      },
    );
  }

  SizedBox _payNowButton() {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<DeliveryCheckCubit, DeliveryCheckState>(
        builder: (context, state) {
          if (state is DeliveryCheckSuccess) {
            return ElevatedButton(
              onPressed:
                  _useWallet ? _submitFormWithWallet : _submitFormWithoutWallet,
              child: BlocBuilder<PaymentBloc, PaymentState>(
                  builder: (context, payState) {
                if (payState is PaymentLoading) {
                  return Text(translation.of("loading"));
                } else {
                  return Text(
                    translation.of("cart.pay_now").toUpperCase(),
                  );
                }
              }),
            );
          } else {
            return ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.primary.withOpacity(0.7))),
              child: Text("Not available"),
            );
          }
        },
      ),
    );
  }

  Widget _notesTextField() {
    return FormBuilderTextField(
      name: 'notes',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: translation.of("notes"),
      ),
      onChanged: (value) {
        _formKey.currentState?.fields['notes']?.validate();
      },
    );
  }

  void _submitFormWithoutWallet() {
    bool isValid = _formKey.currentState!.validate();

    if (isValid && _addressId != null) {
      // String payType =
      //     _formKey.currentState!.fields['paymenttype']!.value.toString();
      PaymentType payType = PaymentType.PAYMENT_GATEWAY;

      String addressId = _addressId!;
      String? deviceId = app.deviceId;
      String? note =
          (_formKey.currentState?.fields['notes']?.value ?? "").toString();
      String? promoCode = _promoCode ?? "";
      double promoDiscount =
          double.tryParse(_promoCodeDiscount.toString()) ?? 0.0;
      double invoiceAmount =
          double.tryParse("$_cartPrice") ?? 0.0; //FIXME change value
      double subTotal =
          double.tryParse("$_cartPrice") ?? 0.0; ////FIXME change value
      debugPrint(
        "payType is $payType,addressId is $_addressId",
      );
      BlocProvider.of<PaymentBloc>(context).add(PaymentInitiateEvent(
          input: InitiatePaymentInput(
              deviceId: deviceId,
              note: note,
              promoCode: promoCode,
              addressId: addressId,
              paymentType: payType,
              invoiceAmount: invoiceAmount,
              promoDiscount: promoDiscount,
              subTotal: subTotal)));
      BlocProvider.of<PromoCodeBloc>(context).add(PromoCodeResetEvent());
    }
  }

  void _submitFormWithWallet() {
    bool isValid = _formKey.currentState!.validate();

    if (isValid && _addressId != null) {
      // String payType = _formKey.currentState!.fields['paymenttype']!.value.toString();
      PaymentType payType = PaymentType.PAYMENT_GATEWAY;
      String addressId = _addressId!;
      String? deviceId = app.deviceId;
      String? note =
          (_formKey.currentState?.fields['notes']?.value ?? "").toString();
      String? promoCode = _promoCode ?? "";
      double promoDiscount =
          double.tryParse(_promoCodeDiscount.toString()) ?? 0.0;
      double invoiceAmount =
          double.tryParse("$_cartPrice") ?? -1.0; //FIXME change value
      double subTotal =
          double.tryParse("$_cartPrice") ?? -1.0; ////FIXME change value
      debugPrint(
        "payType is $payType,addressId is $_addressId",
      );
      double total = 0;
      if (_useWallet) {
        double walletBalance = (double.parse("${_effBalance}") > subTotal)
            ? subTotal
            : double.parse("${_effBalance}");
        total = subTotal - walletBalance;
      } else {
        total = subTotal;
      }
      final input = InitiatePaymentInput(
          deviceId: deviceId,
          note: note,
          promoCode: promoCode,
          addressId: addressId,
          paymentType: payType,
          invoiceAmount: total,
          promoDiscount: promoDiscount,
          applyWallet: true,
          subTotal: invoiceAmount);
      log("input is ${input.toJson()}");
      BlocProvider.of<PaymentBloc>(context)
          .add(PaymentInitiateEvent(input: input));
      BlocProvider.of<PromoCodeBloc>(context).add(PromoCodeResetEvent());
    }
  }
}
