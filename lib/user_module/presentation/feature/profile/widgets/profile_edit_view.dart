import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/base_module/presentation/core/values/app_constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:otp_autofill/otp_autofill.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/component/text_form_field/custom_text_form_filed.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/util/validate.dart';
import '../../../../data/entity/input_models/otp_input.dart';
import '../../../../data/entity/input_models/otp_type.dart';
import '../../../../data/entity/input_models/user_update_input.dart';
import '../../../../domain/entity/authentication.dart';
import '../../../../domain/entity/models/role.dart';
import '../blocs/profile/profile_bloc.dart';
import 'otp_verification_dialog.dart';

class ProfileEditView extends StatefulWidget {
  final bool editable;

  const ProfileEditView({
    Key? key,
    this.editable = true,
  }) : super(key: key);

  @override
  _ProfileEditViewState createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool _loading = false;

  final _profileBloc = ProfileBloc();
  late OTPTextEditController controller;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
        borderSide: BorderSide(
          color: AppColorScheme.textFieldBorderColor,
          width: 1,
        ),
      );

  @override
  Widget build(BuildContext context) {
    debugPrint("namelist is ${authentication.nameList}");
    return BlocListener<ProfileBloc, ProfileState>(
      bloc: _profileBloc,
      listener: (_, state) {
        if (state is UpdateProfileSuccess) {
          showFlash(
            context: context,
            duration: const Duration(seconds: 2),
            builder: (_, controller) {
              return FlashAlert(
                flashController: controller,
                color: AppColorScheme.primaryColor,
                iconData: Icons.done,
                message: translation.of("user.profile_updated"),
              );
            },
          );

          setState(() {
            _loading = false;
          });
        } else if (state is UpdateProfileFailed) {
          showFlash(
            context: context,
            duration: const Duration(seconds: 2),
            builder: (_, controller) {
              return FlashAlert(
                flashController: controller,
                color: Theme.of(context).colorScheme.error,
                iconData: Icons.error,
                message: state.message.contains('SOME_ERROR')
                    ? translation.of("something_went_wrong")
                    : state.message,
              );
            },
          );

          setState(() {
            _loading = false;
          });
        } else if (state is SendOtpSuccess) {
          _showVerifyOtpDialog();

          setState(() {
            _loading = false;
          });
        } else if (state is SendOtpFailed) {
          showFlash(
            context: context,
            duration: const Duration(seconds: 2),
            builder: (_, controller) {
              return FlashAlert(
                flashController: controller,
                color: Theme.of(context).colorScheme.error,
                iconData: Icons.error,
                message: state.message.contains('ALREADY_EXIST') ||
                        state.message.contains('FAILED')
                    ? translation.of("user.user_exist_already")
                    : state.message,
              );
            },
          );

          setState(() {
            _loading = false;
          });
        }
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FormBuilder(
              key: _formKey,
              enabled: widget.editable,
              autovalidateMode: AutovalidateMode.disabled,
              child: authentication.isAuthenticated
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            _firstNameTextField(),
                            const AppPadding(dividedBy: 2),
                            _lastNameTextField(),
                            const AppPadding(dividedBy: 2),
                            _emailTextField(),
                            const AppPadding(dividedBy: 2),
                            _phoneTextField(),
                            const AppPadding(dividedBy: 2),
                          ],
                        ),
                        // _AddressTextField(),
                        //  const AppPadding(dividedBy: 2),
                        // _PinCodeTextField(),
                        // const AppPadding(),
                        if (widget.editable)
                          // SizedBox(
                          //   width: double.infinity,
                          //   child: ElevatedButton(
                          //     onPressed: _submitForm,
                          //     child: _loading
                          //         ? const CupertinoActivityIndicator()
                          //         : Text(
                          //             translation.of("update").toUpperCase(),
                          //           ),
                          //   ),
                          // ),

                          Column(
                            children: [
                              SizedBox(
                                height: 56,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 56,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              AppColorScheme
                                                  .scaffoldBackgroundColorLight,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            translation.of("cancel"),
                                            style: TextStyle(
                                              color:
                                                  AppColorScheme.primaryColor,
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
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              AppColorScheme.primaryColor,
                                            ),
                                          ),
                                          onPressed: _submitForm,
                                          child: Text(
                                            translation.of("save"),
                                            style: TextStyle(
                                              color:
                                                  AppColorScheme.onPrimaryLight,
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
                            ],
                          ),
                      ],
                    )
                  : Column(
                      children: [
                        AppPadding(
                          multipliedBy: 2,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              // pushNewScreenWithRouteSettings(context,
                              //     settings: RouteSettings(
                              //       name: UserRouter.signInScreen,
                              //     ),
                              //     withNavBar: false,
                              //     screen: SignInScreen());
                              // Navigator.of(context)
                              //     .pushNamed(UserRouter.signInScreen);
                            },
                            child: Text(
                              translation.of("user.sign_in").toUpperCase(),
                            )),
                        AppPadding(
                          multipliedBy: 2,
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _firstNameTextField() {
    return Container(
      // width: 350,
      // height: 120,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'First name',
            style: TextStyle(
              color: Color(0xFF4B454D).withOpacity(0.75),
              fontSize: 11,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          // Container(
          //   // width: 350,
          //   // height: 72,
          //   child: FormBuilderTextField(
          //     style: TextStyle(
          //       color: Color(0xFF4B454D),
          //       fontSize: 14,
          //       fontFamily: 'Poppins',
          //       fontWeight: FontWeight.w400,
          //     ),
          //     name: 'FirstName',
          //     decoration: InputDecoration(
          //       fillColor: Color(0xFFF7F2FA),
          //       enabledBorder: OutlineInputBorder(
          //         borderSide: BorderSide(
          //           // width: 5,
          //           color: Color(0xFFF7F2FA),
          //         ),
          //         borderRadius: BorderRadius.circular(10.0),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderSide: BorderSide(
          //           // width: 5,
          //           color: Color(0xFFF7F2FA),
          //         ),
          //         borderRadius: BorderRadius.circular(10.0),
          //       ),
          //       // border:
          //       //     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          //       hintStyle: TextStyle(
          //         color: Color(0xFF4B454D),
          //         fontSize: 14,
          //         fontFamily: 'Poppins',
          //         fontWeight: FontWeight.w400,
          //       ),
          //       hintText: translation.of("user.first_name"),
          //     ),
          //     initialValue: Authentication().nameList?[0] ?? "",
          //     enabled: !_loading,
          //     textInputAction: TextInputAction.next,
          //     validator: FormBuilderValidators.compose([
          //       FormBuilderValidators.required(
          //     ]),
          //     onChanged: (value) {
          //       _formKey.currentState?.fields['firstName']?.validate();
          //     },
          //   ),
          // ),
          CustomTextFormField(
            controller: _firstNameController,
            hintText: authentication.user?.name,
            hintStyle: TextStyle(color: AppColorScheme.onBlack),
            fillColor: AppColorScheme.backgroundLight,
            enabled: !_loading,
            filled: true,
            validator: FormBuilderValidators.compose([
              if (authentication.user?.name == null)
                FormBuilderValidators.required(
                  errorText: "required",
                ),
            ]),
          )
        ],
      ),
    );
  }

  Widget _lastNameTextField() {
    return Container(
      // width: 350,
      // height: 120,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Last name',
            style: TextStyle(
              color: Color(0xFF4B454D).withOpacity(0.75),
              fontSize: 11,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          CustomTextFormField(
            controller: _lastNameController,
            hintText: authentication.user?.lastname,
            hintStyle: TextStyle(color: AppColorScheme.onBlack),
            fillColor: AppColorScheme.backgroundLight,
            enabled: !_loading,
            filled: true,
            validator: FormBuilderValidators.compose([
              if (authentication.user?.lastname == null)
                FormBuilderValidators.required(
                  errorText: "required",
                ),
            ]),
          )
        ],
      ),
    );

    // FormBuilderTextField(
    //   name: 'lastName',
    //   initialValue: authentication.user?.lastname,
    //   decoration: InputDecoration(
    //       hintText: translation.of("user.last_name"),
    //       prefixIcon: Icon(MdiIcons.accountCircleOutline,
    //           color: Theme.of(context).colorScheme.primary)),
    //   enabled: !_loading,
    //   textInputAction: TextInputAction.next,
    // );
  }

  Widget _phoneTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mobile number',
          style: TextStyle(
            color: Color(0xFF4B454D).withOpacity(0.75),
            fontSize: 11,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        CustomTextFormField(
          controller: _phoneController,
          hintText: authentication.user?.phone,
          hintStyle: TextStyle(color: AppColorScheme.onBlack),
          fillColor: AppColorScheme.backgroundLight,
          maxLength: 10,
          enabled: !_loading,
          filled: true,
          textInputType: TextInputType.number,
          suffix: widget.editable
              ? Icon(
                  Iconsax.send_2,
                  color: AppColorScheme.primaryColor,
                )
              : null,
          validator: FormBuilderValidators.compose([
            if (authentication.user?.phone == null)
              FormBuilderValidators.required(
                errorText: "required",
              ),
          ]),
        ),
        // Container(
        //   child: FormBuilderTextField(
        //     style: TextStyle(
        //       color: Color(0xFF4B454D),
        //       fontSize: 14,
        //       fontFamily: 'Poppins',
        //       fontWeight: FontWeight.w400,
        //     ),
        //     name: 'phone',
        //     maxLength: 10,
        //     maxLengthEnforcement: MaxLengthEnforcement.enforced,
        //     decoration: InputDecoration(
        //       suffixIcon: widget.editable
        //           ? Icon(
        //               Iconsax.send_2,
        //               color: AppColorScheme.primaryColor,
        //             )
        //           : null,
        //       fillColor: Color(0xFFF7F2FA),
        //       enabledBorder: OutlineInputBorder(
        //         borderSide: BorderSide(
        //           // width: 5,
        //           color: Color(0xFFF7F2FA),
        //         ),
        //         borderRadius: BorderRadius.circular(10.0),
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //         borderSide: BorderSide(
        //           // width: 5,
        //           color: Color(0xFFF7F2FA),
        //         ),
        //         borderRadius: BorderRadius.circular(10.0),
        //       ),
        //       // border:
        //       //     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        //       counter: Container(),
        //       hintText: translation.of("user.phone"),
        //       // prefixIcon: Icon(MdiIcons.phoneOutline,
        //       //     color: Theme.of(context).colorScheme.primary)
        //     ),
        //     initialValue: authentication.user?.phone,
        //     enabled: !_loading,
        //     readOnly: authentication.role != Role.CUSTOMER,
        //     textInputAction: TextInputAction.next,
        //     keyboardType: TextInputType.phone,
        //     validator: (value) {
        //       return Validate.phone(value);
        //     },
        //     onChanged: (value) {
        //       _formKey.currentState?.fields['phone']?.validate();
        //     },
        //   ),
        // ),
        if (widget.editable)
          InkWell(
            onTap: _otpBottom,
            child: Text(
              'OTP verification needed',
              style: TextStyle(
                color: AppColorScheme.primaryColor,
                fontSize: 11,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          )
      ],
    );
  }

  Future<void> _otpBottom() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.infinity,
            height: 235,
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
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Icon(Iconsax.arrow_left),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'OTP verification',
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
                  Divider(),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp("[a-zA-Z]"))
                    ],
                    scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    //controller: controller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "*Required";
                      } else {
                        return null;
                      }
                    },
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                            top: 15,
                            bottom: 15,
                            start: 13,
                          ),
                          child: Opacity(
                            opacity: 0.5,
                            child: SvgPicture.asset(
                              ThemeAssets.phoneLogo,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        hintText: "Enter OTP",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: AppColorScheme.textFieldHintColor,
                                fontFamily: 'Poppins'),
                        border: _border,
                        // enabledBorder: _border,
                        // focusedBorder: _border,
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
                        filled: true,
                        fillColor: Color(0xFFF7F2FA)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
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
                                translation.of("cancel"),
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
                              onPressed: () {},
                              child: Text(
                                "Continue",
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _emailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email address',
          style: TextStyle(
            color: Color(0xFF4B454D).withOpacity(0.75),
            fontSize: 11,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0.13,
            letterSpacing: 0.50,
          ),
        ),
        const SizedBox(height: 4),
        CustomTextFormField(
          controller: _emailController,
          hintText: authentication.user?.email,
          hintStyle: TextStyle(color: AppColorScheme.onBlack),
          fillColor: AppColorScheme.backgroundLight,
          enabled: !_loading,
          filled: true,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.email(),
            if (authentication.user?.email == null)
              FormBuilderValidators.required(
                errorText: "required",
              ),
          ]),
        )
        // Container(
        //   child: FormBuilderTextField(
        //     name: 'email',
        //     decoration: InputDecoration(
        //       fillColor: Color(0xFFF7F2FA),
        //       enabledBorder: OutlineInputBorder(
        //         borderSide: BorderSide(
        //           // width: 5,
        //           color: Color(0xFFF7F2FA),
        //         ),
        //         borderRadius: BorderRadius.circular(10.0),
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //         borderSide: BorderSide(
        //           // width: 5,
        //           color: Color(0xFFF7F2FA),
        //         ),
        //         borderRadius: BorderRadius.circular(10.0),
        //       ),
        //       // border:
        //       //     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        //       hintText: translation.of("user.email"),
        //       // prefixIcon: Icon(MdiIcons.emailOpenOutline,
        //       //     color: Theme.of(context).colorScheme.primary)
        //     ),
        //     initialValue: authentication.user?.email,
        //     enabled: !_loading,
        //     keyboardType: TextInputType.emailAddress,
        //     readOnly: authentication.role != Role.CUSTOMER,
        //     textInputAction: TextInputAction.done,
        //     validator: FormBuilderValidators.compose([
        //       FormBuilderValidators.required(),
        //       FormBuilderValidators.email(),
        //     ]),
        //     onChanged: (value) {
        //       _formKey.currentState?.fields['email']?.validate();
        //     },
        //   ),
        // ),
      ],
    );
  }

  // Widget _AddressTextField() {
  //   return FormBuilderTextField(
  //     keyboardType: TextInputType.multiline,
  //     minLines: 1,
  //     maxLines: 10,
  //     name: 'Address',
  //     decoration: InputDecoration(
  //         hintText: "Address (default)",
  //         prefixIcon: Icon(MdiIcons.homeOutline,
  //         color: Theme.of(context).colorScheme.primary)),
  //     enabled: !_loading,
  //     textInputAction: TextInputAction.next,
  //   );
  // }

  // Widget _PinCodeTextField() {
  //   return FormBuilderTextField(
  //     name: 'PinCode',
  //     decoration: InputDecoration(
  //         hintText: "PinCode",
  //         prefixIcon: Icon(MdiIcons.home,
  //             color: Theme.of(context).colorScheme.primary)),
  //     enabled: !_loading,
  //     textInputAction: TextInputAction.next,
  //   );
  // }

  void _showVerifyOtpDialog() {
    if (widget.editable) {
      showDialog(
        context: context,
        builder: (_) {
          return OtpVerificationDialog(
            otpInput: OtpInput(
              phone: authentication.user?.phone ?? "",
              otpType: OtpType.PHONE,
            ),
          );
        },
      ).then((value) {
        final otp = (value ?? "") as String;

        if (otp.isNotEmpty) {
          _updateProfile(otp);
        }
      });
    }
  }

  void _submitForm() {
    _updateProfile();
    // if (widget.editable && !_loading && _formKey.currentState!.validate()) {
    //   if (authentication.user?.phone !=
    //       _formKey.currentState!.fields['phone']!.value.trim().toString()) {
    //     // _sendOtp();
    //     _updateProfile();
    //   } else {
    //     _updateProfile();
    //   }
    // }
  }

  // void _sendOtp() {
  //   if (widget.editable && !_loading && _formKey.currentState!.validate()) {
  //     _profileBloc.add(SendOtp(
  //       otpInput: OtpInput(
  //         // phone:
  //         //     _formKey.currentState!.fields['phone']!.value.trim().toString(),
  //         phone: authentication.user?.phone ?? "",
  //         otpType: OtpType.PHONE,
  //       ),
  //     ));
  //
  //     setState(() {
  //       _loading = true;
  //     });
  //   }
  // }

  void _updateProfile([String? otp]) {
    if (widget.editable && !_loading && _formKey.currentState!.validate()) {
      final firstName = _firstNameController.text.isNotEmpty
          ? _firstNameController.text
          : authentication.user?.name;
      final lastName = _lastNameController.text.isNotEmpty
          ? _lastNameController.text
          : authentication.user?.lastname;
      final phone = _phoneController.text.isNotEmpty
          ? _phoneController.text
          : authentication.user?.phone;
      final email = _emailController.text.isNotEmpty
          ? _emailController.text
          : authentication.user?.email;

      // _formKey.currentState?.fields['email']?.value?.trim()?.toString();
      print(firstName);
      print(lastName);
      print(email);
      print(phone);

      final userUpdateInput = UserUpdateInput(
        name: authentication.user?.name != "${firstName!} "
            ? "${firstName} "
            : authentication.user?.name,
        lastname: "${lastName!}",
        phone: authentication.user?.phone != phone
            ? phone
            : authentication.user?.phone,
        email: authentication.user?.email != email
            ? email
            : authentication.user?.email,
      );

      // if (userUpdateInput.name != null ||
      //     userUpdateInput.phone != null ||
      //     userUpdateInput.email != null) {
      _profileBloc.add(UpdateProfile(
        userUpdateInput: userUpdateInput,
      ));

      setState(() {
        _loading = true;
      });
      // }
    }
  }
}
