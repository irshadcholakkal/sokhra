import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/app_icons/app_icon_large.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../sign_in/screens/intro_screen.dart';
import '../../sign_up/blocs/send_otp_bloc/send_otp_bloc.dart';
import 'otp_verification_screen.dart';

class MobileNumberScreenForSignUp extends StatefulWidget {
  const MobileNumberScreenForSignUp({Key? key}) : super(key: key);
  @override
  State<MobileNumberScreenForSignUp> createState() =>
      _MobileNumberScreenForSignUpState();
}

class _MobileNumberScreenForSignUpState
    extends State<MobileNumberScreenForSignUp> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadiusMin),
        borderSide: BorderSide(
          color: AppColorScheme.backgroundLight,
        ),
      );
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: BlocListener<SendOtpBloc, SendOtpState>(
            listener: (context, state) {
              if (state is SendOtpLoaded) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => OTPVerificationScreen(
                      phone: _phoneController.text,
                    ),
                  ),
                );
              }
              if (state is SendOtpFailed) {
                print("OTP send failed");
              }
            },
            child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppPadding(
                    multipliedBy: 1.25,
                  ),
                  AppIconLarge(),
                  AppPadding(
                    multipliedBy: 8.1,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(translation.of("user.sign_up"),
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: AppColorScheme.onBlack,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    )),
                        Text(
                          translation.of(
                              "user.an_OTP_will_be_sent_to_your_mobile_number"),
                          style:
                              Theme.of(context).textTheme.subtitle2?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.5),
                                  ),
                        )
                      ],
                    ),
                  ),
                  AppPadding(
                    multipliedBy: 1.8,
                  ),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp("[a-zA-Z]"))
                    ],
                    scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    maxLength: 10,
                    controller: _phoneController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return translation.of("user.required");
                      } else if (val.length > 10 || val.length < 10) {
                        return translation
                            .of("user.10_digit_mobile_number_required");
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
                        counterText: "",
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
                        hintText: translation.of("user.mobile_number"),
                        hintStyle:
                            Theme.of(context).textTheme.subtitle2?.copyWith(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: AppColorScheme.textFieldHintColor,
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
                        filled: true,
                        fillColor: AppColorScheme.backgroundLight),
                  ),
                  AppPadding(),
                  BlocBuilder<SendOtpBloc, SendOtpState>(
                    builder: (context, state) {
                      return ValueListenableBuilder(
                        valueListenable: _phoneController,
                        builder: (context, TextEditingValue value, _) {
                          return InkWell(
                            onTap: () {
                              print(_phoneController.text);
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<SendOtpBloc>(context).add(
                                  SendOtp(
                                    phoneNumber: _phoneController.text,
                                  ),
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: value.text.isNotEmpty
                                    ? AppColorScheme.primaryColor
                                    : AppColorScheme.disabledColor,
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: state is SendOtpLoading
                                      ? CupertinoActivityIndicator(
                                          color: AppColorScheme
                                              .backgroundColorLight,
                                        )
                                      : Text(
                                          translation.of("user.continue"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColorScheme
                                                    .backgroundColorLight,
                                              ),
                                        ),
                                ),
                                // >>>>>>> b3cf74574a006aa712d2b41e05012ab69329e5e1
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  AppPadding(),
                  Center(
                    child: SizedBox(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: translation.of("user.already_a_user"),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        AppColorScheme.onBlack.withOpacity(0.5),
                                    fontSize: 12,
                                  ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        AppColorScheme.onBlack.withOpacity(0.5),
                                    fontSize: 12,
                                  ),
                            ),
                            TextSpan(
                              text: translation.of("user.sign_in"),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignInPage(),
                                      ));
                                },
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColorScheme.primaryColor,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _navigateToOtpScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => OTPVerificationScreen(
          phone: _phoneController.text,
        ),
      ),
    );
  }
}
