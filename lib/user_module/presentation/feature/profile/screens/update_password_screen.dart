import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/component/text_form_field/custom_text_form_filed.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../blocs/profile/profile_bloc.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool _loading = false;
  TextEditingController _currentPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  final _profileBloc = ProfileBloc();
  bool _isNewPasswordVisible = false;
  bool _isCurrentPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColorScheme.surfaceColorLight,
      appBar: SimpleAppBar(title: 
      translation.of('user.my_account')
      //'My Account'
      ),
      body: Container(
        constraints: const BoxConstraints(maxWidth: 380),
        margin: EdgeInsets.all(20),
        // padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // constraints: const BoxConstraints(maxWidth: 380),
              // padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: BlocListener<ProfileBloc, ProfileState>(
                bloc: _profileBloc,
                listener: (context, state) {
                  if (state is UpdatePasswordSuccess) {
                    showFlash(
                      context: context,
                      duration: const Duration(seconds: 2),
                      builder: (_, controller) {
                        return FlashAlert(
                          flashController: controller,
                          color: AppColorScheme.primaryColor,
                          iconData: Icons.done,
                          message: translation.of("user.password_changed"),
                        );
                      },
                    );

                    setState(() {
                      _loading = false;
                      _formKey.currentState?.reset();
                    });
                  } else if (state is UpdatePasswordFailed) {
                    showFlash(
                      context: context,
                      duration: const Duration(seconds: 2),
                      builder: (_, controller) {
                        return FlashAlert(
                          flashController: controller,
                          color: Theme.of(context).colorScheme.error,
                          iconData: Icons.error,
                          message: state.message.contains('WRONG_PASSWORD')
                              ? translation.of("user.wrong_password")
                              : state.message,
                        );
                      },
                    );

                    setState(() {
                      _loading = false;
                    });
                  }
                },
                child: FormBuilder(
                  key: _formKey,
                  enabled: !_loading,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              translation.of("change_password"),
                              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                color: Color(0xFF1D1B1E),
                                fontSize: 16,
                                fontFamily: AppConstants.defaultFont,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Divider(
                              thickness: 0.50,
                            ),
                            const AppPadding(),
                            _currentPasswordTextField(),
                            const AppPadding(dividedBy: 2),
                            _passwordTextField(),
                            const AppPadding(dividedBy: 2),
                            _confirmPasswordTextField(),
                            const AppPadding(),
                            // const AppPadding(multipliedBy: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   // width: double.infinity,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       ElevatedButton(
            //           onPressed: () {
            //             Navigator.pop(context);
            //           },
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor:
            //                 Color(0xFFF7F2FA),
            //           ),
            //           child: Text(
            //             translation.of("cancel").toUpperCase(),
            //             textAlign: TextAlign.center,
            //             style: Theme.of(context).textTheme.subtitle1?.copyWith(
            //               color: AppColorScheme.primaryColor,
            //               fontSize: 16,
            //               fontFamily: AppConstants.defaultFont,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           )),
            //       ElevatedButton(
            //         onPressed: _submitForm,
            //         child: _loading
            //             ? const CupertinoActivityIndicator()
            //             : Text(
            //                 translation.of("save").toUpperCase(),
            //                 textAlign: TextAlign.center,
            //                 style: Theme.of(context).textTheme.subtitle1?.copyWith(
            //                   //color: AppColorScheme.primaryColor,
            //                   fontSize: 16,
            //                   fontFamily: AppConstants.defaultFont,
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //               ),
            //       ),
            //     ],
            //   ),
            // ),

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
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: AppColorScheme.primaryColor,
                            fontSize: 14,
                            fontFamily: AppConstants.defaultFont,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppConstants.defaultPadding*0.8), 
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            AppColorScheme.primaryColor,
                          ),
                        ),
                        onPressed: _submitForm,
                        child: _loading
                            ? const CupertinoActivityIndicator()
                            : Text(
                                translation.of("save"),
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                  color: AppColorScheme.onPrimaryLight,
                                  fontSize: 14,
                                  fontFamily: AppConstants.defaultFont,
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
    );
  }

  Widget _currentPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translation.of('user.current_password'),
          //'Current password',
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: AppColorScheme.inActive.withOpacity(0.75),
            fontSize: 11,
            fontFamily: AppConstants.defaultFont,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: AppConstants.defaultPadding*0.2,
        ),
        CustomTextFormField(
          controller: _currentPassword,
          hintText: translation.of("user.current_password"),
          hintStyle:
              Theme.of(context).textTheme.subtitle1?.copyWith(color: AppColorScheme.grey, fontFamily: "Poppins"),
          fillColor: AppColorScheme.backgroundLight,
          enabled: !_loading,
          obscureText: !_isCurrentPasswordVisible,
          filled: true,
          suffix: IconButton(
              onPressed: () {
                setState(() {
                  _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                });
              },
              icon: Icon(
                  _isCurrentPasswordVisible ? Iconsax.eye_slash : Iconsax.eye)),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: translation.of('user.required'),
            ),
          ]),
        )
        //     FormBuilderTextField(
        //       style: Theme.of(context).textTheme.subtitle1?.copyWith(
        //         color: AppColorScheme.inActive,
        //         fontSize: 14,
        //         fontFamily: AppConstants.defaultFont,
        //         fontWeight: FontWeight.w400,
        //       ),
        //       name: 'currentPassword',
        //       decoration: InputDecoration(
        //           fillColor: Color(0xFFF7F2FA),
        //           enabledBorder:
        //           OutlineInputBorder(
        //   borderSide:
        //       BorderSide(
        //      // width: 5,
        //       color: Color(0xFFF7F2FA),),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        // focusedBorder:  OutlineInputBorder(
        //   borderSide:
        //       BorderSide(
        //      // width: 5,
        //       color: Color(0xFFF7F2FA),),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        //           //border:OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
        //           hintText: translation.of("user.current_password"),
        //           // prefixIcon: Icon(
        //           //   MdiIcons.lockOutline,
        //           //   color: Theme.of(context).colorScheme.primary,
        //           // ),
        //           suffixIcon: IconButton(
        //               onPressed: () {
        //                 setState(() {
        //                   _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
        //                 });
        //               },
        //               icon: Icon(_isCurrentPasswordVisible
        //                   ? Iconsax.eye_slash
        //                   : Iconsax.eye))),
        //       // decoration: InputDecoration(
        //       //   labelText: translation.of("user.current_password"),
        //       //   prefixIcon: const Icon(MdiIcons.lockOutline),
        //       // ),
        //       obscureText: !_isCurrentPasswordVisible,
        //       obscuringCharacter: '*',
        //       textInputAction: TextInputAction.next,
        //       validator: FormBuilderValidators.compose([
        //         FormBuilderValidators.required(),
        //       ]),
        //       onChanged: (value) {
        //         _formKey.currentState?.fields['currentPassword']?.validate();
        //       },
        //     ),
      ],
    );
  }

  Widget _passwordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translation.of("user.new_password"),
          //'New password',
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: AppColorScheme.inActive.withOpacity(0.75),
            fontSize: 11,
            fontFamily: AppConstants.defaultFont,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        CustomTextFormField(
          controller: _newPassword,
          hintText: translation.of("user.new_password"),
          hintStyle:
              Theme.of(context).textTheme.subtitle1?.copyWith(color: AppColorScheme.grey, fontFamily:AppConstants.defaultFont),
          fillColor: AppColorScheme.backgroundLight,
          enabled: !_loading,
          obscureText: !_isNewPasswordVisible,
          filled: true,
          suffix: IconButton(
              onPressed: () {
                setState(() {
                  _isNewPasswordVisible = !_isNewPasswordVisible;
                });
              },
              icon: Icon(
                  _isNewPasswordVisible ? Iconsax.eye_slash : Iconsax.eye)),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: translation.of('user.required'),
            ),
          ]),
        )
        //     FormBuilderTextField(
        //       style: Theme.of(context).textTheme.subtitle1?.copyWith(
        //         color: AppColorScheme.inActive,
        //         fontSize: 14,
        //         fontFamily: AppConstants.defaultFont,
        //         fontWeight: FontWeight.w400,
        //       ),
        //       name: 'password',
        //       decoration: InputDecoration(
        //           fillColor: Color(0xFFF7F2FA),
        //           enabledBorder:
        //           OutlineInputBorder(
        //   borderSide:
        //       BorderSide(
        //      // width: 5,
        //       color: Color(0xFFF7F2FA),),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        // focusedBorder:  OutlineInputBorder(
        //   borderSide:
        //       BorderSide(
        //      // width: 5,
        //       color: Color(0xFFF7F2FA),),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        //           // border:
        //           //     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        //           hintText: translation.of("user.new_password"),
        //           // prefixIcon: Icon(
        //           //   MdiIcons.lockOutline,
        //           //   color: Theme.of(context).colorScheme.primary,
        //           // ),
        //           suffixIcon: IconButton(
        //               onPressed: () {
        //                 setState(() {
        //                   _isNewPasswordVisible = !_isNewPasswordVisible;
        //                 });
        //               },
        //               icon: Icon(_isNewPasswordVisible
        //                   ? Iconsax.eye_slash
        //                   : Iconsax.eye))),
        //       // decoration: InputDecoration(
        //       //   labelText: translation.of("user.new_password"),
        //       //   prefixIcon: const Icon(MdiIcons.lockOutline),
        //       // ),
        //       obscureText: !_isNewPasswordVisible,
        //       obscuringCharacter: "*",
        //       textInputAction: TextInputAction.next,
        //       validator: (value) {
        //         return Validate.password(value);
        //       },
        //       onChanged: (value) {
        //         _formKey.currentState?.fields['password']?.validate();
        //       },
        //     ),
      ],
    );
  }

  Widget _confirmPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translation.of("user.confirm_password"),
          //'Confirm password',
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: AppColorScheme.inActive.withOpacity(0.75),
            fontSize: 11,
            fontFamily: AppConstants.defaultFont,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        CustomTextFormField(
          controller: _confirmPassword,
          hintText: translation.of("user.confirm_password"),
          hintStyle:
              Theme.of(context).textTheme.subtitle1?.copyWith(color: AppColorScheme.grey, fontFamily: AppConstants.defaultFont),
          fillColor: AppColorScheme.backgroundLight,
          enabled: !_loading,
          obscureText: !_isConfirmPasswordVisible,
          filled: true,
          suffix: IconButton(
              onPressed: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
              icon: Icon(
                  _isConfirmPasswordVisible ? Iconsax.eye_slash : Iconsax.eye)),
          validator: FormBuilderValidators.compose([
            (value) {
              if (value != _newPassword.text) {
                return translation.of('user.invalid_password');
                //'Passwords do not match';
              }
              return null;
            },
            FormBuilderValidators.required(
              errorText: translation.of('user.confirm_password_is_required'),
            ),
          ]),
        )
        //     FormBuilderTextField(
        //       style: Theme.of(context).textTheme.subtitle1?.copyWith(
        //         color: AppColorScheme.inActive,
        //         fontSize: 14,
        //         fontFamily: AppConstants.defaultFont,
        //         fontWeight: FontWeight.w400,
        //       ),
        //       name: 'confirmPassword',
        //       decoration: InputDecoration(
        //           fillColor: Color(0xFFF7F2FA),
        //           enabledBorder:
        //           OutlineInputBorder(
        //   borderSide:
        //       BorderSide(
        //      // width: 5,
        //       color: Color(0xFFF7F2FA),),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        // focusedBorder:  OutlineInputBorder(
        //   borderSide:
        //       BorderSide(
        //      // width: 5,
        //       color: Color(0xFFF7F2FA),),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        //           // border:
        //           //     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        //           hintText: translation.of("user.confirm_password"),
        //           // prefixIcon: Icon(
        //           //   MdiIcons.lockOutline,
        //           //   color: Theme.of(context).colorScheme.primary,
        //           // )
        //           suffixIcon: IconButton(
        //               onPressed: () {
        //                 setState(() {
        //                   _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
        //                 });
        //               },
        //               icon: Icon(_isConfirmPasswordVisible
        //                   ? Iconsax.eye_slash
        //                   : Iconsax.eye))),
        //       // decoration: InputDecoration(
        //       //   labelText: translation.of("user.confirm_password"),
        //       //   prefixIcon: const Icon(MdiIcons.lockOutline),
        //       // ),
        //       obscureText: !_isConfirmPasswordVisible,
        //       obscuringCharacter: "*",
        //       textInputAction: TextInputAction.done,
        //       validator: (value) {
        //         return Validate.equal(
        //           _formKey.currentState?.fields['password']?.value
        //               ?.trim()
        //               ?.toString(),
        //           value,
        //         );
        //       },
        //       onChanged: (value) {
        //         _formKey.currentState?.fields['confirmPassword']?.validate();
        //       },
        //     ),
      ],
    );
  }

  void _submitForm() {
    if (!_loading && _formKey.currentState!.validate()) {
      final currentPassword = _currentPassword.text;
      // _formKey.currentState?.fields['currentPassword']?.value.trim().toString();
      final newPassword = _confirmPassword.text;
      //_formKey.currentState?.fields['password']?.value.trim().toString();

      if (newPassword != currentPassword) {
        _profileBloc.add(UpdatePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        ));

        setState(() {
          _loading = true;
        });
      }
    }
  }
}
