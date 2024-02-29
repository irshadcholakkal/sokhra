import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../app_settings_module/domain/entity/models/app_data.dart';
import '../../../../../app_settings_module/domain/entity/models/shipping_address.dart';
import '../../../../../app_settings_module/domain/entity/models/type.dart';
import '../../../../../app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/component/text_form_field/custom_drop_down.dart';
import '../../../../../base_module/presentation/component/text_form_field/custom_text_form_filed.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../base_module/presentation/util/string_modifiers.dart';
import '../../../../../base_module/presentation/util/validate.dart';
import '../../../../../catalogue_module/domain/models/zone.dart';
import '../../../../../home/feature/home/screens/home_screen.dart';
import '../../../../data/entity/input_models/shipping_input.dart';
import '../../../../domain/entity/authentication.dart';
import '../../../../domain/user_data.dart';
import '../blocs/get_all_zone/get_all_available_zone_bloc.dart';
import '../blocs/profile/profile_bloc.dart';

class AddAddressScreen extends StatefulWidget {
  final ShippingAddress? addressData;
  final AppData? appData;
  final bool isDefaultEnabled;
  final bool isCreateAccount;

  const AddAddressScreen({
    Key? key,
    this.addressData,
    this.appData,
    this.isDefaultEnabled = true,
    this.isCreateAccount = true,
  }) : super(key: key);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  bool isEdit = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isDefault = true;
  Type? _val;
  String buildingname = '';
  String streetname = '';
  String neighborname = '';
  String floorno = '';
  String flatno = '';
  String additionalinfo = '';
  String phoneno = '';
  dynamic selectedZoneId = "";
  Type? selectedAddressType;

  // late EditAddressArguments _args;

