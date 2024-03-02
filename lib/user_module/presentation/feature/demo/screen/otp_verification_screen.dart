import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_autofill/otp_autofill.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/app_icons/app_icon_large.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../sign_in/blocs/sign_in/sign_in_bloc.dart';
import '../../sign_up/blocs/otp_verification_bloc/otp_verification_bloc.dart';
import 'blocs/sign_in_send_otp/sign_in_sent_otp_bloc.dart';
import 'blocs/sign_in_send_otp/sign_in_sent_otp_event.dart';
import 'password_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phone;

  const OTPVerificationScreen({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  late OTPTextEditController controller;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadiusMin),
        borderSide: BorderSide(
          color: AppColorScheme.backgroundLight,
        ),
      );

  int _secondsRemaining = 30;
  late Timer _timer;
  late OTPInteractor _otpInteractor;

  @override
  void initState() {
    super.initState();
    _initInteractor();
    controller = OTPTextEditController(
      codeLength: 4,
      //ignore: avoid_print
      onCodeReceive: (code) => print('Your Application receive code - $code'),
      otpInteractor: _otpInteractor,
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{4})');
          debugPrint(exp.stringMatch(code ?? ''));
          return exp.stringMatch(code ?? '') ?? '';
        },
      );
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.stopListen();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).canvasColor,
      // AppColorScheme.backgroundColorLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
          child: BlocListener<OtpVerificationBloc, OtpVerificationState>(
            listener: (context, state) {
              if (state is OtpVerificationLoaded) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) =>
                          //LocationScreen()
                          //AddAddressScreen()
                          //SignUpScreen()
                          PasswordScreen(
                            phone: widget.phone,
                          )),
                  (route) => false,
                );
              } else if (state is OtpVerificationFailed) {
                showErrorFlash(context: context, message: state.message
                    //  == 'NOT_FOUND' || state.message == 'FAILED'
                    //     ? translation.of("user.invalid_credentials")
                    //     : state.message,
                    );
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => PasswordScreen(
                            phone: widget.phone,
                          )),
                  (route) => false,
                );
              }
            },
            child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 100),
                  // AppIconLarge(),
                  // SizedBox(height: 40),
                  // SizedBox(height: 40),
                  SizedBox(height: AppConstants.defaultPadding* 1.25),

                  AppIconLarge(),
                  SizedBox(height:AppConstants.defaultPadding* 11 ),
                  // Center(
                  //   child: Text(
                  //     "OTP verification",
                  //     style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  //           fontWeight: FontWeight.w600,
                  //           color: Theme.of(context)
                  //               .colorScheme
                  //               .onBackground
                  //               .withOpacity(0.5),
                  //         ),
                  //   ),
                  // ),
                  Container(
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translation.of("user.sign_up"),
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
                                    color: AppColorScheme.onBlack,
                                    fontSize: 22,
                                    
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Text(
                          translation.of('user.enter_otp_sent'),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
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
                  SizedBox(height: AppConstants.defaultPadding* 1.8),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp("[a-zA-Z]"))
                    ],
                    scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: controller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return translation.of("user.required");
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
                        hintText: translation.of('user.enter_otp'),
                        hintStyle: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(
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
                  SizedBox(height: AppConstants.defaultPadding* 0.85),
                  BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
                    builder: (context, state) {
                      return ValueListenableBuilder(
                        // valueListenable: _otpController,
                        valueListenable: controller,
                        builder: (context, TextEditingValue value, _) {
                          return InkWell(
                            onTap: () {
                              print(
                                  "OTP verification Screen${widget.phone}=${controller.text}");
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<OtpVerificationBloc>(context)
                                    .add(
                                  verifyOtp(
                                    phoneNumber: widget.phone,
                                    // otp: _otpController.text,
                                    otp: controller.text,
                                  ),
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: value.text.isNotEmpty
                                    ? AppColorScheme.primaryColor
                                    : AppColorScheme.grey,
                                borderRadius: BorderRadius.circular(AppConstants.cornerRadiusMin),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: state is SignInSubmitting
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
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: AppConstants.defaultPadding* 0.5),
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
                                      color: AppColorScheme.onBlack
                                          .withOpacity(0.5),
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
                                      color: AppColorScheme.onBlack
                                          .withOpacity(0.5),
                                      fontSize: 12,
                                      ),
                            ),
                            TextSpan(
                              text: translation.of("user.sign_in"),
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

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  _resetOtp() {
    BlocProvider.of<SignInSentOTPBloc>(context).add(
      SendOTP(
        phone: widget.phone,
      ),
    );
  }

  Future<void> _initInteractor() async {
    _otpInteractor = OTPInteractor();

    // You can receive your app signature by using this method.
    final appSignature = await _otpInteractor.getAppSignature();

    if (kDebugMode) {
      debugPrint('Your app signature: $appSignature');
    }
  }
}
