import 'dart:async';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:lumiereorganics_app/catalogue_module/domain/models/delivery_shift.dart';
import 'package:lumiereorganics_app/catalogue_module/presentation/feature/list_catalogue/blocs/get_deliver_shift_by_zone_bloc/get_delivery_shift_by_zone_bloc.dart';
import 'package:lumiereorganics_app/catalogue_module/presentation/feature/list_catalogue/widgets/check_out_item_list.dart';
import 'package:lumiereorganics_app/driver_module/presentation/feature/demo/widgets/date_picker.dart';
import 'package:lumiereorganics_app/user_module/presentation/components/delivery_adress_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import '../../../../base_module/domain/entity/app.dart';
import '../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../base_module/domain/entity/translation.dart';
import '../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../base_module/presentation/component/indicator/loading_or_error_indicator.dart';
import '../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../base_module/presentation/component/promocode/promocode.dart';
import '../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../base_module/presentation/util/string_modifiers.dart';
import '../../../../catalogue_module/domain/models/delivery_shift.dart';
import '../../../../catalogue_module/domain/models/delivery_shift.dart';
import '../../../../catalogue_module/domain/models/delivery_shift.dart';
import '../../../../catalogue_module/domain/models/delivery_shift.dart';
import '../../../../catalogue_module/domain/models/product_status.dart';
import '../../../../catalogue_module/presentation/feature/details/blocs/delivery_check_cubit/delivery_check_cubit.dart';
import '../../../../catalogue_module/presentation/feature/list_catalogue/widgets/item_list_widget.dart';
import '../../../../globals.dart';
import '../../../../new_cart_module/domain/new_cart_model.dart';
import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_event.dart';
import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_state.dart';
import '../../../../payment_module/data/entity/models/initiate_payment_input.dart';
import '../../../../payment_module/data/entity/models/payment_type.dart';
import '../../../../payment_module/domain/entity/payment_screen_args.dart';
import '../../../../payment_module/presentation/core/values/payments_router.dart';
import '../../../../payment_module/presentation/feature/payment/blocs/payment_bloc/payment_bloc.dart';
import '../../../../payment_module/presentation/feature/payment_status/payment_status_screen.dart';
import '../../../../payment_module/presentation/feature/promocode/blocs/promo_code_bloc/promo_code_bloc.dart';
import '../../../../user_module/domain/user_data.dart';
import '../../../../user_module/presentation/components/manage_address_bottom_sheet.dart';
import 'widget/wave_bubble_widget.dart';

class CheckOutScreen extends StatefulWidget {
  final List<Cart>? cartList;

  const CheckOutScreen({Key? key, this.cartList});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  double _totalAmount = 0;
  double _taxAmount = 0;
  double _deliveryCharge = 0;
  double _freeDeliveryAmount = 0;
  double reductionPrice = 0.0;
  String? _addressId;
  final _notesController = TextEditingController();
  List<Cart> _cartList = [];
  late PlayerController _controller;
  TextEditingController dateController = TextEditingController();
  TextEditingController dateController2 = TextEditingController();
  TextEditingController _promocode = TextEditingController();
    final _formKey = GlobalKey<FormState>();
 String? selectedStartDate = "";
 String? selectedEndDate = "";

  String? _zoneId = "";

  bool scheduled = false;
  ////// audio dep

  late final RecorderController _recorderController;
  PermissionStatus? _status;

  // PermissionStatus _status = PermissionStatus.undetermined;

  String? _path;
  String? _musicFile;
  bool _isRecording = false;
  bool _isRecordingCompleted = false;
  bool _isLoading = true;
  late Directory _appDirectory;

  DeliveryShift? selectedShift;

  // late StreamSubscription<PlayerState> playerStateSubscription;

  int _counter = 0;
  late Timer _timer;
  PaymentType selectedPaymentMethod = PaymentType.PAYMENT_GATEWAY;
  String? date;

