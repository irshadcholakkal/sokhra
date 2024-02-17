import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/base_module/presentation/component/images/custom_network_image.dart';
import 'package:lumiereorganics_app/base_module/presentation/feature/demo/screen/pasword_reset_mobile.dart';
import 'package:lumiereorganics_app/base_module/presentation/feature/demo/widgets/toggle_button_demo.dart';

import '../../../../domain/entity/color_scheme.dart';
import '../../../component/app_icons/app_icon_large.dart';
import '../../../core/values/app_assets.dart';
import '../../../core/values/app_constants.dart';
import 'blocs/sign_in_send_otp/sign_in_sent_otp_bloc.dart';
import 'blocs/sign_in_send_otp/sign_in_sent_otp_event.dart';
import 'blocs/sign_in_send_otp/sign_in_sent_otp_state.dart';
import '../../../../../user_module/presentation/feature/sign_in/screens/intro_screen.dart';
import 'otp_verification_screen.dart';

class ResetNewPassword extends StatefulWidget {
  const ResetNewPassword({Key? key}) : super(key: key);

  @override
  State<ResetNewPassword> createState() => _ResetNewPasswordState();
}

class _ResetNewPasswordState extends State<ResetNewPassword> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
        borderSide: BorderSide(
          color: AppColorScheme.textFieldBorderColor,
          width: 1,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: AppIconLarge( ),
      //   toolbarHeight: 100,
      // ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocListener<SignInSentOTPBloc, SignInSentOTPState>(
            listener: (context, state) {
              // if (state is OTPSentSuccessfully) {
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (_) => OTPVerificationScreen(
              //         phone: _phoneController.text,
              //       ),
              //     ),
              //   );
              // }
              // if (state is OTPSendingFailed) {}
            },
            child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: AppIconLarge(),
                  ),
                  SizedBox(height: 162),
                  Container(
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            'Reset password',
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
                            'Enter your new password',
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
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      //controller: controller,

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
                              child: Icon(Iconsax.lock)),
                          hintText: "Enter password",
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
                  SizedBox(height: 5),
                  Padding(
                    // padding: const EdgeInsets.symmetric(
                    //   horizontal: 25.0,
                    //   vertical: 20.0,
                    // ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    child: TextFormField(
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      //controller: controller,

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
                              child: Icon(Iconsax.lock)),
                          hintText: "Confirm password",
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
                  SizedBox(
                    height: 17,
                  ),
                  BlocBuilder<SignInSentOTPBloc, SignInSentOTPState>(
                    builder: (context, state) {
                      return ValueListenableBuilder(
                        valueListenable: _phoneController,
                        builder: (context, TextEditingValue value, _) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                // if (_formKey.currentState!.validate()) {
                                //   BlocProvider.of<SignInSentOTPBloc>(context)
                                //       .add(
                                //     SendOTP(
                                //       phone: _phoneController.text,
                                //     ),
                                //   );
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (_) => OTPVerificationScreen(
                                //       phone: _phoneController.text,
                                //     ),
                                //   ),

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInPage()),
                                  (route) => false,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColorScheme.primaryColor,
                                  borderRadius: BorderRadius.circular(11.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    // child: state is SendOTPLoading
                                    //     ? CupertinoActivityIndicator(
                                    //         color: AppColorScheme.onPrimaryLight,
                                    //       )
                                    // :
                                    child: Text(
                                      "Continue",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: AppColorScheme.onPrimaryLight,
                                              fontFamily: 'Poppins'),
                                    ),
                                  ),
                                  // >>>>>>> b3cf74574a006aa712d2b41e05012ab69329e5e1
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 17),
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
