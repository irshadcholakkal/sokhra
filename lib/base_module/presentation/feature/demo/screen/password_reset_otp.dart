import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumiereorganics_app/base_module/presentation/feature/demo/screen/password_screen.dart';
import 'package:lumiereorganics_app/base_module/presentation/feature/demo/screen/reset_new_password.dart';
import 'package:lumiereorganics_app/user_module/presentation/feature/sign_up/screens/signup_screen.dart';
import 'package:otp_autofill/otp_autofill.dart';

import '../../../../../home/feature/home/screens/location_screen.dart';
import '../../../../../user_module/presentation/feature/authentication/blocs/authentication/authentication_bloc.dart';
import '../../../../../user_module/presentation/feature/profile/screens/add_address_screen.dart';
import '../../../../../user_module/presentation/feature/sign_in/blocs/sign_in/sign_in_bloc.dart';
import '../../../../domain/entity/color_scheme.dart';
import '../../../../domain/entity/translation.dart';
import '../../../component/alerts/flash_alert.dart';
import '../../../component/app_icons/app_icon_large.dart';
import '../../../core/values/app_assets.dart';
import '../../../core/values/app_constants.dart';
import 'blocs/sign_in_send_otp/sign_in_sent_otp_bloc.dart';
import 'blocs/sign_in_send_otp/sign_in_sent_otp_event.dart';
import '../../../../../user_module/presentation/feature/sign_in/screens/intro_screen.dart';

class PasswordResetOtp extends StatefulWidget {
  final String phone;

  const PasswordResetOtp({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<PasswordResetOtp> createState() => _PasswordResetOtpState();
}

class _PasswordResetOtpState extends State<PasswordResetOtp> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  late OTPTextEditController controller;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
        borderSide: BorderSide(
          color: AppColorScheme.textFieldBorderColor,
          width: 1,
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
        // strategies: [
        // SampleStrategy(),
        // ],
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
      backgroundColor: AppColorScheme.backgroundColorLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocListener<SignInBloc, SignInState>(
            listener: (context, state) {
              //   if (state is SignInSuccess) {
              //     BlocProvider.of<AuthenticationBloc>(context).add(SignedIn());

              //     Navigator.of(context).pushAndRemoveUntil(
              //       MaterialPageRoute(builder: (_) =>
              //       //LocationScreen()
              //       AddAddressScreen()
              //      //SignUpScreen()
              //     // PasswordScreen()
              //       ),
              //       (route) => false,
              //     );
              //   } else if (state is SignInFailed) {
              //     showErrorFlash(
              //       context: context,
              //       message:
              //           state.message == 'NOT_FOUND' || state.message == 'FAILED'
              //               ? translation.of("user.invalid_credentials")
              //               : state.message,
              //     );
              //   }
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
                  SizedBox(height: 25),

                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: AppIconLarge(),
                  ),
                  SizedBox(height: 220),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            'Enter OTP',
                            style: TextStyle(
                              color: AppColorScheme.onBlack,
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            'Enter the OTP sent to your mobile number',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.5),
                                    fontFamily: 'Poppins'),
                          ),
                        )

                        // AppIconLarge(),
                        // SizedBox(height: 40),
                        // SvgPicture.asset(ThemeAssets.appCaptionSvg),
                      ],
                    ),
                  ),
                  SizedBox(height: 36),
                  Padding(
                    // padding: const EdgeInsets.symmetric(
                    //   horizontal: 25.0,
                    //   vertical: 20.0,
                    // ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    child: TextFormField(
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
                  ),

                  SizedBox(height: 17),
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      return ValueListenableBuilder(
                        // valueListenable: _otpController,
                        valueListenable: controller,
                        builder: (context, TextEditingValue value, _) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                // if (_formKey.currentState!.validate()) {
                                //   BlocProvider.of<SignInBloc>(context).add(
                                //     SignIn(
                                //       phone: widget.phone,
                                //       // otp: _otpController.text,
                                //       otp: controller.text,
                                //     ),
                                //   );
                                // }
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ResetNewPassword(),));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: value.text.isNotEmpty
                                      ? AppColorScheme.primaryColor
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(11.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: state is SignInSubmitting
                                        ? CupertinoActivityIndicator(
                                            color: AppColorScheme.onPrimaryLight,
                                          )
                                        : Text(
                                            "Reset",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColorScheme.onPrimaryLight,
                                                ),
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
                  // SizedBox(height: 10),

                  SizedBox(height: 12),

                  Center(
                    child: SizedBox(
                      // width: 343,
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Know password ?',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColorScheme.onBlack.withOpacity(0.5),
                                        fontSize: 12,
                                        fontFamily: 'Poppins'),
                              ),
                              TextSpan(
                                text: ' ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColorScheme.onBlack.withOpacity(0.5),
                                        fontSize: 12,
                                        fontFamily: 'Poppins'),
                              ),
                              TextSpan(
                                  text: 'Sign in',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColorScheme.primaryColor,
                                          fontSize: 12,
                                          fontFamily: 'Poppins'),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SignInPage(),
                                          ));
                                    }),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
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