  @override
  void initState() {
    super.initState();
    print("widget.cartList >>> ${widget.cartList}");
    _cartList = widget.cartList ?? [];
    _getAddress();
    _getTotal();
    
    _getDir();
    _initialiseControllers();
    _controller = PlayerController();
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    dateController2.text = DateFormat('dd MMMM yyyy').format(DateTime.now());

    // playerStateSubscription = _controller.onPlayerStateChanged.listen((_) {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    // playerStateSubscription.cancel();
    _controller.dispose();
    _recorderController.dispose();
    // _timer.cancel();
    dateController.dispose();
    dateController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Cart> inStockItems = [];
    List<Cart> outStockItems = [];

    _cartList.forEach((cart) {
      if (cart.product?.variants?.first.status != ProductStatus.IN_STOCK.name) {
        outStockItems.add(cart);
      } else {
        inStockItems.add(cart);
      }
    });

    return MultiBlocListener(
      listeners: [
        BlocListener<NewCartBloc, NewCartState>(
          listener: (context, state) {
            if (state is CartLoaded) {
              setState(() {
                _cartList = state.cartList ?? [];
                _getTotal();
              });
            }
          },
        ),
        BlocListener<PaymentBloc, PaymentState>(
          listener: (context, paymentState) {
            if (paymentState is InitiatePaymentSuccess) {
              final response = paymentState.response;
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PaymentStatusScreen(),), (route) => false);

              if (response.status?.toUpperCase() == "SUCCESS") {
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PaymentStatusScreen(),), (route) => false);

                // Navigator.pop(context);
                // Navigator.of(context).pushNamed(
                //     PaymentsRouter.paymentStatusScreen,
                //     arguments: PaymentStatusScreenArgs());
                // pushNewScreenWithRouteSettings(context,
                //     settings: RouteSettings(
                //         name: PaymentsRouter.paymentStatusScreen,
                //         arguments: PaymentStatusScreenArgs()),
                //     screen: PaymentStatusScreen());
              } else {
                             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PaymentStatusScreen(),), (route) => false);

                // Navigator.of(context).pushNamed(
                //   PaymentsRouter.paymentScreen,
                //   arguments: PaymentScreenArgs(response: response),
                // );
              }
              
            }
            if(paymentState is InitiatePaymentFailed ){
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PaymentStatusScreen(),), (route) => false);
              print("-----------------------FAILED---------------------");
            }
          },
        ),
      ],
      child: BlocBuilder<DeliveryCheckCubit, DeliveryCheckState>(
        builder: (context, state) {
          final deliveryInfo =
              state is DeliveryCheckSuccess ? state.data : null;
          final minimumPurchaseAmount =
              deliveryInfo?.minimumPurchaseAmount ?? -1;
          _freeDeliveryAmount = minimumPurchaseAmount - _totalAmount;
          _deliveryCharge = _cartList
                  .firstWhereOrNull(
                      (element) => (element.deliveryCharge ?? 0) > 0)
                  ?.deliveryCharge ??
              0;
          print("deliveryinfo${deliveryInfo}");
          if (_freeDeliveryAmount <= 0) {
            _deliveryCharge = 0;
          }

          return Scaffold(
            backgroundColor: AppColorScheme.surfaceColorLight,
            appBar: SimpleAppBar(title: "Checkout"),
            body: _cartList.isNotEmpty == true
                ? RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(Duration(milliseconds: 500), () {
                        BlocProvider.of<NewCartBloc>(context).add(
                          FetchCartItems(
                            pincode: userData.pinCode,
                          ),
                        );

                        return true;
                      });
                    },
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.defaultPadding / 2,
                          vertical: AppConstants.defaultPadding / 2,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //ItemListWidget(cartList: _cartList),
                              // AppPadding(dividedBy: 2),
                              // if (_totalAmount > 0 &&
                              //     _cartList.isNotEmpty &&
                              //     outStockItems.isEmpty)
                              //   _grandTotalCard(),
                              // AppPadding(dividedBy: 2),
                              // Text(
                              //   "Order or delivery instructions",
                              //   style: Theme.of(context)
                              //       .textTheme
                              //       .subtitle2
                              //       ?.copyWith(
                              //         fontWeight: FontWeight.w600,
                              //         color: Theme.of(context)
                              //             .colorScheme
                              //             .onBackground,
                              //       ),
                              // ),
                              // AppPadding(dividedBy: 3),
                              // _notesCard(),
                              // _deliveryInstructionsWidget(),
                              // AppPadding(dividedBy: 2),
                              Text(
                                'Delivery Address',
                                style: TextStyle(
                                  color: Color(0xFF1D1A20),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                 
                                ),
                              ),
                              _addressCard(),
                              //AppPadding(dividedBy: 2),
                              SizedBox(
                                height: 24,
                              ),
                              Divider(
                                height: 0.50,
                              ),
                          
                              SizedBox(
                                height: 24,
                              ),
                              _scheduledelivery(),
                              SizedBox(
                                height: 24,
                              ),
                              Divider(
                                height: 0.50,
                              ),
                          
                              SizedBox(
                                height: 24,
                              ),
                              _promoCode(),
                              SizedBox(
                                height: 24,
                              ),
                              _paymentDetails(),
                              SizedBox(
                                height: 24,
                              ),
                              Divider(
                                height: 0.50,
                              ),
                          
                              SizedBox(
                                height: 24,
                              ),
                              _choosePaymentMethod(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(child: Text("Cart is empty")),
            bottomNavigationBar:
                // deliveryInfo != null &&
                          _addressId != null &&
                        _cartList.isNotEmpty == true &&
                        _totalAmount > 0 &&
                        outStockItems.isEmpty
                    ? _bottomNavigationBar()
                    : null,
          );
        },
      ),
    );
  }

  Widget _grandTotalCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppConstants.cornerRadiusLarge,
        ),
        color: Theme.of(context).colorScheme.background,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding / 2,
        vertical: AppConstants.defaultPadding / 2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery charge",
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              SizedBox(height: 15),
              Text(
                "₹$_deliveryCharge",
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              )
            ],
          ),
          SizedBox(height: 2),
          if (_freeDeliveryAmount > 0 && _deliveryCharge > 0)
            Text(
              "Add products worth ₹$_freeDeliveryAmount more to get free delivery",
              style: Theme.of(context).textTheme.caption?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 8,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
            ),
          AppPadding(dividedBy: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Grand total',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                    TextSpan(
                      text: ' (Inc tax ₹${_taxAmount.toStringAsFixed(2)})',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.65),
                          ),
                    )
                  ],
                ),
              ),
              Text(
                "₹${_getGrandTotal().toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _notesCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppConstants.defaultPadding / 3,
        horizontal: AppConstants.defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppConstants.cornerRadiusLarge,
        ),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Type here",
            style: Theme.of(context).textTheme.caption?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          TextFormField(
            controller: _notesController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: "Eg: Use fresh and ripened bananas",
              hintStyle: Theme.of(context).textTheme.caption?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _deliveryInstructionsWidget() {
    return SizedBox(
      // child:
      // _notesCard(),

      // height: _isRecording ? 100 : 90,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: _isRecording ? 1 : 3,
            child: GestureDetector(
              // onTap: () {
              //   _startOrStopRecording();
              // },
              onLongPressStart: (val) async {
                PermissionStatus status = await Permission.microphone.status;
                // _checkPermissionStatus();
                if (status == PermissionStatus.granted) {
                  _startRecording();
                  setState(() {
                    _isRecording = true;
                  });
                } else {
                  _requestPermission();
                  setState(() {
                    _isRecording = false;
                    _isRecordingCompleted = true;
                  });
                }
              },
              onLongPressEnd: (val) async {
                final path = await _recorderController.stop();
                if (path != null) {
                  setState(() {
                    _isRecording = false;
                    _isRecordingCompleted = true;
                  });
                  _timer.cancel();
                  debugPrint(path);
                  debugPrint("Recorded file size: ${File(path).lengthSync()}");
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    // vertical:
                    //     _isRecording ? 1 : AppConstants.defaultPadding * 0.75,
                    // horizontal:AppConstants.defaultPadding/2
                    // AppConstants.defaultPadding / 4
                    ),
                // width: 99,
                width: 88,
                // height: _isRecording ? 100 : 90,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppConstants.cornerRadius),
                    color: Theme.of(context).colorScheme.surface),
                child: _isRecording
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppConstants.defaultPadding / 4,
                            horizontal: AppConstants.defaultPadding / 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.mic,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Recording",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onTertiary),
                                    ),
                                  ],
                                ),
                                Text("Release to save",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onTertiary))
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text(' ${_getTimerText()}'),
                                    AudioWaveforms(
                                      enableGesture: true,
                                      size: Size(80, 20),
                                      recorderController: _recorderController,
                                      waveStyle: WaveStyle(
                                        waveColor: AppColorScheme.borderColor
                                            .withOpacity(0.5),
                                        extendWaveform: true,
                                        showMiddleLine: false,
                                        // backgroundColor: Colors.yellow
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        // color: Colors.red
                                        // color: const Color(0xFF1E1B26),
                                      ),
                                      padding: const EdgeInsets.only(left: 18),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : _path != null
                        ? Container(
                            height: 100,
                            // height: 90,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.2),
                                border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.cornerRadius)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                WaveBubble(
                                  delete: () async {
                                    setState(() {
                                      _path = null;
                                    });
                                    // _recorderController.
                                    _recorderController.refresh();
                                    // _getDir();
                                  },
                                  path: _path,
                                  isSender: true,
                                  appDirectory: _appDirectory,
                                ),
                                // Spacer(),
                                // _controller.playerState.isPlaying?
                                //     Text("Pause"):Text("Play")
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                // horizontal: AppConstants.defaultPadding / 2
                                horizontal: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3, 0, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.mic,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          size: 18),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "Record",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onTertiary),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: AppConstants.defaultPadding / 4,
                                // ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 5),
                                  child: Text(
                                    "Press here \n & hold",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inverseSurface),
                                  ),
                                ),
                                AudioFileWaveforms(
                                  size: Size(10, 10),
                                  playerController: _controller,
                                  playerWaveStyle: const PlayerWaveStyle(
                                    scaleFactor: 0.8,
                                    fixedWaveColor: Colors.white30,
                                    liveWaveColor: Colors.white,
                                    waveCap: StrokeCap.butt,
                                  ),
                                )
                              ],
                            ),
                          ),
              ),
            ),
          ),
          SizedBox(
            width: _isRecording ? 0 : AppConstants.defaultPadding / 4,
          ),
          _isRecording
              ? SizedBox()
              : Expanded(
                  flex: 8,
                  child: _notesCard(),
                )
        ],
      ),
    );
  }

  Widget _addressCard() {
    return Container(
      padding: EdgeInsets.symmetric(
        // horizontal: AppConstants.defaultPadding / 2,
        vertical: AppConstants.defaultPadding / 2,
      ),
      width: double.infinity,
      //height: 74,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(
      //     AppConstants.cornerRadiusLarge,
      //   ),
      //   color: Theme.of(context).colorScheme.background,
      // ),
      child: BlocBuilder<AppDataBloc, AppDataState>(
        builder: (context, state) {
          if (state is FetchAppDataSuccess) {
            final appData = state.appData;
            final addressData = state.appData.addressDetails;

            final addressItem = addressData?.firstWhereOrNull(
                  (element) => element.isDefault == true,
                ) ??
                addressData?.firstOrNull;

            _addressId = addressItem?.id;
            print("AdressID : ${_addressId}");
            _getDeliverShift();

            if (_addressId == null) {
              return TextButton(
                onPressed: () {
                  showBottomSheetPopup(
                    builder: (context) {
                      return ManageAddressBottomSheet();
                    },
                  );

                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (_) => ManageAddressScreen(),
                  // ));
                },
                child: Text(
                  "Add address",
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onBackground,
                        decoration: TextDecoration.underline,
                      ),
                ),
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  ThemeAssets.location,
                  // width: 20,
                  // height: 20,
                  // fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // RichText(
                          //   text: TextSpan(
                          //     // Define your text spans here
                          //     children: <TextSpan>[
                          //       TextSpan(
                          //         text: "Home",
                          //         style:
                          //             Theme.of(context).textTheme.caption?.copyWith(
                          //                   fontWeight: FontWeight.w700,
                          //                   color: Theme.of(context)
                          //                       .colorScheme
                          //                       .onBackground,
                          //                 ),
                          //       ),
                          //       if (addressItem?.isDefault == true)
                          //         TextSpan(
                          //           text: "    You are here",
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .caption
                          //               ?.copyWith(
                          //                 fontWeight: FontWeight.w500,
                          //                 fontSize: 8,
                          //                 color: Theme.of(context)
                          //                     .colorScheme
                          //                     .onTertiaryContainer,
                          //               ),
                          //         ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          Text(
                            "${StringModifiers.enumToString(addressItem?.type)?.replaceAll("_", " ")}",
                            style: TextStyle(
                              color: Color(0xFF1D1B1E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      // SizedBox(width: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 232,
                            child: Text(
                              [
                                addressItem?.firstName ?? "",
                                addressItem?.house ?? "",
                                addressItem?.landmark ?? "",
                                addressItem?.pincode ?? ""
                              ].where((e) => e.isNotEmpty).join(", "),
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground
                                            .withOpacity(0.5),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                      ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // showBottomSheetPopup(
                              //   builder: (context) {
                              //     return ManageAddressBottomSheet();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DeliveryAdressScreen(),
                                  ));
                              //   },
                              // );

                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (_) => ManageAddressScreen(),
                              // ));
                            },
                            child: Container(
                              width: 56.72,
                              height: 19.01,
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 8.36, vertical: 2.51),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.42, color: Color(0xFFCBC4CF)),
                                  borderRadius: BorderRadius.circular(8.36),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Change",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                        fontSize: 9.19,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        color: AppColorScheme.primaryColor,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          }

          return LoadingOrErrorIndicator(
            isLoading: state is! FetchAppDataFailed,
            error: state.errorMessage,
            onRetry: _getAddress,
          );
        },
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: AppConstants.defaultPadding / 2,
      //   vertical: AppConstants.defaultPadding / 1.5,
      // ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadiusDirectional.only(
      //     topStart: Radius.circular(AppConstants.cornerRadius),
      //     topEnd: Radius.circular(AppConstants.cornerRadius),
      //   ),
      //   color: Theme.of(context).colorScheme.background,
      //   boxShadow: [
      //     BoxShadow(
      //       color: AppColorScheme.onBlack.withOpacity(0.3),
      //       blurRadius: 10,
      //     ),
      //   ],
      // ),
      width: MediaQuery.of(context).size.width,
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
      // width: MediaQuery.of(context).size.width,
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, payState) {
          return Row(
            children: [
              // Expanded(
              //     flex: 3,
              //     child: Container(
              //       height: 48,
              //       padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              //       // color: Colors.red,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             "₹${_getGrandTotal().toStringAsFixed(2)}",
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .subtitle2
              //                 ?.copyWith(
              //                   fontWeight: FontWeight.w600,
              //                   color:
              //                       Theme.of(context).colorScheme.onBackground,
              //                 ),
              //           ),
              //           Text(
              //             "TOTAL",
              //             style: Theme.of(context).textTheme.caption?.copyWith(
              //                   fontWeight: FontWeight.w500,
              //                   color: Theme.of(context)
              //                       .colorScheme
              //                       .onBackground
              //                       .withOpacity(0.8),
              //                 ),
              //           )
              //         ],
              //       ),
              //     )),
              Expanded(
                flex: 5,
                child: InkWell(
                  onTap: payState is PaymentLoading
                      ? null
                      : _submitFormWithoutWallet,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColorScheme.primaryColor,
                    ),
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          payState is PaymentLoading
                              ? translation.of("loading")
                              : "Continue to Payment",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: Theme.of(context).colorScheme.surface,
                              ),
                        ),
                        // Padding(
                        //   padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                        //   child: Icon(
                        //     Icons.arrow_right,
                        //     color: Theme.of(context).colorScheme.surface,
                        //     size: 20,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
          // return InkWell(
          //   onTap: payState is PaymentLoading ? null : _submitFormWithoutWallet,
          //   child: Container(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: AppConstants.defaultPadding / 2,
          //       vertical: AppConstants.defaultPadding / 2,
          //     ),
          //     // height: 48,
          //     decoration: BoxDecoration(
          //       color: Theme.of(context).colorScheme.onTertiary,
          //       borderRadius: BorderRadius.circular(
          //         AppConstants.cornerRadius,
          //       ),
          //     ),
          //     child: Row(
          //       children: [
          //         Expanded(
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "₹${_getGrandTotal().toStringAsFixed(2)}",
          //                 style: Theme.of(context)
          //                     .textTheme
          //                     .subtitle2
          //                     ?.copyWith(
          //                       fontWeight: FontWeight.w600,
          //                       color: Theme.of(context).colorScheme.surface,
          //                     ),
          //               ),
          //               Text(
          //                 "TOTAL",
          //                 style: Theme.of(context).textTheme.caption?.copyWith(
          //                       fontWeight: FontWeight.w500,
          //                       color: Theme.of(context)
          //                           .colorScheme
          //                           .surface
          //                           .withOpacity(0.5),
          //                     ),
          //               )
          //             ],
          //           ),
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.end,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Text(
          //               payState is PaymentLoading
          //                   ? translation.of("loading")
          //                   : "Place Order",
          //               style: Theme.of(context).textTheme.subtitle1?.copyWith(
          //                     fontWeight: FontWeight.w500,
          //                     color: Theme.of(context).colorScheme.surface,
          //                   ),
          //             ),
          //             Icon(
          //               Icons.arrow_right,
          //               color: Theme.of(context).colorScheme.surface,
          //               size: 18,
          //             )
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }

  void _getAddress() {
    BlocProvider.of<AppDataBloc>(context).add(FetchAppData(reFetch: true));
  }

  void _getDeliverShift() {
    BlocProvider.of<GetDeliveryShiftByZoneBloc>(context)
        .add(GetDeliveryShiftByZoneFetchEvent(zone: userData.pinCode));
  }

  void _getTotal() {
    double totalPrice = 0.0;
    double totalTax = 0.0;

    _cartList.forEach((item) {
      final variant = item.variant ??
          item.product?.variants?.firstWhereOrNull(
            (element) => element.id == item.variant?.id,
          );

      final tax = item.product?.tax?.tax?.fold<double>(0.0, (result, element) {
            return result + (element.percentage ?? 0.0);
          }) ??
          0.0;

      final variantPrice = variant?.price ?? 0.0;
      reductionPrice = variant?.reductionPrice ?? 0.0;

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

  double _getGrandTotal() => _totalAmount + _deliveryCharge- reductionPrice;

  void _submitFormWithoutWallet() {
    if (_addressId != null) {
      final _grandTotal = _getGrandTotal();
    bool validate = _formKey.currentState!.validate();
    if(validate==true){
      BlocProvider.of<PaymentBloc>(context).add(
        PaymentInitiateEvent(
          input: InitiatePaymentInput(
            addressId: _addressId,
            invoiceAmount: _grandTotal,
            paymentType: selectedPaymentMethod,
            // PaymentType.PAYMENT_GATEWAY,
            promoDiscount: 0,
            subTotal: _grandTotal,
            promoCode: _promocode.text,
             note: _notesController.text,
            deviceId: app.deviceId,
            customerAudio: File(_path ?? ""),
             deliveryDate: dateController2.text  ,
             deliveryShift:selectedShift?.id ,
          ),
        ),
      );}else{

      }
    }
  }

  void _startRecording() async {
    _getDir();

    _path = "${_appDirectory.path}/recording.m4a";

    setState(() {
      _counter = 0;
    });
    _getTimer();
    await _recorderController.record(path: _path);
  }

  void _refreshWave() {
    if (_isRecording) _recorderController.refresh();
  }

  void _getDir() async {
    _appDirectory = await getApplicationDocumentsDirectory();
    // _path = "${_appDirectory.path}/recording.m4a";
    _isLoading = false;
    setState(() {});
  }

  void _initialiseControllers() {
    _recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 44100;
  }

  _getTimer() async {
    _timer = await Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  String _getTimerText() {
    // Format the timer value to display in 4-digit format (00:00)
    int minutes = _counter ~/ 60;
    int seconds = _counter % 60;
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  Future<void> _checkPermissionStatus() async {
    // Check the permission status for audio recording
    PermissionStatus status = await Permission.microphone.status;
    setState(() {
      _status = status;
    });
    _requestPermission();
  }

  void _requestPermission() async {
    // Request audio recording permission if not granted
    if (_status != PermissionStatus.granted) {
      PermissionStatus status = await Permission.microphone.request();
      setState(() {
        _status = status;
      });
    }
  }

  Widget _scheduledelivery() {
    return Container(
      //   color: Colors.yellow,
      //  height: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Schedule delivery',
            style: TextStyle(
              color: Color(0xFF1D1A20),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          !scheduled
              ? GestureDetector(
                  onTap: _scheduleDeliveryBottomSheet,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) 
                      return "*Required";
                     
                    },
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: 'Select date and time',
                      prefixIcon: Icon(Iconsax.calendar_1),
                      contentPadding:
                          EdgeInsets.only(top: 4, right: 16, bottom: 4),
                      isDense: true,
                      filled: true,
                      fillColor: AppColorScheme.backgroundLight,
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                     borderSide: BorderSide(
                       color: AppColorScheme.errorColorDark
                     )
                      ),
                      
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1D1B1E),
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected date',
                      style: TextStyle(
                        color: AppColorScheme.inActive.withOpacity(0.75),
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Iconsax.calendar_1,
                            color:
                                AppColorScheme.primaryColor.withOpacity(0.75),
                          ),
                          Text(
                            dateController2.text,
                            style: TextStyle(
                              color: Color(0xFF1D1A20),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                              "${selectedShift?.startTime}-${selectedShift?.endTime}",
                              style: TextStyle(
                                color: Color(0xFF1D1A20).withOpacity(0.50),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              )),
                          InkWell(
                            onTap: _scheduleDeliveryBottomSheet,
                            child: Icon(
                              Iconsax.edit_2,
                              color: AppColorScheme.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }

  Widget _promoCode() {
    bool _isPromoCodeLoading = false;
    return BlocListener<PromoCodeBloc, PromoCodeState>(
      listener: (context, state) {
        if (state is PromoCodeApplyLoading) {
          setState(() {
            _isPromoCodeLoading = true;
          });
        }
        if (state is PromoCodeApplyFailed) {
          setState(() {
            _isPromoCodeLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppColorScheme.backgroundLight,
            content: Text(
              translation.of("cart.enter_valid_promocode"),
              style: TextStyle(color: AppColorScheme.errorColorDark),
            ),
          ));
        }
        if (state is PromoCodeApplySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppColorScheme.backgroundLight,
            content: Text(
              translation.of("cart.promo_applied"),
              style: TextStyle(color: AppColorScheme.accentColorLight),
            ),
          ));
        }
      },
      child: TextFormField(
        controller: _promocode,
        decoration: InputDecoration(
          hintText: 'Promo code',
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          isDense: true,
          filled: true,
          fillColor: Color(0xFFF7F2FA),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            borderSide: BorderSide.none,
          ),
          suffixIcon: InkWell(
            onTap: () {
              BlocProvider.of<PromoCodeBloc>(context).add(PromoCodeApplyEvent(
                  promoCode: _promocode.text, deviceId: app.deviceId ?? ""));
              print("deliverycharge${_deliveryCharge}");
              print("adressID:${_addressId}");
            },
            child: Container(
              width: 82,
              height: 42,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: AppColorScheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                  child: _isPromoCodeLoading
                      ? CupertinoActivityIndicator()
                      : Text(
                          'Apply',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColorScheme.onPrimaryLight,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        )),
            ),
          ),
        ),
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: Color(0xFF1D1B1E),
        ),
      ),
    );
  }

  Widget _paymentDetails() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Payment details',
                style: TextStyle(
                  color: Color(0xFF1D1A20),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                  onPressed: _checkOutInfoBottomSheet,
                  icon: Icon(
                    Icons.info_outline_rounded,
                    color: Color(0xFFD9D9D9),
                  ))
            ],
          ),
          Container(
            height: 150.50,
            //color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Grand total',
                      style: TextStyle(
                        color: Color(0xFF1D1A20).withOpacity(0.50),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      // width: 57.17,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'MAD',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 9,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '${_totalAmount}',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(
                        color: Color(0xFF1D1A20).withOpacity(0.50),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      // width: 57.17,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'MAD',
                              style: TextStyle(
                                color: Color(0xFFEB5757),
                                fontSize: 9,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Color(0xFFEB5757),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '${reductionPrice}',
                              style: TextStyle(
                                color: Color(0xFFEB5757),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery charge',
                      style: TextStyle(
                        color: Color(0xFF1D1A20).withOpacity(0.50),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      // width: 57.17,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'MAD',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 9,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '${_deliveryCharge}',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'VAT',
                      style: TextStyle(
                        color: Color(0xFF1D1A20).withOpacity(0.50),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      // width: 57.17,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'MAD',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 9,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '${_taxAmount.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 0.50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payable amount',
                      style: TextStyle(
                        color: Color(0xFF1D1A20).withOpacity(0.50),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      // width: 57.17,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'MAD',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 9,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: '${_getGrandTotal().toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _choosePaymentMethod() {
    return Container(
      //height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose payment method',
            style: TextStyle(
              color: Color(0xFF1D1A20),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          buildPaymentOption(PaymentType.COD, "Cash On Delivery"),
          // buildPaymentOption("credit_card", "Credit card"),
          buildPaymentOption(PaymentType.PAYMENT_GATEWAY, "Online"),
        ],
      ),
    );
  }

  Widget buildPaymentOption(PaymentType value, String label) {
    return Row(
      children: [
        Radio<PaymentType>(
          activeColor: AppColorScheme.primaryColor,
          value: value,
          groupValue: selectedPaymentMethod,
          onChanged: (selectedValue) {
            setState(() {
              selectedPaymentMethod = selectedValue!;
            });
          },
        ),
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF1D1B1E),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  void _scheduleDeliveryBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return BlocBuilder<GetDeliveryShiftByZoneBloc,
                GetDeliveryShiftByZoneState>(
              builder: (context, state) {
                if (state is GetDeliveryShiftByZoneLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is GetDeliveryShiftByZoneLoadedSucess) {
                  final deliveredZone = state.deliveryshift;

                  print(deliveredZone);

                  return Container(
                    width: double.infinity,
                    height: 341,
                    decoration: ShapeDecoration(
                      color: AppColorScheme.onPrimaryLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SizedBox(
                                    child: Icon(Iconsax.arrow_left),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Schedule delivery',
                                  style: TextStyle(
                                    color: AppColorScheme.onBlack,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          // SizedBox(
                          //   height: 6,
                          // ),
                          Container(
                            height: 240,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Select date',
                                        style: TextStyle(
                                          color: AppColorScheme.inActive
                                              .withOpacity(0.75),
                                          fontSize: 11,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 0.13,
                                          letterSpacing: 0.50,
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 4,
                                      // ),
                                      InkWell(
                                        onTap: () {
                                          _showDatePicker(context);
                                        },
                                        child: TextFormField(
                                          validator: FormBuilderValidators.compose(
                                            [FormBuilderValidators.required()]
                                          ),
                                          controller: dateController,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText: "  ",
                                            prefixIcon:
                                                Icon(Iconsax.calendar_1),
                                            contentPadding: EdgeInsets.only(
                                                top: 4, right: 16, bottom: 4),
                                            isDense: true,
                                            filled: true,
                                            fillColor:
                                                AppColorScheme.backgroundLight,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4),
                                                topRight: Radius.circular(4),
                                              ),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            color: AppColorScheme.inActive
                                                .withOpacity(0.75),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Select shift',
                                    style: TextStyle(
                                      color: AppColorScheme.inActive
                                          .withOpacity(0.75),
                                      fontSize: 11,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                              deliveredZone.isNotEmpty?
                                    SizedBox(
                                      height: 58,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: deliveredZone.length,
                                        itemBuilder: (context, index) {
                                          final shift = deliveredZone[index];

                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (shift
                                                        .isAvailableforBooking !=
                                                    null) {
                                                  selectedShift = shift;
                                                  print("Selected Date :${dateController2.text}");
                                                  print(
                                                      selectedShift?.startTime);
                                                  print(selectedShift?.endTime);
                                                  print("selected shift ID : ${selectedShift?.id}");
                                                } else {
                                                  print("Booking is null");
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: 105,
                                              height: 58,
                                              margin: EdgeInsets.only(right: 8),
                                              decoration: BoxDecoration(
                                                color: selectedShift == shift
                                                    ? shift.isAvailableforBooking ==
                                                            true
                                                        ? AppColorScheme
                                                            .primaryColor
                                                        : AppColorScheme
                                                            .backgroundLight
                                                    : AppColorScheme
                                                        .backgroundLight,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${shift.startTime}",
                                                    style: TextStyle(
                                                      color: selectedShift ==
                                                              shift
                                                          ? shift.isAvailableforBooking ==
                                                                  true
                                                              ? AppColorScheme
                                                                  .onPrimaryLight
                                                              : AppColorScheme
                                                                  .inActive
                                                                  .withOpacity(
                                                                      0.75)
                                                          : null,
                                                      fontSize: 10,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    '-',
                                                    style: TextStyle(
                                                      color: selectedShift ==
                                                              shift
                                                          ? shift.isAvailableforBooking ==
                                                                  true
                                                              ? AppColorScheme
                                                                  .onPrimaryLight
                                                              : AppColorScheme
                                                                  .inActive
                                                                  .withOpacity(
                                                                      0.75)
                                                          : null,
                                                      fontSize: 10,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${shift.endTime}",
                                                    style: TextStyle(
                                                      color: selectedShift ==
                                                              shift
                                                          ? shift.isAvailableforBooking ==
                                                                  true
                                                              ? AppColorScheme
                                                                  .onPrimaryLight
                                                              : AppColorScheme
                                                                  .inActive
                                                                  .withOpacity(
                                                                      0.75)
                                                          : null,
                                                      fontSize: 10,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ):Center(
                                            child: Text("Shift Not Available"),
                                          )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      scheduled = true;
                                    });
                                  },
                                  child: Container(
                                      height: 48,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 42),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: AppColorScheme.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Confirm Schedule',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color:
                                                AppColorScheme.onPrimaryLight,
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else if (state is GetDeliveryShiftByZoneLoadedFailed) {
                  return Container(child: Text(state.error));
                }
                return SizedBox();
              },
            );
          });
        });
  }

  void _showDatePicker(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 1),
    );

    if (selectedDate != null) {
      setState(() {
        dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
        dateController2.text = DateFormat('dd MMMM yyyy').format(selectedDate);
      });
    }
  }

  Future<void> _checkOutInfoBottomSheet() async {
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: AppColorScheme.onPrimaryLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SizedBox(
                                child: Icon(Iconsax.arrow_left),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Cart items',
                              style: TextStyle(
                                color: Color(0xFF1D1A20),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 78,
                          height: 26.79,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.72,
                                  color: AppColorScheme.primaryColor),
                              borderRadius: BorderRadius.circular(6.30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.shopping_bag,
                                color: AppColorScheme.primaryColor,
                                size: 14,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Add',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColorScheme.primaryColor,
                                  fontSize: 12.61,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
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
                ],
              ),
            ),
          );
        });
  }
}
