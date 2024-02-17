import 'package:code_fields/code_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../data/entity/input_models/otp_input.dart';
import '../../sign_up/blocs/sign_up/sign_up_bloc.dart';

import '../blocs/profile/profile_bloc.dart';
import 'otp_timer.dart';

class OtpVerificationDialog extends StatefulWidget {
  final OtpInput otpInput;
  final bool isProfile;

  const OtpVerificationDialog({
    Key? key,
    required this.otpInput,
    this.isProfile = true,
  }) : super(key: key);

  @override
  _OtpVerificationDialogState createState() => _OtpVerificationDialogState();
}

class _OtpVerificationDialogState extends State<OtpVerificationDialog> {
  String? _otp;
  String _message = "";
  String _errorMessage = "";
  bool _loading = false;

  final _signUpBloc = SignUpBloc();
  final _profileBloc = ProfileBloc();

  @override
  Widget build(BuildContext context) {
    return widget.isProfile
        ? BlocListener<ProfileBloc, ProfileState>(
            bloc: _profileBloc,
            listener: (context, state) {
              if (state is SendOtpSuccess) {
                setState(() {
                  _message = "";
                  _errorMessage = "";
                  _loading = false;
                });
              } else if (state is SendOtpFailed) {
                setState(() {
                  _message = "";
                  _errorMessage = state.message.contains("NOT_FOUND")
                      ? translation.of("user.user_not_found")
                      : translation.of("something_went_wrong");
                  _loading = false;
                });
              }
            },
            child: _content(),
          )
        : BlocListener<SignUpBloc, SignUpState>(
            bloc: _signUpBloc,
            listener: (context, state) {
              if (state is SendSignUpOtpSuccess) {
                setState(() {
                  _message = translation.of("user.please_enter_otp");
                  _errorMessage = "";
                  _loading = false;
                });
              } else if (state is SendSignUpOtpFailed) {
                setState(() {
                  _message = "";
                  _errorMessage = state.message.contains("FAILED")
                      ? translation.of("user.send_otp_failed")
                      : translation.of("something_went_wrong");
                  _loading = false;
                });
              }
            },
            child: _content(),
          );
  }

  Widget _content() {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding / 2,
            vertical: AppConstants.defaultPadding,
          ),
          child: Column(
            children: [
              Text(
                translation.of("user.otp_verification"),
                style: Theme.of(context).textTheme.headline6,
              ),
              const AppPadding(dividedBy: 2),
              Text(
                translation.of("user.please_enter_otp"),
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
              const AppPadding(dividedBy: 2),
              SizedBox(
                width: double.maxFinite,
                child: CodeFields(
                  length: 6,
                  fieldHeight: 40,
                  fieldWidth: 40,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  inputDecoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(4),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppConstants.cornerRadius,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppConstants.cornerRadius,
                      ),
                    ),
                  ),
                  textStyle: Theme.of(context).textTheme.subtitle1,
                  onChanged: (value) {
                    _otp = value;
                  },
                  onCompleted: (value) {},
                ),
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
                          translation.of("user.verify"),
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
              const AppPadding(dividedBy: 2),
              if (_loading)
                const CupertinoActivityIndicator()
              else
                OtpTimer(onTap: _resendSignUpOtp),
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
            ],
          ),
        ),
      ),
    );
  }

  void _resendSignUpOtp() {
    if (!_loading) {
      widget.isProfile
          ? _profileBloc.add(SendOtp(
              otpInput: widget.otpInput,
            ))
          : _signUpBloc.add(SendSignUpOtp(
              otpInput: widget.otpInput,
            ));

      setState(() {
        _message = "";
        _errorMessage = "";
        _loading = true;
      });
    }
  }

  void _submitForm() {
    if (!_loading) {
      final otp = _otp ?? "";

      if (otp.isNotEmpty) {
        Navigator.pop(context, otp);
      }
    }
  }
}
