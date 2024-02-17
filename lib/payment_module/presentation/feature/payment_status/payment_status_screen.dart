import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../base_module/domain/entity/translation.dart';
import '../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../catalogue_module/presentation/feature/list_catalogue/widgets/bottom_navigation.dart';
import '../../../../home/feature/home/screens/home_screen.dart';
import '../../../../new_cart_module/presentation/widget/cart_bottom_bar.dart';
import '../../../domain/entity/payment_status_screen_args.dart';
import '../payment/blocs/payment_bloc/payment_bloc.dart';

class PaymentStatusScreen extends StatefulWidget {
  const PaymentStatusScreen({Key? key}) : super(key: key);

  @override
  _PaymentStatusScreenState createState() => _PaymentStatusScreenState();
}

class _PaymentStatusScreenState extends State<PaymentStatusScreen> {
  double _iconBoxSize = 130;
  double _textBoxSize = 320;
  PaymentStatusScreenArgs args = PaymentStatusScreenArgs();

  @override
  Widget build(BuildContext context) {
    // args =
    //     ModalRoute.of(context)!.settings.arguments as PaymentStatusScreenArgs;

  //  if (args.isWallet) {
      //not implemented
      // return Scaffold(
      //   backgroundColor: AppColorScheme.primaryColor,
      //   body: Container(
      //     child: SingleChildScrollView(
      //       child: Container(
      //         width: double.infinity,
      //         child: Center(
      //           child: Container(
      //               constraints: BoxConstraints(maxWidth: 420),
      //               padding: EdgeInsets.all(AppConstants.defaultPadding),
      //               child: BlocBuilder<WalletBloc, WalletState>(
      //                 builder: (context, state) {
      //                   if (state is WalletCreditSuccess) {
      //                     return Column(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       mainAxisSize: MainAxisSize.min,
      //                       crossAxisAlignment: CrossAxisAlignment.center,
      //                       children: [
      //                         const AppPadding(
      //                           multipliedBy: 4,
      //                         ),
      //                         Container(
      //                           width: _iconBoxSize,
      //                           height: _iconBoxSize,
      //                           child: Icon(MdiIcons.checkCircle,
      //                               size: _iconBoxSize * 0.9,
      //                               color: Colors.green),
      //                         ),
      //                         const AppPadding(
      //                           dividedBy: 2,
      //                         ),
      //                         Container(
      //                           width: 250,
      //                           child: Center(
      //                             child: Text(
      //                               translation
      //                                   .of("payment.payment_success")
      //                                   .toUpperCase(),
      //                               style: Theme.of(context)
      //                                   .textTheme
      //                                   .headline6!
      //                                   .copyWith(
      //                                     color: Theme.of(context)
      //                                         .colorScheme
      //                                         .secondary,
      //                                   ),
      //                             ),
      //                           ),
      //                         ),
      //                         const AppPadding(),
      //                         // Container(
      //                         //   width: _textBoxSize,
      //                         //   child: Center(
      //                         //       child: Text(
      //                         //     "${amount}", //amount
      //                         //     style: Theme.of(context).textTheme.headline6,
      //                         //   )),
      //                         // ),
      //                         (state.customerWallet?.orderId != null &&
      //                                 state.customerWallet?.orderId?.trim() !=
      //                                     "")
      //                             ? Container(
      //                                 width: _textBoxSize,
      //                                 child: Center(
      //                                     child: Text(
      //                                   "Invoice ID: ${state.customerWallet?.orderId}", //transaction ID
      //                                   style: Theme.of(context)
      //                                       .textTheme
      //                                       .subtitle1,
      //                                 )),
      //                               )
      //                             : Container(),
      //                         (state.customerWallet?.paymentId != null &&
      //                                 state.customerWallet?.paymentId?.trim() !=
      //                                     "")
      //                             ? Container(
      //                                 width: _textBoxSize,
      //                                 child: Center(
      //                                     child: Text(
      //                                   "paymentID :${state.customerWallet?.paymentId}",
      //                                   style: Theme.of(context)
      //                                       .textTheme
      //                                       .subtitle1,
      //                                 )),
      //                               )
      //                             : Container(),
      //                         const AppPadding(),
      //                         Container(
      //                           width: double.infinity,
      //                           child: ElevatedButton(
      //                               onPressed: () {
      //                                 _shopMoreOnPress();
      //                               },
      //                               child: Text(
      //                                 translation
      //                                     .of("payment.shop_more")
      //                                     .toUpperCase(),
      //                                 style: Theme.of(context)
      //                                     .textTheme
      //                                     .button!
      //                                     .copyWith(
      //                                         color: Theme.of(context)
      //                                             .colorScheme
      //                                             .onPrimary),
      //                               )),
      //                         )
      //                       ],
      //                     );
      //                   }
      //                   if (state is WalletCreditFailed) {
      //                     return Column(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       mainAxisSize: MainAxisSize.min,
      //                       crossAxisAlignment: CrossAxisAlignment.center,
      //                       children: [
      //                         const AppPadding(
      //                           multipliedBy: 4,
      //                         ),
      //                         Container(
      //                           constraints:
      //                               const BoxConstraints(maxWidth: 380),
      //                           child: Text(
      //                             state.error.toUpperCase(),
      //                             style: Theme.of(context).textTheme.headline6,
      //                             textAlign: TextAlign.center,
      //                           ),
      //                         ),
      //                         const AppPadding(
      //                           dividedBy: 2,
      //                         ),
      //                         Icon(
      //                           Icons.error_outlined,
      //                           size: _iconBoxSize * 0.9,
      //                           color: Colors.red,
      //                         ),
      //                         Container(
      //                           width: 250,
      //                           child: Center(
      //                             child: Text(
      //                               translation
      //                                   .of("payment.payment_failed")
      //                                   .toUpperCase(),
      //                               style: Theme.of(context)
      //                                   .textTheme
      //                                   .headline6!
      //                                   .copyWith(
      //                                     color: Colors.red,
      //                                   ),
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     );
      //                   } else {
      //                     return Center(child: CircularProgressIndicator());
      //                   }
      //                 },
      //               )),
      //         ),
      //       ),
      //     ),
      //   ),
      // );
 //   }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
         backgroundColor: AppColorScheme.surfaceColorLight,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: BlocBuilder<PaymentBloc, PaymentState>(
                builder: (context, state) {
                  if (state is CreatePaymentSuccess) {
                    return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          "lib/base_module/presentation/core/assets/images/check_circle.svg"),
                      SizedBox(
                        width: 260,
                        child: Text(
                          'Your order is successfully placed',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF1D1A20),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const AppPadding(dividedBy: 2),

                      /// if (state.response.orderNumber != null)
                      Text(
                        "nn",
                        // "${state.response.orderNumber}",
                        style: TextStyle(
                          color: Color(0xFF1D1A20).withOpacity(0.50),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'You can track the order in the “My orders” Section',
                        style: TextStyle(
                          color: Color(0xFF1D1A20).withOpacity(0.50),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  );
                    
                    // Column(
                    //   mainAxisSize: MainAxisSize.min,
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     const AppPadding(),
                    //     Icon(
                    //       MdiIcons.checkCircle,
                    //       size: _iconBoxSize * 0.9,
                    //       color: AppColorScheme.onPrimaryLight,
                    //     ),
                    //     const AppPadding(),
                    //     Text(
                    //       "Your order has been placed successfully",
                    //       style:
                    //           Theme.of(context).textTheme.headline6?.copyWith(
                    //                 fontSize: 22,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: AppColorScheme.onPrimaryLight,
                    //               ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //     const AppPadding(dividedBy: 2),
                    //     if (state.response.orderNumber != null)
                    //       Text(
                    //         "Order Id: ${state.response.orderNumber}",
                    //         style:
                    //             Theme.of(context).textTheme.subtitle1?.copyWith(
                    //                   fontWeight: FontWeight.w500,
                    //                   color: AppColorScheme.onPrimaryLight,
                    //                 ),
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     // if (state.response.gatewayId != null &&
                    //     //     state.response.gatewayId?.trim() != "")
                    //     //   Text(
                    //     //     "GatewayID :${state.response.gatewayId}",
                    //     //     style:
                    //     //         Theme.of(context).textTheme.subtitle1?.copyWith(
                    //     //               fontWeight: FontWeight.w500,
                    //     //               color: AppColorScheme.onPrimaryLight,
                    //     //             ),
                    //     //     textAlign: TextAlign.center,
                    //     //   ),
                    //     const AppPadding(),
                    //     Text(
                    //       "Thank You",
                    //       style:
                    //           Theme.of(context).textTheme.headline6!.copyWith(
                    //                 fontSize: 57,
                    //                 fontWeight: FontWeight.w700,
                    //                 color: AppColorScheme.onPrimaryLight,
                    //               ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //     TextButton(
                    //       onPressed: _shopMoreOnPress,
                    //       child: Text(
                    //         "Go to home",
                    //         style:
                    //             Theme.of(context).textTheme.subtitle2!.copyWith(
                    //                   fontWeight: FontWeight.w400,
                    //                   color: AppColorScheme.onPrimaryLight,
                    //                   decoration: TextDecoration.underline,
                    //                 ),
                    //       ),
                    //     ),
                    //     const AppPadding(),
                    //   ],
                    // );
                  } else if (state is CreatePaymentFailed) {
                    return 
                    Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const AppPadding(multipliedBy: 4),
                      // Container(
                      //   constraints: const BoxConstraints(maxWidth: 380),
                      //   // child: Text(
                      //   //   "SOMETHING WENT WRONG",
                      //   //   style: Theme.of(context).textTheme.headline6,
                      //   //   textAlign: TextAlign.center,
                      //   // ),
                      // ),
                      // const AppPadding(dividedBy: 2),
                      SvgPicture.asset(
                          "lib/base_module/presentation/core/assets/images/cancel.svg"),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 250,
                        child: Center(
                          child: Text(
                            translation
                                .of("payment.payment_failed")
                                .toUpperCase(),
                            style: TextStyle(
                              color: Color(0xFF1D1A20),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Please click “Retry” below to retry payment',
                        style: TextStyle(
                          color: Color(0xFF1D1A20).withOpacity(0.50),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.11,
                        ),
                      )
                    ],
                  );


                    
                    // Column(
                    //   mainAxisSize: MainAxisSize.min,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     const AppPadding(),
                    //     Icon(
                    //       Icons.error_outlined,
                    //       size: _iconBoxSize * 0.9,
                    //       color: AppColorScheme.onPrimaryLight,
                    //     ),
                    //     const AppPadding(),
                    //     Text(
                    //       state.message,
                    //       style:
                    //           Theme.of(context).textTheme.headline6?.copyWith(
                    //                 fontSize: 22,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: AppColorScheme.onPrimaryLight,
                    //               ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //     const AppPadding(dividedBy: 2),
                    //     Text(
                    //       translation.of("payment.payment_failed"),
                    //       style:
                    //           Theme.of(context).textTheme.headline6!.copyWith(
                    //                 fontSize: 57,
                    //                 fontWeight: FontWeight.w700,
                    //                 color: AppColorScheme.onPrimaryLight,
                    //               ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //     TextButton(
                    //       onPressed: _shopMoreOnPress,
                    //       child: Text(
                    //         "Go to home",
                    //         style:
                    //             Theme.of(context).textTheme.subtitle2!.copyWith(
                    //                   fontWeight: FontWeight.w400,
                    //                   color: AppColorScheme.onPrimaryLight,
                    //                   decoration: TextDecoration.underline,
                    //                 ),
                    //       ),
                    //     ),
                    //     const AppPadding(),
                    //   ],
                    // );


                  } else if (state is InitiatePaymentSuccess) {
                    return 
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          "lib/base_module/presentation/core/assets/images/check_circle.svg"),
                      SizedBox(
                        width: 260,
                        child: Text(
                          'Your order is successfully placed',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF1D1A20),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const AppPadding(dividedBy: 2),

                      /// if (state.response.orderNumber != null)
                      Text(
                        "nn",
                        // "${state.response.orderNumber}",
                        style: TextStyle(
                          color: Color(0xFF1D1A20).withOpacity(0.50),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'You can track the order in the “My orders” Section',
                        style: TextStyle(
                          color: Color(0xFF1D1A20).withOpacity(0.50),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  );
                    
                    
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   mainAxisSize: MainAxisSize.min,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     const AppPadding(multipliedBy: 4),
                    //     Container(
                    //       width: _iconBoxSize,
                    //       height: _iconBoxSize,
                    //       child: Icon(
                    //         MdiIcons.checkCircle,
                    //         size: _iconBoxSize * 0.9,
                    //         color: Colors.green,
                    //       ),
                    //     ),
                    //     const AppPadding(dividedBy: 2),
                    //     Container(
                    //       width: 250,
                    //       child: Center(
                    //         child: Text(
                    //           translation
                    //               .of("payment.payment_success")
                    //               .toUpperCase(),
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .headline6!
                    //               .copyWith(
                    //                 color:
                    //                     Theme.of(context).colorScheme.secondary,
                    //               ),
                    //         ),
                    //       ),
                    //     ),
                    //     const AppPadding(),
                    //     // Container(
                    //     //   width: _textBoxSize,
                    //     //   child: Center(
                    //     //       child: Text(
                    //     //     "${amount}", //amount
                    //     //     style: Theme.of(context).textTheme.headline6,
                    //     //   )),
                    //     // ),
                    //     (state.response.gatewayReceipt != null &&
                    //             state.response.gatewayReceipt?.trim() != "")
                    //         ? Container(
                    //             width: _textBoxSize,
                    //             child: Center(
                    //                 child: Text(
                    //               "Invoice ID: ${state.response.gatewayReceipt}",
                    //               //transaction ID
                    //               style: Theme.of(context).textTheme.subtitle1,
                    //             )),
                    //           )
                    //         : Container(),
                    //     (state.response.gatewayId != null &&
                    //             state.response.gatewayId?.trim() != "")
                    //         ? Container(
                    //             width: _textBoxSize,
                    //             child: Center(
                    //               child: Text(
                    //                 "GatewayID :${state.response.gatewayId}",
                    //                 style:
                    //                     Theme.of(context).textTheme.subtitle1,
                    //               ),
                    //             ),
                    //           )
                    //         : Container(),
                    //     const AppPadding(),
                    //     Container(
                    //       width: double.infinity,
                    //       child: ElevatedButton(
                    //         onPressed: () {
                    //           _shopMoreOnPress();
                    //         },
                    //         child: Text(
                    //           translation.of("payment.shop_more").toUpperCase(),
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .button!
                    //               .copyWith(
                    //                   color: Theme.of(context)
                    //                       .colorScheme
                    //                       .onPrimary),
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // );
                  } else if (state is InitiatePaymentFailed) {
                    return 
                    Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const AppPadding(multipliedBy: 4),
                      // Container(
                      //   constraints: const BoxConstraints(maxWidth: 380),
                      //   // child: Text(
                      //   //   "SOMETHING WENT WRONG",
                      //   //   style: Theme.of(context).textTheme.headline6,
                      //   //   textAlign: TextAlign.center,
                      //   // ),
                      // ),
                      // const AppPadding(dividedBy: 2),
                      SvgPicture.asset(
                          "lib/base_module/presentation/core/assets/images/cancel.svg"),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 250,
                        child: Center(
                          child: Text(
                            translation
                                .of("payment.payment_failed")
                                .toUpperCase(),
                            style: TextStyle(
                              color: Color(0xFF1D1A20),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Please click “Retry” below to retry payment',
                        style: TextStyle(
                          color: Color(0xFF1D1A20).withOpacity(0.50),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.11,
                        ),
                      )
                    ],
                  );
                    
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   mainAxisSize: MainAxisSize.min,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     const AppPadding(multipliedBy: 4),
                    //     Container(
                    //       constraints: const BoxConstraints(maxWidth: 380),
                    //       child: Text(
                    //         state.message.toUpperCase(),
                    //         style: Theme.of(context).textTheme.headline6,
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     ),
                    //     const AppPadding(dividedBy: 2),
                    //     Icon(
                    //       Icons.error_outlined,
                    //       size: _iconBoxSize * 0.9,
                    //       color: Colors.red,
                    //     ),
                    //     Container(
                    //       width: 250,
                    //       child: Center(
                    //         child: Text(
                    //           translation
                    //               .of("payment.payment_failed")
                    //               .toUpperCase(),
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .headline6!
                    //               .copyWith(
                    //                 color: Colors.red,
                    //               ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // );
                  } else if (state is PaymentLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return 
                    Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const AppPadding(multipliedBy: 4),
                      // Container(
                      //   constraints: const BoxConstraints(maxWidth: 380),
                      //   // child: Text(
                      //   //   "SOMETHING WENT WRONG",
                      //   //   style: Theme.of(context).textTheme.headline6,
                      //   //   textAlign: TextAlign.center,
                      //   // ),
                      // ),
                      // const AppPadding(dividedBy: 2),
                      SvgPicture.asset(
                          "lib/base_module/presentation/core/assets/images/cancel.svg"),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 250,
                        child: Center(
                          child: Text(
                            translation
                                .of("payment.payment_failed")
                                .toUpperCase(),
                            style: TextStyle(
                              color: Color(0xFF1D1A20),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Please click “Retry” below to retry payment',
                        style: TextStyle(
                          color: Color(0xFF1D1A20).withOpacity(0.50),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.11,
                        ),
                      )
                    ],
                  );
                    
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   mainAxisSize: MainAxisSize.min,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     const AppPadding(multipliedBy: 4),
                    //     Container(
                    //       constraints: const BoxConstraints(maxWidth: 380),
                    //       child: Text(
                    //         "SOMETHING WENT WRONG",
                    //         style: Theme.of(context).textTheme.headline6,
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     ),
                    //     const AppPadding(dividedBy: 2),
                    //     Icon(
                    //       Icons.error_outlined,
                    //       size: _iconBoxSize * 0.9,
                    //       color: Colors.red,
                    //     ),
                    //     Container(
                    //       width: 250,
                    //       child: Center(
                    //         child: Text(
                    //           translation
                    //               .of("payment.payment_failed")
                    //               .toUpperCase(),
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .headline6!
                    //               .copyWith(
                    //                 color: Colors.red,
                    //               ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // );
                  }
                },
              ),
            ),
          ),
        ),
         bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
        decoration: BoxDecoration(
          color: AppColorScheme.onPrimaryLight,
          boxShadow: [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 10,
              offset: Offset(0, -4),
              spreadRadius: 0,
            )
          ],
        ),
        child:
        // Container(
        //   height: 48,
        //   padding: const EdgeInsets.symmetric(horizontal: 42),
        //   clipBehavior: Clip.antiAlias,
        //   decoration: ShapeDecoration(
        //     color: AppColorScheme.primaryColor,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //   ),
        //   child: Center(
        //     child: Text(
        //     'View order details',
        //     textAlign: TextAlign.center,
        //     style: TextStyle(
        //     color: AppColorScheme.onPrimaryLight,
        //     fontSize: 16,
        //     fontFamily: 'Poppins',
        //     fontWeight: FontWeight.w500,
            
        //     ),
        //     ),
        //   ),
        // ),


        InkWell(
          onTap: () {
          Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBottomNavigationBar(),
                  ),
                );
           // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CartBottomBar(),), (route) => false);
          },
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 42),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: AppColorScheme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
              'Retry',
              textAlign: TextAlign.center,
              style: TextStyle(
              color: AppColorScheme.onPrimaryLight,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              
              ),
              ),
            ),
          ),
        )
        



      ),
      ),
    );
  }

  void _shopMoreOnPress() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => HomeScreen()),
      (route) => false,
    );
  }
}
