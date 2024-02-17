
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../base_module/domain/entity/translation.dart';
import '../../../../base_module/presentation/component/images/custom_image_view.dart';
import '../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../base_module/presentation/util/exit_popup_helper.dart';
import '../../../../catalogue_module/presentation/feature/details/blocs/delivery_check_cubit/delivery_check_cubit.dart';
import '../../../../catalogue_module/presentation/feature/details/blocs/loctaion_check_cubit/location_check_cubit.dart';
import '../../../../globals.dart';
import '../../../../user_module/domain/user_data.dart';
import '../../../../user_module/presentation/components/manage_address_bottom_sheet.dart';
import 'home_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _deliveryCheckCubit = DeliveryCheckCubit();
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();

    if (userData.defaultShippingAddress != null) {
      _navigateToHomeScreen();
    } else {
      BlocProvider.of<LocationCheckCubit>(context).getLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          return true;
        } else {
          return ExitPopupHelper.showExitPopup(context);
        }
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<LocationCheckCubit, LocationCheckState>(
            listener: (context, state) {
              if (state is LocationCheckSuccess) {
                _deliveryCheckCubit.checkPinCode(
                  pincode: state.locationDetails.pinCode,
                  locationDetails: state.locationDetails,
                );
              } else if (state is LocationCheckFailed) {
                showErrorToast(state.message);
                _navigateToAddressScreen();

                setState(() {
                  _isLoading = false;
                  _errorMessage = null;
                });
              }
            },
          ),
          BlocListener<DeliveryCheckCubit, DeliveryCheckState>(
            bloc: _deliveryCheckCubit,
            listener: (context, state) {
              if (state is DeliveryCheckSuccess) {
                _navigateToAddressScreen(state.locationDetails);

                setState(() {
                  _isLoading = false;
                  _errorMessage = null;
                });
              } else if (state is DeliveryCheckFailed) {
                setState(() {
                  _isLoading = false;
                  _errorMessage =
                      translation.of("not_available_current_location");
                });
              }
            },
          ),
        ],
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_isLoading)
                  CircularProgressIndicator()
                else ...[
                  if (_errorMessage != null) ...[
                    SizedBox(
                      height: AppConstants.defaultPadding,
                    ),
                    _noLocationWidget(),
                    // Text(
                    //   "Not available",
                    //   style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.w400,
                    //         color: Theme.of(context).colorScheme.onBackground,
                    //       ),
                    //   textAlign: TextAlign.center,
                    // ),
                    // SizedBox(height: 15),
                    // Text(
                    //   _errorMessage ?? "",
                    //   style: Theme.of(context).textTheme.caption?.copyWith(
                    //         fontWeight: FontWeight.w400,
                    //         color: Theme.of(context).colorScheme.onBackground,
                    //       ),
                    //   textAlign: TextAlign.center,
                    // ),
                    SizedBox(height: 10),
                  ],
                  InkWell(
                    onTap: _navigateToAddressScreen,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColorScheme.primaryColor,
                        borderRadius: BorderRadius.circular(
                          AppConstants.cornerRadius / 2,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            AppConstants.defaultPadding / 3,
                          ),
                          child: Text(
                            "Set location manually",
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColorScheme.onPrimaryLight,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToHomeScreen() {
    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => HomeScreen(),
      ));
    });
  }

  void _navigateToAddressScreen([LocationDetails? locationDetails]) {
    showBottomSheetPopup(
      builder: (context) {
        return ManageAddressBottomSheet(
          isFromLocationScreen: true,
          locationDetails: locationDetails,
        );
      },
    );

    // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //   builder: (_) => ManageAddressScreen(
    //     isFromLocationScreen: true,
    //     locationDetails: locationDetails,
    //   ),
    // ));
  }

  Widget _noLocationWidget() {
    return Column(
      children: [
        CustomImageView(
          height: 120,
          width: 120,
          imagePath: ThemeAssets.lumiereLPng,
          // svgPath: ThemeAssets.lumiereLSvg,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: AppConstants.defaultPadding / 2,
        ),
        Text(
          translation.of('services_not_expanded'),
          // "Not available",
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onBackground,
              ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Text(
          translation.of('stay_tuned'),
          style: Theme.of(context).textTheme.caption?.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onBackground,
              ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppConstants.defaultPadding / 2)
      ],
    );
  }
}
