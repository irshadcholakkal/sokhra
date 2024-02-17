import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../base_module/presentation/util/validate.dart';
import '../../../../data/entity/input_models/otp_input.dart';
import '../../../../data/entity/input_models/otp_type.dart';
import '../blocs/profile/profile_bloc.dart';

class ForgotPasswordDialog extends StatefulWidget {
  @override
  _ForgotPasswordDialogState createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool _hasOtp = false;
  String _message = "";
  String _errorMessage = "";
  bool _loading = false;

  final _profileBloc = ProfileBloc();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      bloc: _profileBloc,
      listener: (context, state) {
        if (state is SendOtpSuccess) {
          setState(() {
            //  _hasOtp = state.response == "SUCCESS";
            _hasOtp = true;
            "SUCCESS" == true;
            //    if (state.response == "SUCCESS") {
            _message = translation.of("user.please_enter_otp");
            _errorMessage = "";
            // } else {
            //   _message = "";
            //   _errorMessage = translation.of("user.send_otp_failed");
            // }

            _loading = false;
          });
        } else if (state is SendOtpFailed) {
          setState(() {
            _hasOtp = false;
            _message = "";
            _errorMessage = state.message.contains("NOT_FOUND")
                ? translation.of("user.user_not_found")
                : translation.of("something_went_wrong");
            _loading = false;
          });
        } else if (state is ForgotPasswordSuccess) {
          showFlash(
            context: context,
            duration: const Duration(seconds: 2),
            builder: (_, controller) {
              return FlashAlert(
                flashController: controller,
                color: Colors.green,
                iconData: Icons.done,
                message: translation.of("user.password_changed"),
              );
            },
          );

          Navigator.maybePop(context);
        } else if (state is ForgotPasswordFailed) {
          setState(() {
            _hasOtp = false;
            _message = "";
            _errorMessage = state.message.contains("EXPIRED")
                ? translation.of("user.otp_expired")
                : translation.of("something_went_wrong");
            _loading = false;
          });
        }
      },
      child: Dialog(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
              vertical: AppConstants.defaultPadding,
            ),
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  Text(
                    translation.of("user.reset_password"),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const AppPadding(dividedBy: 2),
                  _emailTextField(),
                  const AppPadding(dividedBy: 2),
                  if (_hasOtp) ...[
                    _otpTextField(),
                    const AppPadding(dividedBy: 2),
                    _passwordTextField(),
                    const AppPadding(dividedBy: 2),
                    _confirmPasswordTextField(),
                    const AppPadding(dividedBy: 2),
                  ],
                  if (_message.isNotEmpty)
                    Text(
                      _message,
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.center,
                    )
                  else if (_errorMessage.isNotEmpty)
                    Text(
                      _errorMessage,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  const AppPadding(dividedBy: 2),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                      ),
                      child: _loading
                          ? const CupertinoActivityIndicator()
                          : Text(
                              _hasOtp
                                  ? translation.of("user.reset")
                                  : translation.of("user.send_otp"),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return FormBuilderTextField(
      name: 'email',
      decoration: InputDecoration(
          hintText: translation.of("user.email"),
          prefixIcon: Icon(MdiIcons.email,
              color: Theme.of(context).colorScheme.primary)),
      // decoration: InputDecoration(
      //   labelText: translation.of("user.phone"),
      //   prefixIcon: const Icon(MdiIcons.phoneOutline),
      // ),
      enabled: !_loading && !_hasOtp,
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      onChanged: (value) {
        _formKey.currentState?.fields['email']?.validate();
      },
      onSubmitted: (value) {
        _submitForm();
      },
    );
  }

  Widget _otpTextField() {
    return FormBuilderTextField(
      name: 'otp',
      decoration: InputDecoration(
          hintText: translation.of("user.otp"),
          prefixIcon: Icon(MdiIcons.apps,
              color: Theme.of(context).colorScheme.primary)),
      // decoration: InputDecoration(
      //   labelText: translation.of("user.otp"),
      //   prefixIcon: const Icon(MdiIcons.apps),
      // ),
      enabled: !_loading,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      onChanged: (value) {
        _formKey.currentState?.fields['otp']?.validate();
      },
    );
  }

  Widget _passwordTextField() {
    return FormBuilderTextField(
      name: 'password',
      decoration: InputDecoration(
          hintText: translation.of("user.new_password"),
          prefixIcon: Icon(MdiIcons.lockOutline,
              color: Theme.of(context).colorScheme.primary)),
      // decoration: InputDecoration(
      //   labelText: translation.of("user.new_password"),
      //   prefixIcon: const Icon(MdiIcons.lockOutline),
      // ),
      obscureText: true,
      enabled: !_loading,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validate.password(value);
      },
      onChanged: (value) {
        _formKey.currentState?.fields['password']?.validate();
      },
    );
  }

  Widget _confirmPasswordTextField() {
    return FormBuilderTextField(
      name: 'confirmPassword',
      decoration: InputDecoration(
          hintText: translation.of("user.confirm_password"),
          prefixIcon: Icon(MdiIcons.lockOutline,
              color: Theme.of(context).colorScheme.primary)),
      // decoration: InputDecoration(
      //   labelText: translation.of("user.confirm_password"),
      //   prefixIcon: const Icon(MdiIcons.lockOutline),
      // ),
      obscureText: true,
      enabled: !_loading,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validate.equal(
          _formKey.currentState?.fields['password']?.value?.trim()?.toString(),
          value,
        );
      },
      onChanged: (value) {
        _formKey.currentState?.fields['confirmPassword']?.validate();
      },
    );
  }

  void _submitForm() {
    if (!_loading && _formKey.currentState!.validate()) {
      if (_hasOtp) {
        _profileBloc.add(ForgotPassword(
          otpInput: OtpInput(
            email:
                _formKey.currentState!.fields['email']!.value.trim().toString(),
            otpType: OtpType.EMAIL,
          ),
          otp: _formKey.currentState!.fields['otp']!.value.toString().trim(),
          password: _formKey.currentState!.fields['password']!.value
              .toString()
              .trim(),
        ));
      } else {
        _profileBloc.add(SendOtp(
          otpInput: OtpInput(
            email:
                _formKey.currentState!.fields['email']!.value.trim().toString(),
            otpType: OtpType.EMAIL,
          ),
        ));
      }

      setState(() {
        _loading = true;
      });
    }
  }
}