  OutlineInputBorder get _focusedborder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Color(0xFFCBC4CF),
          width: 1,
        ),
      );

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadiusMin),
        borderSide: BorderSide(
          color: AppColorScheme.backgroundLight,
        ),
      );

  TextStyle? get _hintStyle => Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.45),
        fontSize: 14,
        fontFamily: AppConstants.defaultFont,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      );
  TextStyle? get _labelTextStyle =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColorScheme.grey,
            fontSize: 11,
            fontFamily: AppConstants.defaultFont,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          );

  final TextEditingController _buildingNoController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _neighbourController = TextEditingController();
  final TextEditingController _addressTypeController = TextEditingController();
  final TextEditingController _floorNoController = TextEditingController();
  final TextEditingController _flatNoController = TextEditingController();
  final TextEditingController _additionalInfoController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();

  @override
  void dispose() {
    _buildingNoController.dispose();
    _streetController.dispose();
    _neighbourController.dispose();
    _additionalInfoController.dispose();
    _addressTypeController.dispose();
    _floorNoController.dispose();
    _flatNoController.dispose();
    _phoneController.dispose();
    _areaController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getAllAvailableZones();
  }

  @override
  Widget build(BuildContext context) {
    // _args = ModalRoute.of(context)!.settings.arguments as EditAddressArguments;
    // isEdit = _args.isEdit ?? false;

    return Scaffold(
      backgroundColor: AppColorScheme.surfaceColorLight,
      appBar: widget.isCreateAccount == true
          ? null
          : SimpleAppBar(title: translation.of('user.my_account')),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileEditAddressSuccess) {
            showInfoFlash(
              context: context,
              message: translation.of("user.edit_address_success"),
            );

            BlocProvider.of<AppDataBloc>(context)
                .add(FetchAppData(reFetch: true));
            Navigator.of(context).pop();
          }
          if (state is ProfileEditAddressFailed) {
            showErrorFlash(
              context: context,
              message: state.message,
            );
          }

          if (state is ProfileCreateAddressSuccess) {
            showInfoFlash(
              context: context,
              message: translation.of("user.profile_updated"),
            );
            BlocProvider.of<AppDataBloc>(context)
                .add(FetchAppData(reFetch: true));
            widget.isCreateAccount
                ? Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (route) => false)
                : Navigator.pop(context);
          }
          if (state is ProfileCreateAddressFailed) {
            showErrorFlash(
              context: context,
              message: state.message,
            );
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.all(19),
                    //constraints: const BoxConstraints(maxWidth: 380),
                    // padding: const EdgeInsets.all(AppConstants.defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              //"Edit address details",
                              translation.of('user.address'),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColorScheme.onBlack,
                                    fontSize: 16,
                                    fontFamily: AppConstants.defaultFont,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            widget.isCreateAccount == true
                                ? InkWell(
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ),
                                          (route) => false);
                                    },
                                    child: Text(translation.of('user.Skip'),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color:
                                                  AppColorScheme.primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              decoration:
                                                  TextDecoration.underline,
                                            )),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        SizedBox(
                          width: 342.74,
                          child: Text(
                            translation.of('user.enter_the_billing_address'),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color:
                                      AppColorScheme.onBlack.withOpacity(0.50),
                                  fontSize: 12,
                                  fontFamily: AppConstants.defaultFont,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ),
                        // Divider(),
                        const AppPadding(),
                        FormBuilder(
                          key: _formKey,
                          enabled: true,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // _firstNameTextField(),
                              const AppPadding(dividedBy: 2),
                              // _lastNameTextField(),
                              // const AppPadding(dividedBy: 2),
                              // _phoneNumberTextField(),
                              // const AppPadding(dividedBy: 2),
                              // _emailTextField(),
                              // const AppPadding(dividedBy: 2),
                              // _typeDropdownField(),
                              // const AppPadding(dividedBy: 2),
                              _houseNameTextField(),
                              const AppPadding(dividedBy: 2),

                              _streetNameTextField(),
                              // _postTextField(),
                              const AppPadding(dividedBy: 2),
                              _neighborhoodTextField(),
                              // _districtTextField(),
                              const AppPadding(dividedBy: 2),
                              _customDropdownButtonSelectAreaType(),
                              const AppPadding(dividedBy: 2),
                              //  Row(
                              //   children: [
                              _floorTextField(),
                              //],
                              //),
                              // _stateTextField(),
                              const AppPadding(dividedBy: 2),
                              _additionalInfo(),
                              // BlocListener<DeliveryCheckCubit,
                              //     DeliveryCheckState>(
                              //   listener: (context, state) {
                              //     if (state is DeliveryCheckLoading) {
                              //       setState(() {
                              //         isLoading = true;
                              //       });
                              //     } else if (state is DeliveryCheckSuccess) {
                              //       setState(() {
                              //         isLoading = false;
                              //       });
                              //     } else if (state is DeliveryCheckFailed) {
                              //       setState(() {
                              //         isLoading = false;
                              //       });
                              //     }
                              //   },
                              //   child: InkWell(
                              //       onTap: () {
                              //         showLocationsDialog(context);
                              //       },
                              //       child: isLoading == true
                              //           ? CircularProgressIndicator()
                              //           : _locationAddress()),
                              // ),
                              // const AppPadding(dividedBy: 2),
                              // InkWell(
                              //   onTap: (){
                              //     showLocationsDialog(context);
                              //   },
                              //   child: SizedBox(child: Column(
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //     _locationAddress(),
                              //     const AppPadding(dividedBy: 2),
                              //     userData.pinCode != '' ?_locationPin():_pinCodeTextField(),
                              //     const AppPadding(dividedBy: 2),
                              //   ]),),
                              // ),

                              //_pinCodeTextField(),
                              const AppPadding(dividedBy: 2),
                              // _streetNameTextField(),
                              // const AppPadding(dividedBy: 2),
                              // _landMarkTextField(),
                              _phoneNumberTextField(),
                              const AppPadding(dividedBy: 2),
                              _customDropdownButtonAdressType(),
                              const AppPadding(dividedBy: 2),
                              _checkboxField(),
                              // const AppPadding(dividedBy: 2),
                              // const AppPadding(multipliedBy: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColorScheme.primaryColor,
              ),
            ),

            // onPressed: () {},
            onPressed: () => _submitForm(context),
            child: Text(
              widget.isCreateAccount == true
                  ? translation.of("create_account").toUpperCase()
                  : translation.of("add_newaddress").toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColorScheme.onPrimaryLight,
                    fontSize: 14,
                    fontFamily: AppConstants.defaultFont,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _firstNameTextField() {
    return FormBuilderTextField(
      name: 'firstname',
      decoration: InputDecoration(
        hintText: translation.of("user.name"),
        prefixIcon: Icon(
          MdiIcons.accountCircleOutline,
          color: Theme.of(context).colorScheme.primary,
        ),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _focusedborder,
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
      initialValue: widget.addressData?.firstName ?? "",
      enabled: true,
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      onChanged: (value) {
        _formKey.currentState?.fields['firstname']?.validate();
      },
    );
  }

  Widget _lastNameTextField() {
    return FormBuilderTextField(
      name: 'lastname',
      decoration: InputDecoration(
          hintText: translation.of("user.last_name"),
          prefixIcon: Icon(MdiIcons.accountCircleOutline,
              color: Theme.of(context).colorScheme.primary)),
      // initialValue: _args.address?.lastName ?? "",
      enabled: true,
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      onChanged: (value) {
        _formKey.currentState?.fields['lastname']?.validate();
      },
    );
  }

  Widget _houseNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (buildingname.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(translation.of('user.building_no'), style: _labelTextStyle),
            ],
          ),

        CustomTextFormField(
          controller: _buildingNoController,
          filled: true,
          onChanged: (value) {
            setState(() {
              buildingname = value.toString();
            });
          },
          fillColor: AppColorScheme.backgroundLight,
          hintText: translation.of('user.building_no'),
          hintStyle: _hintStyle,
        ),
        // FormBuilderTextField(
        //   name: 'housename',
        //   decoration: InputDecoration(
        //     fillColor: Color(0xFFF7F2FA),
        //     hintText: translation.of("building_no"),
        //     // prefixIcon: Icon(
        //     //   MdiIcons.homeOutline,
        //     //   color: Theme.of(context).colorScheme.primary,
        //     // ),
        //     border: _border,
        //     enabledBorder: _border,
        //     focusedBorder: _focusedborder,
        //     // disabledBorder: _border,
        //     errorBorder: _border.copyWith(
        //       borderSide: BorderSide(
        //         color: Theme.of(context).colorScheme.error,
        //       ),
        //     ),
        //     focusedErrorBorder: _border.copyWith(
        //       borderSide: BorderSide(
        //         color: Theme.of(context).colorScheme.error,
        //       ),
        //     ),
        //   ),
        //   initialValue: widget.addressData?.house ?? "",
        //   enabled: true,
        //   textInputAction: TextInputAction.next,
        //   validator: FormBuilderValidators.compose([
        //     FormBuilderValidators.required(),
        //   ]),
        //   onChanged: (value) {
        //     _formKey.currentState?.fields['housename']?.validate();
        //     setState(() {
        //       buildingname = value.toString();
        //     });
        //   },
        // ),
      ],
    );
  }

  Widget _postTextField() {
    return FormBuilderTextField(
      name: 'postoffice',
      decoration: InputDecoration(
          hintText: translation.of("user.post_office"),
          prefixIcon: Icon(MdiIcons.mapMarkerOutline,
              color: Theme.of(context).colorScheme.primary)),
      // initialValue: _args.address?.post ?? "",
      enabled: true,
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      onChanged: (value) {
        _formKey.currentState?.fields['postoffice']?.validate();
      },
    );
  }

  Widget _phoneNumberTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (phoneno.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '+973 9876432105',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Color(0xFF4B454D).withOpacity(0.75),
                      fontSize: 11,
                      fontFamily: AppConstants.defaultFont,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.50,
                    ),
              ),
            ],
          ),
        CustomTextFormField(
          controller: _phoneController,
          filled: true,
          onChanged: (value) {
            setState(() {
              phoneno = value.toString();
            });
          },
          fillColor: AppColorScheme.backgroundLight,
          hintText: "+973 9876432105",
          hintStyle: _hintStyle,
        ),
        // FormBuilderTextField(
        //   name: '+973 9876432105',
        //   maxLength: 10,
        //   keyboardType: TextInputType.phone,
        //   decoration: InputDecoration(
        //        border: _border,
        //     enabledBorder: _border,
        //     focusedBorder: _focusedborder,
        //       fillColor: Color(0xFFF7F2FA),
        //       counter: Container(),
        //       hintText: "+973 9876432105"
        //       //translation.of("user.phone"),
        //       // prefixIcon: Icon(MdiIcons.phoneOutline,
        //       //     color: Theme.of(context).colorScheme.primary)
        //       ),
        //   // initialValue: _args.address?.phone ?? "",
        //   enabled: true,
        //   textInputAction: TextInputAction.next,
        //   validator: (value) {
        //     return Validate.phone(value);
        //   },
        //   onChanged: (value) {
        //     _formKey.currentState?.fields['phonenumber']?.validate();
        //     setState(() {
        //       phoneno = value.toString();
        //     });
        //   },
        // ),
      ],
    );
  }

  Widget _emailTextField() {
    return FormBuilderTextField(
      name: 'email',
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: translation.of("user.email"),
          prefixIcon: Icon(MdiIcons.phoneOutline,
              color: Theme.of(context).colorScheme.primary)),
      // initialValue: _args.address?.email ?? "",
      enabled: true,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validate.email(value);
      },
      onChanged: (value) {
        _formKey.currentState?.fields['email']?.validate();
      },
    );
  }

  Widget _districtTextField() {
    return FormBuilderTextField(
      name: 'district',
      decoration: InputDecoration(
        hintText: translation.of("user.district"),
        prefixIcon: Icon(MdiIcons.mapMarkerOutline,
            color: Theme.of(context).colorScheme.primary),
      ),
      // initialValue: _args.address?.district ?? "",
      enabled: true,
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      onChanged: (value) {
        _formKey.currentState?.fields['district']?.validate();
      },
    );
  }

  Widget _stateTextField() {
    return FormBuilderTextField(
      name: 'state',
      decoration: InputDecoration(
        hintText: translation.of("user.state"),
        prefixIcon: Icon(MdiIcons.mapMarkerOutline,
            color: Theme.of(context).colorScheme.primary),
      ),
      // initialValue: _args.address?.state ?? "",
      enabled: true,
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      onChanged: (value) {
        _formKey.currentState?.fields['state']?.validate();
      },
    );
  }

  Widget _pinCodeTextField() {
    return FormBuilderTextField(
      initialValue: widget.addressData?.pincode ?? "",
      name: 'pincode',
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        counter: SizedBox(),
        hintText: translation.of("user.pincode"),
        prefixIcon: Icon(
          MdiIcons.mapMarkerOutline,
          color: Theme.of(context).colorScheme.primary,
        ),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _focusedborder,
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
      // initialValue: _args.address?.pincode ?? "",
      enabled: false,
      maxLength: 6,
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.required(),
      onChanged: (value) {
        _formKey.currentState?.fields['pincode']?.validate();
      },
    );
  }

  Widget _streetNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (streetname.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(translation.of('user.street_name'), style: _labelTextStyle),
            ],
          ),
        CustomTextFormField(
          controller: _streetController,
          filled: true,
          onChanged: (value) {
            setState(() {
              streetname = value.toString();
            });
          },
          fillColor: AppColorScheme.backgroundLight,
          hintText: translation.of('user.street_name'),
          hintStyle: _hintStyle,
        ),
        // FormBuilderTextField(
        //   name: 'street',
        //   decoration: InputDecoration(
        //     fillColor: Color(0xFFF7F2FA),
        //      border: _border,
        //     enabledBorder: _border,
        //     focusedBorder: _focusedborder,
        //     hintText: translation.of("street"),
        //     // prefixIcon: Icon(MdiIcons.mapMarkerOutline,
        //     //     color: Theme.of(context).colorScheme.primary)
        //   ),
        //   // initialValue: _args.address?.street ?? "",
        //   enabled: true,
        //   textInputAction: TextInputAction.next,
        //   // validator: FormBuilderValidators.compose([
        //   //   FormBuilderValidators.required(),
        //   // ]),
        //   onChanged: (value) {
        //     _formKey.currentState?.fields['streetname']?.validate();
        //     setState(() {
        //       streetname = value.toString();
        //     });
        //   },
        // ),
      ],
    );
  }

  Widget _locationAddress() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding / 2,
          vertical: AppConstants.defaultPadding / 2),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.location_on_outlined),
          SizedBox(
            width: AppConstants.cornerRadius / 2,
          ),
          userData.place != ''
              ? Text(
                  userData.place,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              : Text("Select City",
                  style: Theme.of(context).textTheme.bodyLarge),
          Spacer(),
          Icon(Icons.arrow_drop_down_outlined),
          SizedBox(
            width: AppConstants.cornerRadius,
          ),
        ],
      ),
    );
  }

  // Widget _locationPin() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
  //       color: Colors.white,
  //     ),
  //     padding: EdgeInsets.symmetric(
  //         horizontal: AppConstants.defaultPadding / 2,
  //         vertical: AppConstants.defaultPadding / 2),
  //     width: MediaQuery.of(context).size.width,
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         Icon(Icons.location_on_outlined),
  //         SizedBox(
  //           width: AppConstants.cornerRadius / 2,
  //         ),
  //         userData.pinCode != ''
  //             ? Text(userData.pinCode)
  //             : Text("select pin code")
  //       ],
  //     ),
  //   );
  // }

  Widget _landMarkTextField() {
    return FormBuilderTextField(
      initialValue: widget.addressData?.landmark,
      name: 'landmark',
      decoration: InputDecoration(
        hintText: translation.of("user.landmark"),
        prefixIcon: Icon(
          MdiIcons.mapMarkerOutline,
          color: Theme.of(context).colorScheme.primary,
        ),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _focusedborder,
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
      // initialValue: _args.address?.landmark ?? "",
      enabled: true,
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      onChanged: (value) {
        _formKey.currentState?.fields['landmark']?.validate();
      },
    );
  }

  Widget _typeDropdownField() {
    return FormBuilderDropdown<Type>(
      // autovalidate: true,
      name: 'addressType',
      isExpanded: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          MdiIcons.mapMarkerOutline,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      hint: Text(
        "${_val ?? translation.of("user.address_type")}",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
      ),
      validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
      items: Type.values
          .map((e) => DropdownMenuItem<Type>(
                child: Text(
                    "${StringModifiers.enumToString(e)?.replaceAll("_", " ") ?? ""}"),
                value: e,
              ))
          .toList(),
      // initialValue: _args.address?.type,
      onChanged: (val) {
        setState(() {
          _val = val;
        });
      },
    );
  }

  Widget _checkboxField() {
    return FormBuilderCheckbox(
      name: 'set_as_default',
      title: Text(translation.of("set_as_default"),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Color(0xFF4B454D),
                fontSize: 11,
                fontFamily: AppConstants.defaultFont,
                fontWeight: FontWeight.w500,
              )),
      initialValue: widget.addressData?.isDefault ?? false,
      onChanged: (value) {
        setState(() {
          _isDefault = value ?? false;
        });
      },
      activeColor: AppColorScheme.primaryColor,
      decoration: const InputDecoration(
        filled: false,
      ),
    );
  }

  Widget _floorTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (floorno.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(translation.of("floor_no"), style: _labelTextStyle),
                  ],
                ),
              CustomTextFormField(
                controller: _floorNoController,
                filled: true,
                onChanged: (value) {
                  setState(() {
                    floorno = value.toString();
                  });
                },
                fillColor: AppColorScheme.backgroundLight,
                hintText: translation.of("floor_no"),
                hintStyle: _hintStyle,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: 10,
          ),
        ),
        Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (flatno.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(translation.of("flat_no"), style: _labelTextStyle),
                  ],
                ),
              CustomTextFormField(
                controller: _flatNoController,
                filled: true,
                onChanged: (value) {
                  setState(() {
                    flatno = value.toString();
                  });
                },
                fillColor: AppColorScheme.backgroundLight,
                hintText: translation.of("flat_no"),
                hintStyle: _hintStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _neighborhoodTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (neighborname.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(translation.of("neighborhood_name"), style: _labelTextStyle),
            ],
          ),
        CustomTextFormField(
          controller: _neighbourController,
          filled: true,
          onChanged: (value) {
            setState(() {
              neighborname = value.toString();
            });
          },
          fillColor: AppColorScheme.backgroundLight,
          hintText: translation.of("neighborhood_name"),
          hintStyle: _hintStyle,
        ),
      ],
    );
  }

  Widget _additionalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (additionalinfo.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(translation.of("additional_info"), style: _labelTextStyle),
            ],
          ),
        Container(
          // width: 352.74,
          // height: 105,
          // decoration: ShapeDecoration(
          //   color: Color(0xFFF7F2FA),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          // ),
          child: CustomTextFormField(
            controller: _additionalInfoController,
            filled: true,
            onChanged: (value) {
              setState(() {
                additionalinfo = value.toString();
              });
            },
            fillColor: AppColorScheme.backgroundLight,
            hintText: translation.of("additional_info"),
            hintStyle: _hintStyle,
            maxLines: 6,
          ),
        )
      ],
    );
  }

  Widget _customDropdownButtonAdressType() {
    List<TextValueItem<Type>> addressTypeItems = [
      TextValueItem(text: 'Home', value: Type.HOME),
      TextValueItem(text: 'Office', value: Type.OFFICE),
      TextValueItem(text: 'Shop', value: Type.SHOP),
    ];

    return CustomDropDown(
      items: addressTypeItems,
      icon: const Icon(Iconsax.arrow_down_1),
      fillColor: AppColorScheme.backgroundLight,
      hintText: translation.of('user.select_address_type'),
      hintStyle: _hintStyle,
      borderDecoration: _border,
      contentPadding: EdgeInsets.all(20),
      onChanged: (selectedType) {
        setState(() {
          selectedAddressType = selectedType;
        });
      },
    );
  }

  Widget _customDropdownButtonSelectAreaType() {
    return BlocBuilder<GetAllZoneBloc, GetAllZoneState>(
      builder: (context, state) {
        if (state is GetAllZoneLoaded) {
          final zones = state.zones;

          List<TextValueItem<dynamic>> dropdownItems = zones?.map((zone) {
                return TextValueItem<dynamic>(
                  text: zone.zoneName ?? '',
                  value: zone,
                );
              }).toList() ??
              [];

          return CustomDropDown(
            items: dropdownItems,
            onChanged: (selectedZone) {
              setState(() {
                selectedZoneId = selectedZone.id;
                print("selected Zone Is :${selectedZone}");
              });
            },
            textStyle: _labelTextStyle,
            icon: const Icon(Iconsax.arrow_down_1),
            fillColor: AppColorScheme.backgroundLight,
            hintText: translation.of('user.select_area'),
            hintStyle: _hintStyle,
            borderDecoration: _border,
            contentPadding: EdgeInsets.all(20),
          );
        }

        return Container();
      },
    );
  }

  void _getAllAvailableZones() {
    BlocProvider.of<GetAllZoneBloc>(context).add(GetAllZone());
  }

  void _submitForm(BuildContext context) {
    bool? isValid = _formKey.currentState?.validate();

    if (isValid == true) {
      // if (isEdit == true) {
      // if (widget.appData?.user?.id != null && widget.addressData?.id != null) {
      // if (userData.place == null || userData.place == '') {
      //   showErrorFlash(
      //       context: context, message: "please select city".toUpperCase());
      // }
      // else {
      BlocProvider.of<ProfileBloc>(context).add(ProfileCreateAddress(
        shippingInput: ShippingInput(
            phone: _phoneController.text.isNotEmpty
                ? _phoneController.text
                : authentication.user?.phone,
            // _formKey.currentState?.fields['phone']?.value.toString() ??
            //     "${authentication.user?.phone}",
            note: _additionalInfoController.text,
            firstName: authentication.user?.name,
            lastName: authentication.user?.lastname,
            email: authentication.user?.email,
            address: _buildingNoController.text,
            // neighborhoodname: _neighbourController.text,
            landmark: _neighbourController.text,
            floorno: _floorNoController.text,
            flatno: _flatNoController.text,
            house: _buildingNoController.text,
            street: _streetController.text,
            zone: selectedZoneId,
            isDefault: _isDefault,
            type: selectedAddressType
            //_formKey.currentState?.fields['set_as_default_address']?.value,
            ),
      ));
      // }
      // } else {
      //   showErrorFlash(
      //     context: context,
      //     message: translation.of("unexpected_error_occurred"),
      //   );
      // }
      // }
      // else {
      //   // if(userData.place == null || userData.place ==''){
      //   //   showErrorFlash(
      //   //       context: context,
      //   //       message: "please select city".toUpperCase());
      //   // }else {
      //   //   BlocProvider.of<ProfileBloc>(context).add(ProfileCreateAddress(
      //   //       shippingInput: ShippingInput(
      //   //           firstName: _formKey.currentState?.fields['firstname']?.value
      //   //               .toString(),
      //   //           lastName:
      //   //           _formKey.currentState?.fields['lastname']?.value.toString(),
      //   //           phone: _formKey.currentState?.fields['phonenumber']?.value
      //   //               .toString() ??
      //   //               "${authentication.user?.phone}",
      //   //           email: _formKey.currentState?.fields['email']?.value
      //   //               .toString(),
      //   //           pincode:
      //   //           _formKey.currentState?.fields['pincode']?.value.toString(),
      //   //           house: _formKey.currentState?.fields['housename']?.value
      //   //               .toString(),
      //   //           street: userData.place,
      //   //           // _formKey.currentState?.fields['streetname']?.value
      //   //           //     .toString(),
      //   //           post: _formKey.currentState?.fields['postoffice']?.value
      //   //               .toString(),
      //   //           district:
      //   //           _formKey.currentState?.fields['district']?.value.toString(),
      //   //           state: _formKey.currentState?.fields['state']?.value
      //   //               .toString(),
      //   //           landmark:
      //   //           _formKey.currentState?.fields['landmark']?.value.toString(),
      //   //           type: _val ?? Type.values[0],
      //   //           isDefault: _formKey.currentState
      //   //               ?.fields['set_as_default_address']?.value)));
      //   // }
      // }
    } else {
      showErrorFlash(
          context: context,
          message: translation.of("invalid_details").toUpperCase());
    }
  }
}
