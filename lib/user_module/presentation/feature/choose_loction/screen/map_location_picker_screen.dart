import 'dart:async';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:location/location.dart' as location;
import 'package:location/location.dart';
import 'package:places_service/places_service.dart';

import '../../../../../app_settings_module/domain/entity/models/app_data.dart';
import '../../../../../app_settings_module/domain/entity/models/shipping_address.dart';
import '../../../../../app_settings_module/domain/entity/models/type.dart';
import '../../../../../app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import '../../../../../base_module/domain/entity/app.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../../base_module/presentation/component/buttons/custom_close_button.dart';
import '../../../../../base_module/presentation/component/images/custom_image_view.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../catalogue_module/presentation/feature/details/blocs/delivery_check_cubit/delivery_check_cubit.dart';
import '../../../../../catalogue_module/presentation/feature/details/blocs/loctaion_check_cubit/location_check_cubit.dart';
import '../../../../../globals.dart';
import '../../../../../main.dart';
import '../../../../data/entity/input_models/shipping_input.dart';
import '../../../../domain/entity/authentication.dart';
import '../../../../domain/entity/models/address_type_model.dart';
import '../../../components/custom_place_picker.dart';
import '../../profile/blocs/profile/profile_bloc.dart';

class MapLocationPicker extends StatefulWidget {
  final AppData? customerInfo;
  final ShippingAddress? shippingAddress;
  final LatLng? initialPosition;

  // final PickedLocation? pickedLocation;
  // final PickResult? pickedLocation;
  final String? address;
  final Geometry? geometry;
  final String? selectTitle;
  final String? selectText;

  const MapLocationPicker({
    Key? key,
    this.customerInfo,
    this.shippingAddress,
    this.initialPosition,
    this.address,
    this.geometry,
    // required this.pickedLocation,
    this.selectTitle,
    this.selectText,
  }) : super(key: key);

  @override
  _MapLocationPickerState createState() => _MapLocationPickerState();
}

class _MapLocationPickerState extends State<MapLocationPicker> {
  final _deliveryCheckCubit = DeliveryCheckCubit();

  GoogleMapController? _googleMapController;

  // LatLng _initialPosition = LatLng(12.992110211467821, 77.66155364664263);
  LatLng _initialPosition = LatLng(0.0, 0.0);

  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  final _location = location.Location();
  PickResult? _selectedPlace;
  String _postalCode = '';
  String _city = '';
  final _placesService = PlacesService()..initialize(apiKey: kGoogleApiKey);
  bool _isDefault = true;

  List<AddressTypeModel> _addressTypeList = [
    AddressTypeModel(addressType: "Home", imageUrl: ThemeAssets.greenHome),
    AddressTypeModel(addressType: "Work", imageUrl: ThemeAssets.work),
    AddressTypeModel(addressType: "Hotel", imageUrl: ThemeAssets.hotel),
    AddressTypeModel(addressType: "Other", imageUrl: ThemeAssets.location),
  ];

