// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lumiereorganics_app/user_module/presentation/feature/profile/screens/add_address_screen.dart';
// import '../../../../../app_settings_module/domain/entity/models/shipping_address.dart';
// import '../../../../../app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
// import '../../../../../base_module/domain/entity/translation.dart';
// import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
// import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
// import '../../../../../base_module/presentation/component/padding/app_padding.dart';
// import '../../../../../base_module/presentation/core/values/app_constants.dart';
// import '../../../../data/entity/input_models/edit_address_arguments.dart';
// import '../../../core/values/user_router.dart';
// import '../blocs/profile/profile_bloc.dart';
// import '../widgets/address_card.dart';
// class AdressesPage extends StatelessWidget {
//   const AdressesPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: SimpleAppBar(title: 'My Account'),
//       body: Container(
//         margin: EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               translation.of("address_details"),
//               style: TextStyle(
//                 color: Color(0xFF1D1B1E),
//                 fontSize: 16,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(
//               height: 0.16,
//             ),
//             Divider(),
//             SizedBox(
//               height: 0.16,
//             ),
//             BlocBuilder<AppDataBloc, AppDataState>(
//               builder: (appDataContext, state) {
//                 if (state is FetchAppDataSuccess) {
//                   List<ShippingAddress?>? addressList =
//                       state.appData.addressDetails ?? [];
//                   if (addressList.isNotEmpty) {
//                     return Expanded(
//                       child: ListView.builder(
//                         itemCount: addressList.length,
//                         itemBuilder: (context, index) {
//                           return Center(
//                             child: BlocListener<ProfileBloc, ProfileState>(
//                               listener: (context2, profileState) {
//                                 // Your listener code
//                               },
//                               child: Column(
//                                 children: [
//                                   AddressCard(
//                                     address: addressList[index],
//                                     userId: state.appData.id,
//                                   ),
//                                   SizedBox(
//                                     height: 16,
//                                   ),
//                                   Divider(),
//                                   SizedBox(
//                                     height: 16,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   } else {
//                     return Container(
//                       child: Center(
//                         child: Text(translation.of("address_list_is_empty")),
//                       ),
//                     );
//                   }
//                 } else if (state is FetchAppDataFailed) {
//                   return InkWell(
//                     onTap: () {
//                       BlocProvider.of<AppDataBloc>(context)
//                           .add(FetchAppData(reFetch: true));
//                     },
//                     child: Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text("Click to refresh"),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Icon(Icons.refresh)
//                         ],
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Container();
//                 }
//               },
//             ),
//             // const AppPadding(
//             //   dividedBy: 4,
//             // ),
//             Center(
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all(
//                     const EdgeInsets.symmetric(
//                       horizontal: AppConstants.defaultPadding,
//                       vertical: AppConstants.defaultPadding / 4,
//                     ),
//                   ),
//                 ),
//                 onPressed: () {
//                   // Navigator.pushNamed(
//                   //   context,
//                   //   UserRouter.addAddressScreen,
//                   //   arguments: EditAddressArguments(),
//                   // );
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddressScreen(),));
//                 },
//                 child: Text(
//                   translation.of("user.add_new_address"),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/user_module/domain/entity/authentication.dart';
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
import '../../../../data/entity/input_models/shipping_input.dart';
import '../../../../data/entity/input_models/zones.dart';
import '../../../../domain/user_data.dart';
import '../blocs/get_all_zone/get_all_available_zone_bloc.dart';
import '../blocs/profile/profile_bloc.dart';

class EditAddressScreen extends StatefulWidget {
  final ShippingAddress? addressData;
  final AppData? appData;
  final bool isDefaultEnabled;

  const EditAddressScreen({
    Key? key,
    this.addressData,
    this.appData,
    this.isDefaultEnabled = true,
  }) : super(key: key);

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
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
  Type? selectedAddressType;

