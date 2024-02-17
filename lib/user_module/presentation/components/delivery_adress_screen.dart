import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lumiereorganics_app/user_module/presentation/feature/profile/screens/adresses_page.dart';
import '../../../app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import '../../../base_module/domain/entity/app.dart';
import '../../../base_module/domain/entity/color_scheme.dart';
import '../../../base_module/domain/entity/translation.dart';
import '../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../base_module/presentation/component/indicator/loading_or_error_indicator.dart';
import '../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../../catalogue_module/presentation/feature/details/blocs/loctaion_check_cubit/location_check_cubit.dart';
import '../../../home/feature/home/screens/home_screen.dart';
import '../../data/entity/input_models/shipping_input.dart';
import '../feature/choose_loction/screen/map_location_picker_screen.dart';
import '../feature/choose_loction/widgets/address_list_card.dart';
import '../feature/profile/blocs/profile/profile_bloc.dart';
import 'package:dotted_border/dotted_border.dart';

import 'delivery_adress_card_list.dart';

class DeliveryAdressScreen extends StatefulWidget {
  final bool isFromLocationScreen;
  final LocationDetails? locationDetails;

  const DeliveryAdressScreen({
    Key? key,
    this.isFromLocationScreen = false,
    this.locationDetails,
  }) : super(key: key);

  @override
  _DeliveryAdressScreenState createState() => _DeliveryAdressScreenState();
}