  // var _selectedLocationSearchingState = SearchingState.Idle;
  String? _formattedAddress;
  String? _area;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
        // borderSide: BorderSide(
        //   color: AppColorScheme.textFieldBorderColor,
        //   width: 1,
        // ),
      );

  @override
  void initState() {
    super.initState();

    _isDefault = widget.shippingAddress?.isDefault ?? true;
    final lat = double.tryParse(widget.shippingAddress?.lat ?? "");
    final lng = double.tryParse(widget.shippingAddress?.lng ?? "");

    if (widget.initialPosition != null) {
      _initialPosition = widget.initialPosition!;
    } else if (lat != null && lng != null) {
      _initialPosition = LatLng(lat, lng);
    } else {
      // _getCurrentLocation();
      // _gotoCurrentLocation();
    }

    // locationPermission.toString();
    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.secondaryBackgroundColor,
      appBar: SimpleAppBar(
        title: widget.shippingAddress?.id != null
            ? "Edit address"
            : "Select  your Location",
      ),
      body: MultiBlocListener(
        listeners: [
          // BlocListener<ManageLocationBloc, ManageLocationState>(
          //   listener: (context, state) {
          //     if (state is ChangeLocationSuccess) {
          //       // Navigator.pop(context, state.pickedLocation);
          //
          //     }
          //   },
          // ),
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is UpdateProfileInProgress) {
                setState(() {
                  _isLoading = true;
                });
              } else if (state is ProfileCreateAddressSuccess ||
                  state is ProfileEditAddressSuccess) {
                // setState(() {
                //   _isLoading = false;
                // });

                _getAppData();
                Navigator.pop(context);
                Navigator.pop(context, _isDefault == true);
              } else {
                setState(() {
                  _isLoading = false;
                });
              }
            },
          ),
        ],
        child: CustomPlacePicker(
          // resizeToAvoidBottomInset: false,
          autocompleteRadius: 12,
          autocompleteLanguage: "en",
          autocompleteComponents: [Component("country", "in")],
          // only works in page mode, less flickery
          apiKey: Platform.isAndroid
              ? AppConstants.gmapsApiKey
              : AppConstants.gmapsApiKey,
          hintText: "Search area, street name, etc",
          searchingText: "Please wait ...",
          selectText: "Select place",
          outsideOfPickAreaText: "Place not in area",

          // introModalWidgetBuilder: (BuildContext context, Function? function) {
          //   return Container(
          //     child: Text("aaaaaaa"),
          //   );
          // },
          pinBuilder: (BuildContext context, PinState pinState) {
            return CustomImageView(
              height: 27,
              width: 18,
              svgPath: ThemeAssets.locationPin,
            );
          },

          initialPosition: _initialPosition,

          useCurrentLocation: false,
          selectInitialPosition: true,
          usePinPointingSearch: true,
          usePlaceDetailSearch: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          automaticallyImplyAppBarLeading: false,
          enableMapTypeButton: false,
          enableMyLocationButton: false,
          onMapCreated: (controller) async {
            _moveToInitialPosition();
            _googleMapController = controller;
          },

          onPlacePicked: (PickResult result) async {
            final detail =
                await _placesService.getPlaceDetails(result.placeId ?? "");

            setState(() {
              _selectedPlace = result;
              _postalCode = detail.zip ?? "";
              _city = detail.city ?? '';
            });
                    },

          onMapTypeChanged: (MapType mapType) {},

          selectedPlaceWidgetBuilder:
              (_, selectedPlace, state, isSearchBarFocused) {
            // _test(selectedPlace!);
            // print(selectedPlace);
            debugPrint(
              "state: $state, isSearchBarFocused: $isSearchBarFocused",
            );

            final addressInfo = _getAddressInfo(selectedPlace);
            final list = addressInfo["address"]?.split(", ");
            final street = list?.firstOrNull?.trim();
            final address = list?.skip(1).join(", ") ??
                selectedPlace?.formattedAddress ??
                "";

            return isSearchBarFocused
                ? Container()
                : FloatingCard(
                    bottomPosition: 0.0,
                    elevation: 10,
                    // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                    leftPosition: 0.0,
                    rightPosition: 0.0,
                    width: 500,
                    color: Colors.transparent,
                    // borderRadius: BorderRadius.circular(12.0),
                    child: Column(
                      children: [
                        BlocConsumer<LocationCheckCubit, LocationCheckState>(
                          listener: (context, state) {
                            if (state is LocationCheckSuccess) {
                              _initialPosition = LatLng(
                                state.locationDetails.latitude,
                                state.locationDetails.longitude,
                              );

                              _moveToInitialPosition();
                            } else if (state is LocationCheckFailed) {
                              showErrorToast(state.message);
                            }
                          },
                          builder: (context, state) {
                            final isLoading = state is LocationCheckInProgress;

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (isLoading) return;
                                    BlocProvider.of<LocationCheckCubit>(context)
                                        .getLocation();
                                  },
                                  child: Container(
                                    width: 180,
                                    height: 32,
                                    // padding: EdgeInsets.symmetric(
                                    //   horizontal: 12,
                                    //   vertical: 8,
                                    // ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColorScheme.primaryColor,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        AppConstants.cornerRadius / 3,
                                      ),
                                      color: AppColorScheme.onPrimaryLight,
                                    ),
                                    child: isLoading
                                        ? CupertinoActivityIndicator()
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.my_location,
                                                  size: 16,
                                                  color: AppColorScheme
                                                      .primaryColor),
                                              SizedBox(width: 4),
                                              Text(
                                                "Go to current location",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColorScheme
                                                          .primaryColor,
                                                    ),
                                              ),
                                            ],
                                          ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.defaultPadding / 2,
                            vertical: AppConstants.defaultPadding / 2,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            boxShadow: [
                              BoxShadow(
                                color: AppColorScheme.onBlack.withOpacity(0.2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivering your order to",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                              ),
                              const AppPadding(dividedBy: 3),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppConstants.defaultPadding / 2,
                                  vertical: AppConstants.defaultPadding / 3,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    AppConstants.cornerRadius / 2.5,
                                  ),
                                  border: Border.all(
                                    color:
                                        AppColorScheme.borderColor.withOpacity(
                                      0.25,
                                    ),
                                  ),
                                  color: AppColorScheme.placeCardColor,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      ThemeAssets.locationPin,
                                      height: 18,
                                      width: 12,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                        width:
                                            AppConstants.defaultPadding / 2.5),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (street != null)
                                            Text(
                                              street,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onBackground,
                                                  ),
                                            ),
                                          Text(
                                            address,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption
                                                ?.copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // InkWell(
                                    //   onTap: () {},
                                    //   child: Container(
                                    //     padding: EdgeInsets.symmetric(
                                    //       vertical: 3,
                                    //       horizontal: 5,
                                    //     ),
                                    //     decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(
                                    //           AppConstants.cornerRadius / 4),
                                    //       border: Border.all(
                                    //           color: Theme.of(context)
                                    //               .colorScheme
                                    //               .onBackground
                                    //               .withOpacity(0.25)),
                                    //     ),
                                    //     child: Text("change",
                                    //         style: Theme.of(context)
                                    //             .textTheme
                                    //             .bodySmall
                                    //             ?.copyWith(
                                    //                 fontSize: 8,
                                    //                 fontWeight:
                                    //                     FontWeight.w500)),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              // Text("!!!!!!!!!!!!!!!"),
                              // Text(selectedPlace?.addressComponents
                              //         ?.map((e) =>
                              //             e.types.join("|") + ": " + e.longName)
                              //         .join(", ") ??
                              //     ""),
                              // Text("!!!!!!!!!!!!!!!"),
                              const AppPadding(dividedBy: 2),
                              _confirmButton(selectedPlace),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
    // )
    // ;
  }

  Widget _confirmButton(PickResult? selectedPlace) {
    return BlocConsumer<DeliveryCheckCubit, DeliveryCheckState>(
      bloc: _deliveryCheckCubit,
      listener: (context, state) {
        if (state is DeliveryCheckSuccess && !state.isByEmitter) {
          _addAddress(context);
        } else if (state is DeliveryCheckFailed) {
          showErrorToast(state.message);
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onTertiary,
              ),
              elevation: MaterialStateProperty.all(0),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding,
                  vertical: AppConstants.defaultPadding / 3.5,
                ),
              ),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      AppConstants.cornerRadius / 2,
                    ),
                  ),
                ),
              ),
            ),
            onPressed: () async {
              if (selectedPlace != null) {
                await _getPostalCodeAndCity(selectedPlace);

                await app.setLocation(
                  selectedPlace.geometry,
                  selectedPlace.adrAddress,
                );

                _deliveryCheckCubit.checkPinCode(pincode: _postalCode);

                // BlocProvider.of<ManageLocationBloc>(context).add(
                //   ChangeLocation(
                //       geometry: selectedPlace.geometry ?? app.geometry,
                //       address: selectedPlace.formattedAddress ?? app.address
                //       // pickedLocation: selectedPlace ?? app.pickedLocation,
                //       ),
                // );

                // _addAddress(context);

                // Navigator.pop(context, selectedPlace);
              } else {}
            },
            child: Center(
              child: state is DeliveryCheckLoading
                  ? CupertinoActivityIndicator(
                      color: AppColorScheme.onPrimaryLight,
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.shippingAddress?.id != null
                              ? "Update the pin & proceed"
                              : "Confirm location & proceed",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.background,
                              ),
                        ),
                        Icon(
                          Icons.arrow_right,
                          size: 24,
                        )
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  void _addAddress(BuildContext context) {
    showBottomSheetPopup(
      builder: (context) {
        return SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomCloseButton(),
                AppPadding(multipliedBy: 0.6),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.7,
                  // padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppConstants.cornerRadius),
                      topLeft: Radius.circular(AppConstants.cornerRadius),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          widget.shippingAddress?.id != null
                              ? "Edit address details"
                              : 'Enter complete address',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Column(
                          children: [
                            AppPadding(multipliedBy: 0.2),
                            // Text('Save address as *'),
                            // AppPadding(multipliedBy: 0.3),
                            // Container(
                            //   height: 30,
                            //   width: double.maxFinite,
                            //   child: ListView.builder(
                            //       padding: EdgeInsets.zero,
                            //       scrollDirection: Axis.horizontal,
                            //       shrinkWrap: true,
                            //       itemCount: _addressTypeList.length,
                            //       itemBuilder: (context, index) {
                            //         return Padding(
                            //           padding: EdgeInsets.symmetric(
                            //             horizontal:
                            //                 AppConstants.defaultPadding / 4,
                            //           ),
                            //           child: Container(
                            //             padding: EdgeInsets.symmetric(
                            //                 horizontal:
                            //                     AppConstants.defaultPadding / 4),
                            //             decoration: BoxDecoration(
                            //                 borderRadius: BorderRadius.circular(
                            //                     AppConstants.cornerRadius / 2),
                            //                 border: Border.all(
                            //                     color: Theme.of(context)
                            //                         .colorScheme
                            //                         .onTertiary)),
                            //             child: Row(
                            //               children: [
                            //                 SvgPicture.asset(
                            //                   _addressTypeList[index].imageUrl ??
                            //                       "",
                            //                   height: 16,
                            //                   width: 16,
                            //                   fit: BoxFit.cover,
                            //                 ),
                            //                 SizedBox(
                            //                   width: 5,
                            //                 ),
                            //                 Text(_addressTypeList[index]
                            //                         .addressType ??
                            //                     "")
                            //               ],
                            //             ),
                            //           ),
                            //         );
                            //       }),
                            // ),
                            AppPadding(multipliedBy: 0.6),
                            _nameTextField(context),
                            AppPadding(multipliedBy: 0.6),
                            _houseTextField(context),
                            AppPadding(multipliedBy: 0.6),
                            _pinTextField(context),
                            AppPadding(multipliedBy: 0.6),
                            _areaTextField(context),
                            AppPadding(multipliedBy: 0.1),
                            _checkboxField(),
                            AppPadding(multipliedBy: 0.1),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).colorScheme.onTertiary,
                                  ),
                                  elevation: MaterialStateProperty.all(0),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                      horizontal: AppConstants.defaultPadding,
                                      vertical: AppConstants.defaultPadding / 2,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          AppConstants.cornerRadius / 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    _addOrUpdateAddressData();
                                  }
                                },
                                child: _isLoading == true
                                    ? CupertinoActivityIndicator(
                                        color: AppColorScheme.onPrimaryLight,
                                      )
                                    : Text(
                                        "Save address",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                            ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _requestPermission() async {
    final permissionStatus = await _location.hasPermission();

    if (permissionStatus == PermissionStatus.denied ||
        permissionStatus == PermissionStatus.deniedForever) {
      if (mounted) {
        showDialog(
          context: context,
          // barrierDismissible: false,
          builder: (_) {
            return AlertDialog(
              insetPadding: const EdgeInsets.all(AppConstants.defaultPadding),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
              ),
              title: Text(
                "Permission request",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
              ),
              content: Text(
                "You need to allow location permission to access your current location",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              actionsAlignment: MainAxisAlignment.spaceAround,
              actions: [
                OutlinedButton(
                  style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 45),
                        ),
                        // side: MaterialStateProperty.all(
                        //   BorderSide(
                        //       color: Theme.of(context).colorScheme.error),
                        // ),
                        // backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    translation.of('close'),
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
                ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 45),
                        ),
                      ),
                  onPressed: () async {
                    await AppSettings.openAppSettings();
                    if (mounted) Navigator.pop(context);
                  },
                  child: Text(
                    "Allow",
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: Theme.of(context).colorScheme.background,
                        ),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  Widget _nameTextField(BuildContext context) {
    return FormBuilderTextField(
      name: 'name',
      initialValue:
          widget.shippingAddress?.firstName ?? authentication.user?.name,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: InputDecoration(
        labelText: "Name",
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        disabledBorder: _border,
        errorBorder: _border.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: _border.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      obscureText: false,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.disabled,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      onChanged: (value) {
        // _formKey.currentState?.fields['password']?.validate();
      },
    );
  }

  Widget _houseTextField(BuildContext context) {
    return FormBuilderTextField(
      name: 'house',
      initialValue: widget.shippingAddress?.house,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: InputDecoration(
        labelText: "Flat / House no / Building name *",
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        disabledBorder: _border,
        errorBorder: _border.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: _border.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      obscureText: false,
      autovalidateMode: AutovalidateMode.disabled,
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      onChanged: (value) {},
    );
  }

  Widget _pinTextField(BuildContext context) {
    return FormBuilderTextField(
      name: 'pin',
      initialValue: _postalCode,
      enabled: false,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: InputDecoration(
        labelText: "Pin",
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        disabledBorder: _border,
        errorBorder: _border.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: _border.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      obscureText: false,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: (value) {
        // _formKey.currentState?.fields['password']?.validate();
      },
    );
  }

  Widget _areaTextField(BuildContext context) {
    final addressInfo = _getAddressInfo(_selectedPlace);
    final area = addressInfo["address"] ?? "";

    return FormBuilderTextField(
      initialValue: area.isNotEmpty ? area : _city,
      // selectedPlace?.formattedAddress,
      name: 'area',
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: InputDecoration(
        labelText: "Area / Sector / Locality *",
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        disabledBorder: _border,
        errorBorder: _border.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: _border.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      obscureText: false,
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: (value) {
        // _formKey.currentState?.fields['password']?.validate();
      },
    );
  }

  Widget _checkboxField() {
    return FormBuilderCheckbox(
      title: Text(
        translation.of("user.set_this_address"),
        style: Theme.of(context).textTheme.caption?.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      name: 'set_as_default_address',
      initialValue: _isDefault,
      // initialValue: _args.address?.isDefault ?? _isDefault,
      onChanged: (value) {
        setState(() {
          _isDefault = value ?? false;
        });
      },
      activeColor: Theme.of(context).colorScheme.primary,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        filled: false,
      ),
    );
  }

  void _addOrUpdateAddressData() {
    final shippingInput = ShippingInput(
      type: Type.HOME,
      phone: authentication.user?.phone,
      email: authentication.user?.email,
      address: _selectedPlace?.formattedAddress,
      firstName: _formKey.currentState?.fields['name']?.value,
      house: _formKey.currentState?.fields['house']?.value,
      pincode: _formKey.currentState?.fields['pin']?.value,
      landmark: _formKey.currentState?.fields['area']?.value,
      lat: _selectedPlace?.geometry?.location.lat,
      lng: _selectedPlace?.geometry?.location.lng,
      isDefault: _isDefault,
    );

    if (widget.shippingAddress?.id != null) {
      BlocProvider.of<ProfileBloc>(context).add(
        ProfileEditAddress(
          customerId: widget.customerInfo!.id!,
          addressId: widget.shippingAddress!.id!,
          shippingInput: shippingInput,
        ),
      );
    } else {
      BlocProvider.of<ProfileBloc>(context).add(
        ProfileCreateAddress(shippingInput: shippingInput),
      );
    }
  }

  Map<String, String?> _getAddressInfo(PickResult? result) {
    final street1 = result?.addressComponents
        ?.firstWhereOrNull((e1) => e1.types.contains("sublocality_level_3"))
        ?.longName
        .trim();

    final street2 = result?.addressComponents
        ?.firstWhereOrNull((e1) => e1.types.contains("sublocality_level_2"))
        ?.longName
        .trim();

    final street3 = result?.addressComponents
        ?.firstWhereOrNull((e1) => e1.types.contains("sublocality_level_1"))
        ?.longName
        .trim();

    final locality = result?.addressComponents
        ?.firstWhereOrNull((e1) => e1.types.contains("locality"))
        ?.longName
        .trim();

    final address = [street1, street2, street3, locality]
        .where((e) => e?.isNotEmpty == true)
        .join(", ");

    return {"address": address.isNotEmpty ? address : null};
  }

  void _gotoCurrentLocation() {
    Geolocator.getCurrentPosition().then((position) {
      _initialPosition = LatLng(position.latitude, position.longitude);
      _moveToInitialPosition();
    });
  }

  void _moveToInitialPosition() {
    _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: _initialPosition,
        zoom: 18,
      ),
    ));
  }

  bool _isHtmlString(String input) {
    RegExp htmlTagRegex = RegExp(r"<[^>]*>");

    return htmlTagRegex.hasMatch(input);
  }

  void _getAppData() {
    BlocProvider.of<AppDataBloc>(context).add(FetchAppData(reFetch: true));
  }

  Future<void> _getPostalCodeAndCity(PickResult result) async {
    final detail = await _placesService.getPlaceDetails(result.placeId ?? "");

    // setState(() {
    _selectedPlace = result;
    _postalCode = detail.zip ?? "";
    _city = detail.streetLong ?? detail.city ?? '';
    // });
  }

  _getCurrentLocation() {
    BlocProvider.of<LocationCheckCubit>(context).getLocation();
  }
}
