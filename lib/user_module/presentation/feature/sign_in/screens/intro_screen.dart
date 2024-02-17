import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/base_module/presentation/feature/demo/screen/pasword_reset_mobile.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/text_form_field/custom_text_form_filed.dart';
import '../../../../../home/feature/home/screens/home_screen.dart';
import '../../authentication/blocs/authentication/authentication_bloc.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/presentation/component/app_icons/app_icon_large.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../base_module/presentation/feature/demo/screen/blocs/sign_in_send_otp/sign_in_sent_otp_state.dart';
import '../../../../../base_module/presentation/feature/demo/screen/otp_verification_screen.dart';
import '../../../../../base_module/presentation/feature/demo/screen/mobile_number_sign_up_screen.dart';
import '../blocs/sign_in/sign_in_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  late AuthenticationBloc _authenticationBloc;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadiusMin),
        borderSide: BorderSide(
          color: AppColorScheme.backgroundLight,
        ),
      );
  @override
  void initState() {
    super.initState();

    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

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
          child: BlocListener<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state is SignInSubmitting) {
                setState(() {
                  _isLoading = true;
                });
              }
              if (state is SignInSuccess) {
                setState(() {
                  _isLoading = false;
                });
                _authenticationBloc.add(SignedIn());
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (route) => false);
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(
                //       builder: (_) => HomeScreen(
                //           // phone: _phoneController.text,
                //           ),));
              } else if (state is SignInFailed) {
                setState(() {
                  _isLoading = false;
                });
                showErrorFlash(context: context, message: state.message);
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding * 1.2),
              child: Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    AppIconLarge(),
                    SizedBox(height: 162),
                    Container(
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign in',
                            style: TextStyle(
                              color: AppColorScheme.onBlack,
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Sign in to your account and start exploring!',
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
                    CustomTextFormField(
                      prefix: Padding(
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
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                      fillColor: AppColorScheme.backgroundLight,
                      filled: true,
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
                      hintText: "Mobile number",
                      hintStyle:
                          Theme.of(context).textTheme.subtitle2?.copyWith(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: AppColorScheme.textFieldHintColor,
                              ),
                      textInputType: TextInputType.numberWithOptions(),
                    ),

                    SizedBox(height: 15),
                    CustomTextFormField(
                      hintText: "Enter password",
                      hintStyle:
                          Theme.of(context).textTheme.subtitle2?.copyWith(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: AppColorScheme.textFieldHintColor,
                              ),
                      filled: true,
                      fillColor: AppColorScheme.backgroundLight,
                      controller: _passwordController,
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                      prefix: Padding(
                          padding: EdgeInsetsDirectional.only(
                            top: 15,
                            bottom: 15,
                            start: 13,
                          ),
                          child: Icon(Iconsax.lock)),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      width: 343,
                      child: Text(
                        'Login using mobile OTP',
                        style: TextStyle(
                          color: AppColorScheme.primaryColor,
                          fontSize: 10,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        return ValueListenableBuilder(
                          valueListenable: _phoneController,
                          builder: (context, TextEditingValue value, _) {
                            return InkWell(
                              onTap: () {
                                _onSubmit();
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
                                            color:
                                                AppColorScheme.onPrimaryLight,
                                          )
                                        : Text(
                                            "Sign in",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColorScheme
                                                        .onPrimaryLight,
                                                    fontFamily: 'Poppins'),
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
                    SizedBox(height: 18),
                    SizedBox(
                      //width: 343,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PaswordResetMobileNumber(),
                                ));
                          },
                          child: Text(
                            'Forgot Password ?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColorScheme.onBlack.withOpacity(0.50),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0.11,
                              letterSpacing: 0.50,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: SizedBox(
                        // width: 343,
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'New user ?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColorScheme.onBlack
                                              .withOpacity(0.5),
                                          fontSize: 12,
                                          fontFamily: 'Poppins'),
                                  //  TextStyle(
                                  //   color: AppColorScheme.onBlack.withOpacity(0.5),
                                  //   fontSize: 12,
                                  //   fontFamily: 'Poppins',
                                  //   fontWeight: FontWeight.w400,
                                  // ),
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
                                          fontFamily: 'Poppins'),
                                ),
                                TextSpan(
                                    text: 'Sign Up',
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
                                              builder: (context) =>
                                                  MobileNumberScreenForSignUp(),
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
      ),
    );
  }

  _onSubmit() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<SignInBloc>(context).add(
        SignIn(
            phone: _phoneController.text, password: _passwordController.text),
      );
    }
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
