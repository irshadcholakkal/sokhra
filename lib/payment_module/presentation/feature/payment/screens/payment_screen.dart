import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../../base_module/domain/entity/app.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_event.dart';
import '../../../../../user_module/domain/entity/authentication.dart';
import '../../../../../user_module/domain/user_data.dart';
import '../../../../data/entity/models/create_payment_input.dart';
import '../../../../data/entity/models/wallet_input.dart';
import '../../../../domain/entity/payment_screen_args.dart';
import '../../../../domain/entity/payment_status_screen_args.dart';
import '../../../core/values/payments_router.dart';
import '../../wallet/blocs/wallet_bloc/wallet_bloc.dart';
import '../blocs/payment_bloc/payment_bloc.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _razorpay = Razorpay();
  PaymentScreenArgs? args;
  Map<String, dynamic> options = {};
  PaymentSuccessResponse? successResponse;
  PaymentFailureResponse? failureResponse;
  ExternalWalletResponse? externalWalletResponse;
  String? pendingOrderId;
  String error = "";
  bool initRazorPayCalled = false;
  bool isFromWallet = false;
  String? referrenceId;
  String? status;
  bool _isProcessingPayment = false;

  @override
  void initState() {
    super.initState();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as PaymentScreenArgs;

    if (initRazorPayCalled == false) {
      isFromWallet = args?.isFromWallet ?? false;
      referrenceId = args?.response.referrenceId;

      initRazorPay(
        status: args?.response.status,
        amount: args?.response.amount,
        gatewayId: args?.response.gatewayId,
        gatewayReceipt: args?.response.gatewayReceipt,
        pendingOrderId: args?.response.pendingOrderId,
      );
    }

    return WillPopScope(
      onWillPop: () async => !_isProcessingPayment,
      child: Scaffold(
        backgroundColor: AppColorScheme.secondaryBackgroundColor,
        appBar: SimpleAppBar(
          title: "Payment",
          canGoBack: !_isProcessingPayment,
        ),
        body: BlocListener<PaymentBloc, PaymentState>(
          listener: (context, state) {
            if (state is CreatePaymentSuccess) {
              // Navigator.pop(context);
              BlocProvider.of<NewCartBloc>(context).add(
                FetchCartItems(pincode: userData.pinCode),
              );
              // pushNewScreenWithRouteSettings(context,
              //     settings: RouteSettings(
              //         name: PaymentsRouter.paymentStatusScreen,
              //         arguments: PaymentStatusScreenArgs()),
              //     screen: PaymentStatusScreen());
              Navigator.of(context).pushNamedAndRemoveUntil(
                PaymentsRouter.paymentStatusScreen,
                (route) => false,
                arguments: PaymentStatusScreenArgs(),
              );
            } else if (state is CreatePaymentFailed) {
              setState(() {
                _isProcessingPayment = false;
              });

              // Navigator.pop(context);
              // pushNewScreenWithRouteSettings(context,
              //     settings: RouteSettings(
              //         name: PaymentsRouter.paymentStatusScreen,
              //         arguments: PaymentStatusScreenArgs()),
              //     screen: PaymentStatusScreen());
              Navigator.of(context).pushNamedAndRemoveUntil(
                PaymentsRouter.paymentStatusScreen,
                (route) => false,
                arguments: PaymentStatusScreenArgs(),
              );
            }
          },
          child: BlocListener<WalletBloc, WalletState>(
            listener: (context, state) {
              if (state is WalletCreditSuccess) {
                Navigator.pop(context);
                // pushNewScreenWithRouteSettings(context,
                //     settings: RouteSettings(
                //         name: PaymentsRouter.paymentStatusScreen,
                //         arguments: PaymentStatusScreenArgs(isWallet: true)),
                //     screen: PaymentStatusScreen());
                Navigator.pushNamed(
                  context,
                  PaymentsRouter.paymentStatusScreen,
                  arguments: PaymentStatusScreenArgs(isWallet: true),
                );
              }
              if (state is WalletCreditFailed) {
                Navigator.pop(context);
                // pushNewScreenWithRouteSettings(context,
                //     settings: RouteSettings(
                //         name: PaymentsRouter.paymentStatusScreen,
                //         arguments: PaymentStatusScreenArgs(isWallet: true)),
                //     screen: PaymentStatusScreen());
                Navigator.pushNamed(context, PaymentsRouter.paymentStatusScreen,
                    arguments: PaymentStatusScreenArgs(isWallet: true));
              }
            },
            child: Container(
              child: Center(
                child: error.trim().isEmpty
                    ? Container(
                        width: 320,
                        child: LinearProgressIndicator(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      )
                    : Text(
                        error,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.red,
                            ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void initRazorPay({
    String? status,
    required String? pendingOrderId,
    required String? gatewayId,
    required String? gatewayReceipt,
    required double? amount,
  }) {
    this.pendingOrderId = pendingOrderId;
    this.status = status;
    options = {
      'key': AppConstants.razorpayKey,
      'amount': amount,
      'currency': "INR",
      'name': 'Lumiere',
      'order_id': gatewayId, // Generate order_id using Orders API
      'timeout': 240, // in seconds
      'prefill': {
        'contact': authentication.user?.phone,
        'email': authentication.user?.email,
      },
      'theme': {
        'color': '#51B948',
        // 'backdrop_color': '#FFFFFF',
      },
    };

    try {
      _razorpay.open(options);
      initRazorPayCalled = true;
    } catch (e) {
      setState(() {
        error = e.toString();
        initRazorPayCalled = true;
      });
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    successResponse = response;

    if (isFromWallet) {
      // debugPrint("isFromwallet is true");
      if (successResponse?.paymentId == null
          // ||
          // successResponse?.signature == null ||
          // successResponse?.orderId == null
          ) {
        setState(() {
          error = "Invalid response from gateway \n add cash to wallet failed";
        });

        BlocProvider.of<PaymentBloc>(context).add(
          PaymentErrorEvent(error: error),
        );
      } else {
        BlocProvider.of<WalletBloc>(context).add(WalletCreditEvent(
          walletInput: WalletInput(
            credit: args?.response.amount,
            status: status ?? "SUCCESS",
            referrenceId: referrenceId ?? "",
            orderId: args?.response.pendingOrderId,
            paymentId: successResponse?.paymentId,
          ),
        ));
      }
    } else {
      // debugPrint("isFromwallet is false");
      if (successResponse?.paymentId == null ||
          // successResponse?.signature == null ||
          // successResponse?.orderId == null ||
          pendingOrderId == null) {
        // debugPrint(
        //     " payment Id:${successResponse?.paymentId} signature${successResponse?.signature} orderId${successResponse?.orderId} pendingOrderId:${pendingOrderId}");
        setState(() {
          error = "Invalid response from gateway";
        });

        BlocProvider.of<PaymentBloc>(context).add(
          PaymentErrorEvent(error: error),
        );
      } else {
        setState(() {
          _isProcessingPayment = true;
        });

        BlocProvider.of<PaymentBloc>(context).add(
          PaymentCreateEvent(
            input: CreatePaymentInput(
              razorpayPaymentId: successResponse!.paymentId!,
              razorpayOrderId: successResponse!.orderId ?? "",
              razorpaySignature: successResponse!.signature ?? "",
              pendingOrderId: pendingOrderId ?? "",
              deviceId: app.deviceId,
            ),
          ),
        );
      }
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint("payment failure ${response.message}");
    failureResponse = response;

    setState(() {
      error = (failureResponse?.message ?? "Error response from server");
    });

    try {
      Map<String, dynamic> map = jsonDecode(error);

      BlocProvider.of<PaymentBloc>(context).add(
        PaymentErrorEvent(error: map["error"]["description"]),
      );
    } catch (e) {
      BlocProvider.of<PaymentBloc>(context).add(
        PaymentErrorEvent(error: error),
      );
    }
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    externalWalletResponse = response;
  }
}
