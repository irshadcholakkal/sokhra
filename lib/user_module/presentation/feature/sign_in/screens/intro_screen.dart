import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/user_module/presentation/feature/demo/screen/pasword_reset_mobile.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/text_form_field/custom_text_form_filed.dart';
import '../../../../../home/feature/home/screens/home_screen.dart';
import '../../authentication/blocs/authentication/authentication_bloc.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/presentation/component/app_icons/app_icon_large.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../demo/screen/blocs/sign_in_send_otp/sign_in_sent_otp_state.dart';
import '../../demo/screen/otp_verification_screen.dart';
import '../../demo/screen/mobile_number_sign_up_screen.dart';
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
  void dispose() {
    
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                           translation.of("user.sign_in"),
                            style:Theme.of(context).textTheme.subtitle1?.copyWith(
                               color: AppColorScheme.onBlack,
                              fontSize: 22,
                              
                              fontWeight: FontWeight.w500,

                            )
                            
                              ),
                          Text(
                            translation.of("user.start_exploring"),
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
                    SizedBox(height: AppConstants.defaultPadding*1.8),
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
                          return translation.of("user.required");
                        } else if (val.length > 10 || val.length < 10) {
                          return translation.of("user.10_digit_mobile_number_required");
                        } else {
                          return null;
                        }
                      },
                      hintText: translation.of("user.mobile_number"),
                      hintStyle:
                          Theme.of(context).textTheme.subtitle2?.copyWith(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: AppColorScheme.textFieldHintColor,
                              ),
                      textInputType: TextInputType.numberWithOptions(),
                    ),

                    SizedBox(height: AppConstants.defaultPadding*0.75),
                    CustomTextFormField(
                      hintText: translation.of("user.enter_password"),
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
                    SizedBox(height: AppConstants.defaultPadding* 0.25),
                    SizedBox(
                      width: 343,
                      child: Text(
                        translation.of("user.login_using_mobile_OTP"),
                        style: TextStyle(
                          color: AppColorScheme.primaryColor,
                          fontSize: 10,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.defaultPadding* 0.85,
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
                                            translation.of("user.sign_in"),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColorScheme
                                                        .onPrimaryLight,
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
                    SizedBox(height: AppConstants.defaultPadding* 0.9),
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
                            translation.of("user.forgot_password"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColorScheme.onBlack.withOpacity(0.50),
                              fontSize: 12,
                              
                              fontWeight: FontWeight.w400,
                             // height: 0.11,
                              letterSpacing: 0.50,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: AppConstants.defaultPadding* 0.4
                    ),
                    Center(
                      child: SizedBox(
                        // width: 343,
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: translation.of("user.new_user"),
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
                                    text: translation.of("user.signup"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColorScheme.primaryColor,
                                            fontSize: 12,
                                           ),
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
