import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumiereorganics_app/base_module/presentation/feature/demo/screen/password_reset_otp.dart';

import '../../../../domain/entity/color_scheme.dart';
import '../../../component/app_icons/app_icon_large.dart';
import '../../../core/values/app_assets.dart';
import '../../../core/values/app_constants.dart';
import 'blocs/sign_in_send_otp/sign_in_sent_otp_bloc.dart';
import 'blocs/sign_in_send_otp/sign_in_sent_otp_event.dart';
import 'blocs/sign_in_send_otp/sign_in_sent_otp_state.dart';
import '../../../../../user_module/presentation/feature/sign_in/screens/intro_screen.dart';

class PaswordResetMobileNumber extends StatefulWidget {
  const PaswordResetMobileNumber({Key? key}) : super(key: key);

  @override
  State<PaswordResetMobileNumber> createState() => _PaswordResetMobileNumberState();
}

class _PaswordResetMobileNumberState extends State<PaswordResetMobileNumber> {
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
              if (state is OTPSentSuccessfully) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PasswordResetOtp(
                      phone: _phoneController.text,
                    ),
                  ),
                );
              }
              if (state is OTPSendingFailed) {}
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
                            'An OTP will be sent to your mobile number',

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
                  // Center(
                  //   child: Text(
                  //     "Log in or sign up",
                  //     style:
                  //         Theme.of(context).textTheme.subtitle2?.copyWith(
                  //               fontWeight: FontWeight.w600,
                  //               color: Theme.of(context)
                  //                   .colorScheme
                  //                   .onBackground
                  //                   .withOpacity(0.5),
                  //             ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      //vertical: 20.0,
                    ),
                    child: TextFormField(
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
                          return "*Required";
                        } else if (val.length > 10 || val.length < 10) {
                          return "*10 digit mobile number required";
                        } else {
                          return null;
                        }
                      },
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onBackground,
                          fontFamily: 'Poppins'),
                      decoration: InputDecoration(
                          counterText: "",
                          // prefixText: "+91  ",
                          // prefixStyle: Theme.of(context)
                          //     .textTheme
                          //     .subtitle2
                          //     ?.copyWith(
                          //       fontSize: 13.0,
                          //       fontWeight: FontWeight.w600,
                          //       color: Theme.of(context).colorScheme.onBackground,
                          //     ),
                          prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(
                              top: 15,
                              bottom: 15,
                              start: 13,
                            ),
                            child:
                                //Icon(Icons.call)
                                //  CustomNetworkImage(
                                //   height: 35,
                                //   width: 35,
                                //   svgAsset: ThemeAssets.phoneLogo,
                                //   opacity: 0.5,
                                // ),
                                Opacity(
                              opacity: 0.5,
                              child: SvgPicture.asset(
                                ThemeAssets.phoneLogo,
                                fit: BoxFit.contain,
                              ),
                            ),

                            //  Text(
                            //   "+91",
                            //   style:
                            //       Theme.of(context).textTheme.subtitle2?.copyWith(
                            //             fontSize: 13.0,
                            //             fontWeight: FontWeight.w600,
                            //             color: Theme.of(context)
                            //                 .colorScheme
                            //                 .onBackground,
                            //           ),
                            // ),
                          ),
                          hintText: "Mobile number",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: AppColorScheme.textFieldHintColor,
                                  fontFamily: 'Poppins'),
                          border: _border,
                          //enabledBorder: _border,
                          //focusedBorder: _border,
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

                  SizedBox(height: 15),
                
                  //SizedBox(height: 5),
                 

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
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<SignInSentOTPBloc>(context)
                                      .add(
                                    SendOTP(
                                      phone: _phoneController.text,
                                    ),
                                  );
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (_) => PasswordResetOtp(
                                  //       phone: _phoneController.text,
                                  //     ),
                                  //   ),
                                  // );
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
                                    child: state is SendOTPLoading
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
                                        recognizer: TapGestureRecognizer()..onTap=(){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(),));
                                        }
                               
                              ),
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
        builder: (_) => PasswordResetOtp(
          phone: _phoneController.text,
        ),
      ),
    );
  }
}