  // late EditAddressArguments _args;
  TextStyle? get _hintStyle => Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.45),
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      );
  TextStyle? get _labelTextStyle =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColorScheme.grey,
            fontSize: 11,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          );
  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Color(0xFFF7F2FA),
          // width: 1,
        ),
      );

  @override
  void initState() {
    super.initState();
   // _getAllAvailableZones();

  }

  

  @override
  Widget build(BuildContext context) {
    // _args = ModalRoute.of(context)!.settings.arguments as EditAddressArguments;
    // isEdit = _args.isEdit ?? false;

    return Scaffold(
      appBar: SimpleAppBar(
        title: "My Account",
      ),
      //  AppBar(
      //   iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      backgroundColor: AppColorScheme.surfaceColorLight,
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileEditAddress) {
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

          if (state is ProfileEditAddressSuccess) {
            showInfoFlash(
              context: context,
              message: translation.of("user.profile_updated"),
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
                              "Edit address details",
                              style: TextStyle(
                                color: Color(0xFF1D1B1E),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => HomeScreen(),), (route) => false);
                            //   },
                            //   child: Text(
                            //     'Skip',
                            //     style: TextStyle(
                            //       color: AppColorScheme.primaryColor,
                            //       fontSize: 12,
                            //       fontFamily: 'Poppins',
                            //       fontWeight: FontWeight.w400,
                            //       decoration: TextDecoration.underline,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                        SizedBox(
                          width: 342.74,
                          child: Text(
                            'Enter the billing address',
                            style: TextStyle(
                              color: AppColorScheme.onBlack.withOpacity(0.50),
                              fontSize: 12,
                              fontFamily: 'Poppins',
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

                              _customDropdownSelectAreaType(),
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
                              _customDropdownSelectAdressType(),
                              const AppPadding(dividedBy: 2),
                              _checkboxField(),
                              const AppPadding(dividedBy: 2),

                              const AppPadding(multipliedBy: 4),
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
          height: 56,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppColorScheme.scaffoldBackgroundColorLight,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      translation.of("cancel").toUpperCase(),
                      style: TextStyle(
                        color: AppColorScheme.primaryColor,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppColorScheme.primaryColor,
                      ),
                    ),
                    onPressed: () => _submitForm(context),
                    child: Text(
                      translation.of("save").toUpperCase(),
                      style: TextStyle(
                        color: AppColorScheme.onPrimaryLight,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
      initialValue: widget.addressData?.firstName ?? "",
      enabled: true,
      textInputAction: TextInputAction.next,
      style: TextStyle(
        color: Color(0xFF4A4739).withOpacity(0.75),
      ),
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
              Text(
                'Building no.',
                style: TextStyle(
                  color: Color(0xFF4B454D).withOpacity(0.75),
                  fontSize: 11,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.50,
                ),
              ),
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
          hintText: widget.addressData?.house ?? 'Building no.',
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
        //     // border: _border,
        //     enabledBorder: _border,
        //     focusedBorder: _border,
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
        //   style: TextStyle(color :Color(0xFF4A4739).withOpacity(0.75),),
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
                style: TextStyle(
                  color: Color(0xFF4B454D).withOpacity(0.75),
                  fontSize: 11,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
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
          hintText: widget.addressData?.phone ?? "+973 9876432105",
          hintStyle: _hintStyle,
        ),
        // FormBuilderTextField(
        //   name: '+973 9876432105',
        //   maxLength: 10,
        //   keyboardType: TextInputType.phone,
        //   decoration: InputDecoration(
        //       enabledBorder: _border,
        //       focusedBorder: _border,
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
        //   style: TextStyle(color :Color(0xFF4A4739).withOpacity(0.75),),
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
              Text(
                'Street',
                style: TextStyle(
                  color: Color(0xFF4B454D).withOpacity(0.75),
                  fontSize: 11,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.50,
                ),
              ),
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
          hintText: widget.addressData?.street ?? translation.of("street"),
          hintStyle: _hintStyle,
        ),
        // FormBuilderTextField(
        //   name: 'street',
        //   decoration: InputDecoration(
        //     fillColor: Color(0xFFF7F2FA),
        //     enabledBorder: _border,
        //     focusedBorder: _border,
        //     hintText: translation.of("street"),
        //     // prefixIcon: Icon(MdiIcons.mapMarkerOutline,
        //     //     color: Theme.of(context).colorScheme.primary)
        //   ),
        //   // initialValue: _args.address?.street ?? "",
        //   enabled: true,
        //   textInputAction: TextInputAction.next,
        //   style: TextStyle(color :Color(0xFF4A4739).withOpacity(0.75),),
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
        color: AppColorScheme.onPrimaryLight,
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
  //       color: AppColorScheme.onPrimaryLight,
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
        style: TextStyle(
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
          style: TextStyle(
            color: Color(0xFF4B454D),
            fontSize: 11,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          )),
      initialValue: widget.addressData?.isDefault ?? false,
      onChanged: (value) {
        _isDefault = value ?? false;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (floorno.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Floor no.',
                      style: TextStyle(
                        color: Color(0xFF4B454D).withOpacity(0.75),
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.50,
                      ),
                    ),
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
              // FormBuilderTextField(
              //   name: 'Floor no.',
              //   decoration: InputDecoration(
              //     hintText: translation.of("floor_no"),
              //     enabledBorder: _border,
              //     focusedBorder: _border,
              //     fillColor: Color(0xFFF7F2FA),
              //   ),
              //   enabled: true,
              //   textInputAction: TextInputAction.next,
              //   style: TextStyle(color :Color(0xFF4A4739).withOpacity(0.75),),
              //   // validator: FormBuilderValidators.compose([
              //   //   FormBuilderValidators.required(),
              //   // ]),
              //   onChanged: (value) {
              //     setState(() {
              //       floorno = value.toString();
              //     });
              //     // _formKey.currentState?.fields['postoffice']?.validate();
              //   },
              // ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (flatno.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flat no.',
                        style: TextStyle(
                          color: Color(0xFF4B454D).withOpacity(0.75),
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.50,
                        ),
                      ),
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
                // FormBuilderTextField(
                //   name: 'Flat no.',
                //   decoration: InputDecoration(
                //     hintText: translation.of("flat_no"),
                //     enabledBorder: _border,
                //     focusedBorder: _border,
                //     fillColor: Color(0xFFF7F2FA),
                //   ),
                //   enabled: true,
                //   textInputAction: TextInputAction.next,
                //   style: TextStyle(color :Color(0xFF4A4739).withOpacity(0.75),),
                //   // validator: FormBuilderValidators.compose([
                //   //   FormBuilderValidators.required(),
                //   // ]),
                //   onChanged: (value) {
                //     setState(() {
                //       flatno = value.toString();
                //     });
                //     // _formKey.currentState?.fields['postoffice']?.validate();
                //   },
                // ),
              ],
            ),
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
              Text(
                'Neighborhood name',
                style: TextStyle(
                  color: Color(0xFF4B454D).withOpacity(0.75),
                  fontSize: 11,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.50,
                ),
              ),
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
        // FormBuilderTextField(
        //   name: 'Neighborhood name',
        //        //   decoration: InputDecoration(
        //     fillColor: Color(0xFFF7F2FA),
        //     focusedBorder: _border,
        //     hintText: translation.of("neighborhood_name"),
        //     enabledBorder: _border,
        //     // prefixIcon: Icon(MdiIcons.mapMarkerOutline,
        //     //     color: Theme.of(context).colorScheme.primary)
        //   ),
        //   // initialValue: _args.address?.post ?? "",
        //   enabled: true,
        //   textInputAction: TextInputAction.next,
        //   style: TextStyle(color :Color(0xFF4A4739).withOpacity(0.75),),
        //   // validator: FormBuilderValidators.compose([
        //   //   FormBuilderValidators.required(),
        //   // ]),
        //   onChanged: (value) {
        //     setState(() {
        //       neighborname = value.toString();
        //     });
        //     // _formKey.currentState?.fields['postoffice']?.validate();
        //   },
        // ),
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
              Text(
                'Additional info, if any',
                style: TextStyle(
                  color: Color(0xFF4B454D).withOpacity(0.75),
                  fontSize: 11,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.50,
                ),
              ),
            ],
          ),
        Container(
          child: CustomTextFormField(
            controller: _additionalInfoController,
            filled: true,
            onChanged: (value) {
              setState(() {
                additionalinfo = value.toString();
              });
            },
            fillColor: AppColorScheme.backgroundLight,
            hintText:
                widget.addressData?.note ?? translation.of("additional_info"),
            hintStyle: _hintStyle,
            maxLines: 6,
          ),
          // width: 352.74,
          //height: 105,
          // // decoration: ShapeDecoration(
          // //   color: Color(0xFFF7F2FA),
          // //   shape: RoundedRectangleBorder(
          // //     borderRadius: BorderRadius.circular(10),
          // //   ),
          // // ),
          // child: FormBuilderTextField(
          //   selectionHeightStyle: BoxHeightStyle.max,
          //   name: "Additional info, if any",
          //   decoration: InputDecoration(
          //     hintText: translation.of("additional_info"),
          //     enabledBorder: _border,
          //     focusedBorder: _border,
          //     fillColor: Color(0xFFF7F2FA),
          //   ),
          //   enabled: true,
          //   textInputAction: TextInputAction.next,
          //   style: TextStyle(color :Color(0xFF4A4739).withOpacity(0.75),),
          //   maxLines: 6,
          //   // validator: FormBuilderValidators.compose([
          //   //   FormBuilderValidators.required(),
          //   // ]),
          //   onChanged: (value) {
          //     setState(() {
          //       additionalinfo = value.toString();
          //     });
          //     // _formKey.currentState?.fields['postoffice']?.validate();
          //   },
          // ),
        )
      ],
    );
  }

  Widget _customDropdownSelectAdressType() {
   List<TextValueItem<Type>> addressTypeItems = [
  TextValueItem(text: 'Home', value: Type.HOME),
  TextValueItem(text: 'Office', value: Type.OFFICE),
  TextValueItem(text: 'Shop', value:Type.SHOP),
];

    return CustomDropDown(
      items: addressTypeItems,
      icon: const Icon(Iconsax.arrow_down_1),
      fillColor: AppColorScheme.backgroundLight,
      hintText: "Select address type",
      hintStyle: _hintStyle,
      borderDecoration: _border,
      contentPadding: EdgeInsets.all(20),
      onChanged: (selectedType) {
        setState(() {
           selectedAddressType=selectedType;
        });
        
        
      },
    );
  }

  Widget _customDropdownSelectAreaType() {
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
            onChanged: (selected) {
              setState(() {
                selectedZoneId = selected.id;
              });
            },
            icon: const Icon(Iconsax.arrow_down_1),
            fillColor: AppColorScheme.backgroundLight,
            hintText: (widget.addressData?.zone) ?? "Select area ",
            hintStyle: _hintStyle,
            borderDecoration: _border,
            contentPadding: EdgeInsets.all(20),
          );
        }

        return Container();
      },
    );
  }

  // Widget _customDropdownSelectAreaType() {
  //   return CustomDropDown(
  //             items: [],
  //             icon: const Icon(Iconsax.arrow_down_1),
  //             fillColor: AppColorScheme.backgroundLight,
  //             hintText: "Select area ",
  //             hintStyle: _hintStyle,
  //             borderDecoration:_border,
  //             contentPadding: EdgeInsets.all(20),

  //           );
  // }

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
      BlocProvider.of<ProfileBloc>(context).add(ProfileEditAddress(
          shippingInput: ShippingInput(
            // firstName:
            //     _formKey.currentState?.fields['firstname']?.value.toString(),
            // lastName: _formKey.currentState?.fields['lastname']?.value
            //     .toString(),
            // phone: _formKey.currentState?.fields['phonenumber']?.value
            //     .toString() ??
            //     "${authentication.user?.phone}",
            // email:
            // _formKey.currentState?.fields['email']?.value.toString(),
            // pincode:
            //     _formKey.currentState?.fields['pincode']?.value.toString(),
            // house:
            //     _formKey.currentState?.fields['housename']?.value.toString(),
            // street: userData.place,
            // _formKey.currentState?.fields['streetname']?.value
            //     .toString(),
            // post: _formKey.currentState?.fields['postoffice']?.value
            //     .toString(),
            //    district: _formKey.currentState?.fields['district']?.value
            //         .toString(),
            //     state:
            //     _formKey.currentState?.fields['state']?.value.toString(),
            // landmark:
            //     _formKey.currentState?.fields['landmark']?.value.toString(),
            phone: _phoneController.text.isNotEmpty
                ? _phoneController.text
                : widget.addressData?.phone,
            house: _buildingNoController.text.isNotEmpty
                ? _buildingNoController.text
                : widget.addressData?.house,
            street: _streetController.text.isNotEmpty
                ? _streetController.text
                : widget.addressData?.street,
            note: _additionalInfoController.text.isNotEmpty
                ? _additionalInfoController.text
                : widget.addressData?.note,
            flatno: _flatNoController.text.isNotEmpty
                ? _flatNoController.text
                : widget.addressData?.flatno,
            floorno: _floorNoController.text.isNotEmpty
                ? _floorNoController.text
                : widget.addressData?.floorno,
            neighborhoodname: _neighbourController.text.isNotEmpty
                ? _neighbourController.text
                : widget.addressData?.neighborhoodname,
            zone: selectedZoneId.isNotEmpty
                ? selectedZoneId
                : widget.addressData?.zone,
            isDefault:_isDefault,
            type: selectedAddressType,
            
                //_formKey.currentState?.fields['set_as_default_address']?.value,
          ),
          addressId: widget.addressData!.id!,
          customerId: widget.appData!.id!));
      // }
    } else {
      showErrorFlash(
        context: context,
        message: translation.of("unexpected_error_occurred"),
      );
    }
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
    // } else {
    //   showErrorFlash(
    //       context: context,
    //       message: translation.of("invalid_details").toUpperCase());
    // }
  }
}