class _DeliveryAdressScreenState extends State<DeliveryAdressScreen> {
  @override
  void initState() {
    super.initState();
    _getAppData();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileEditAddressSuccess) {
              _getAppData();

              if (widget.isFromLocationScreen &&
                  state.shippingAddress.isDefault == true) {
                _navigateToHomeScreen();
              }
            } else if (state is ProfileEditAddressFailed) {
              showErrorFlash(
                context: context,
                message: "Failed to update address",
              );
            } else if (state is ProfileDeleteAddressSuccess) {
              _getAppData();

              showSuccessFlash(
                context: context,
                message: translation.of("user.delete_address_success"),
              );
            } else if (state is ProfileDeleteAddressFailed) {
              showErrorFlash(
                context: context,
                message: translation.of("user.delete_address_failed"),
              );
            }
          },
        ),
        BlocListener<LocationCheckCubit, LocationCheckState>(
          listener: (context, state) {
            if (state is LocationCheckSuccess) {}
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColorScheme.surfaceColorLight,
        appBar: SimpleAppBar(
          title: "Delivery Address",
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(
              Duration(milliseconds: 500),
              _getAppData,
            );
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppConstants.defaultPadding / 1.5,
                horizontal: AppConstants.defaultPadding / 1.5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Text(
                  //   translation.of("address_details"),
                  //   style: TextStyle(
                  //     color: Color(0xFF1D1B1E),
                  //     fontSize: 16,
                  //     fontFamily: 'Poppins',
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 0.16,
                  // ),
                  // Divider(),
                  // SizedBox(
                  //   height: 0.16,
                  // ),
                  // Container(
                  //   height: 48,
                  //   width: double.maxFinite,
                  //   padding: EdgeInsetsDirectional.fromSTEB(
                  //     AppConstants.defaultPadding / 2,
                  //     0,
                  //     0,
                  //     0,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Theme.of(context).colorScheme.surface,
                  //     borderRadius: BorderRadius.circular(
                  //       AppConstants.cornerRadius,
                  //     ),
                  //   ),
                  //   child: InkWell(
                  //     onTap: _addAddress,
                  //     child: Row(
                  //       children: [
                  //         Icon(
                  //           Icons.add,
                  //           color: Theme.of(context).colorScheme.onTertiary,
                  //         ),
                  //         SizedBox(width: AppConstants.defaultPadding / 8),
                  //         Text(
                  //           "Add new address",
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .subtitle2
                  //               ?.copyWith(
                  //                 fontWeight: FontWeight.w500,
                  //                 color: Theme.of(context).colorScheme.onTertiary,
                  //               ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // AppPadding(multipliedBy: 0.6),
                  // Text(
                  //   "Your saved address",
                  //   style: Theme.of(context).textTheme.caption?.copyWith(
                  //         color: Theme.of(context)
                  //             .colorScheme
                  //             .onBackground
                  //             .withOpacity(0.5),
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  // ),
                  // AppPadding(multipliedBy: 0.4),
                  BlocConsumer<AppDataBloc, AppDataState>(
                    listener: (context, state) {
                      if (state is FetchAppDataSuccess) {
                        if (state.appData.addressDetails?.isEmpty == true &&
                            widget.isFromLocationScreen) {
                          // _addAddress;
                          EditAddressScreen();
                        }
                      }
                    },
                    builder: (context, state) {
                      if (state is FetchAppDataSuccess) {
                        final appData = state.appData;
                        final addresses = appData.addressDetails ?? [];

                        if (addresses.isNotEmpty) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: addresses.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final addressData = addresses[index];

                              return Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        if (addressData.isDefault != true ||
                                            widget.isFromLocationScreen) {
                                          BlocProvider.of<ProfileBloc>(context)
                                              .add(
                                            ProfileEditAddress(
                                              customerId: appData.id!,
                                              addressId: addressData.id!,
                                              shippingInput: ShippingInput(
                                                type: addressData.type,
                                                phone: addressData.phone,
                                                email: addressData.email,
                                                address: addressData.address,
                                                firstName:
                                                    addressData.firstName,
                                                house: addressData.house,
                                                pincode: addressData.pincode,
                                                landmark: addressData.landmark,
                                                lat: double.tryParse(
                                                  addressData.lat ?? "",
                                                ),
                                                lng: double.tryParse(
                                                  addressData.lng ?? "",
                                                ),
                                                isDefault: true,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      child: DeliveryAdressListCard(
                                        addressData: addressData,
                                        appData: appData,
                                        isSelected: true,
                                      )
                                      //  AddressListCard(
                                      //   addressData: addressData,
                                      //   appData: appData,
                                      // ),
                                      ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 16,
                                  )
                                ],
                              );
                            },
                          );
                        }

                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 100),
                            child: Text(
                              "No addresses added",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontWeight: FontWeight.w400,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }

                      return LoadingOrErrorIndicator(
                        padding: const EdgeInsets.only(
                          top: AppConstants.defaultPadding * 2,
                          bottom: AppConstants.defaultPadding,
                        ),
                        isLoading: state is! FetchAppDataFailed,
                        error: state.errorMessage,
                        onRetry: _getAppData,
                      );
                    },
                  ),

                  DottedBorder(
                    radius: Radius.circular(10),
                    color: AppColorScheme.primaryColor,
                    strokeWidth: 1.5,
                    borderType: BorderType.RRect,
                    dashPattern: [8, 4],
                    child: Container(
                      height: 48,
                      width: double.maxFinite,
                      padding: EdgeInsetsDirectional.fromSTEB(
                        AppConstants.defaultPadding / 2,
                        0,
                        0,
                        0,
                      ),
                      decoration: BoxDecoration(
                        color: AppColorScheme.scaffoldBackgroundColorLight,
                        borderRadius: BorderRadius.circular(10
                            //AppConstants.cornerRadius,
                            ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditAddressScreen(),
                              ));
                        },
                        // _addAddress,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColorScheme.primaryColor,
                            ),
                            SizedBox(width: AppConstants.defaultPadding / 8),
                            Text(
                              "Add new address",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    color: AppColorScheme.primaryColor,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
            child: InkWell(
              onTap: () {
                
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
                    'Apply',
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
            )),
      ),
    );
  }

  void _getAppData() {
    BlocProvider.of<AppDataBloc>(context).add(FetchAppData(reFetch: true));
  }

  _getCurrentLocation() {
    BlocProvider.of<LocationCheckCubit>(context).getLocation();
  }

  void _addAddress() {
    _getCurrentLocation();
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (_) => MapLocationPicker(
          address: app.address,
          initialPosition: widget.locationDetails != null
              ? LatLng(
                  widget.locationDetails!.latitude,
                  widget.locationDetails!.longitude,
                )
              : null,
          // pickedLocation: app.pickedLocation,
          selectTitle: translation.of('customer.delivery_location'),
          selectText: 'Confirm location & proceed',
        ),
      ),
    )
        .then((value) {
      if (value == true && widget.isFromLocationScreen) {
        _navigateToHomeScreen();
      }
    });
  }

  void _navigateToHomeScreen() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => HomeScreen()),
      (route) => false,
    );
  }
}
