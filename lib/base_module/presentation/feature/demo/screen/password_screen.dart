import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/base_module/presentation/component/app_icons/app_icon_large.dart';
import 'package:lumiereorganics_app/base_module/presentation/core/values/app_constants.dart';
import 'package:lumiereorganics_app/user_module/presentation/feature/sign_in/screens/intro_screen.dart';
import 'package:lumiereorganics_app/base_module/presentation/feature/demo/screen/mobile_number_sign_up_screen.dart';
import 'package:lumiereorganics_app/user_module/presentation/feature/sign_up/screens/signup_screen.dart';

import '../../../../../user_module/data/entity/input_models/sign_up_input.dart';
import '../../../../../user_module/presentation/feature/authentication/blocs/authentication/authentication_bloc.dart';
import '../../../../../user_module/presentation/feature/sign_up/blocs/sign_up/sign_up_bloc.dart';
import '../../../../domain/entity/color_scheme.dart';
import '../../../component/alerts/flash_alert.dart';
import '../../../component/text_form_field/custom_text_form_filed.dart';
import '../../../core/values/app_assets.dart';

class PasswordScreen extends StatefulWidget {
  final String phone;
  const PasswordScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadiusMin),
        borderSide: BorderSide(
          color: AppColorScheme.backgroundLight,
        ),
      );
  final _signUpBloc = SignUpBloc();
  late AuthenticationBloc _authenticationBloc;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
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
        child: Form(
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
                        'Create account',
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
                        'Enter a strong password',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
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
              SizedBox(height: AppConstants.defaultPadding * 1.8),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: CustomTextFormField(
                    controller: _passwordController,
                    hintText: "Enter password",
                    hintStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColorScheme.textFieldHintColor,
                        fontFamily: 'Poppins'),
                    fillColor: AppColorScheme.backgroundLight,
                    // enabled: !_loading,
                    // obscureText: !_isCurrentPasswordVisible,

                    filled: true,
                    // suffix: IconButton(
                    //         onPressed: () {
                    //           setState(() {
                    //             _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                    //           });
                    //         },
                    //         icon: Icon(_isCurrentPasswordVisible
                    //             ? Iconsax.eye_slash
                    //             : Iconsax.eye)),

                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.minLength(8,
                          errorText:
                              "Password must be at least 8 characters long."),
                      FormBuilderValidators.required(
                        errorText: "required",
                      ),
                    ]),
                  )),
              SizedBox(
                height: 16,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: CustomTextFormField(
                    controller: _confirmPasswordController,
                    hintText: "Confirm Password",
                    hintStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColorScheme.textFieldHintColor,
                        fontFamily: 'Poppins'),
                    fillColor: AppColorScheme.backgroundLight,
                    // enabled: !_loading,
                    // obscureText: !_isCurrentPasswordVisible,
                    // suffix: IconButton(
                    //         onPressed: () {
                    //           setState(() {
                    //             _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                    //           });
                    //         },
                    //         icon: Icon(_isCurrentPasswordVisible
                    //             ? Iconsax.eye_slash
                    //             : Iconsax.eye)),
                    filled: true,
                    validator: FormBuilderValidators.compose([
                      (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      FormBuilderValidators.minLength(8,
                          errorText:
                              "Password must be at least 8 characters long."),
                      FormBuilderValidators.required(
                        errorText: "required",
                      ),
                    ]),
                  )),
              SizedBox(height: AppConstants.defaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: InkWell(
                  onTap: _navigateToNext,
                  child: Container(
                    width: 352,
                    height: 56,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: AppColorScheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColorScheme.onPrimaryLight,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: SizedBox(
                  // width: 343,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already a user ?',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color:
                                      AppColorScheme.onBlack.withOpacity(0.5),
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
                                  color:
                                      AppColorScheme.onBlack.withOpacity(0.5),
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
              )
            ],
          ),
        ),
      )),
    );
  }

  void _navigateToNext() {
    // final role = authentication.role;
    if (_formKey.currentState?.validate() == true) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => SignUpScreenPersonalDetials(
                  password: _confirmPasswordController.text,
                  phone: widget.phone,
                )),
        (route) => false,
      );
    } else {
      showErrorFlash(context: context, message: "PasswordIncorrect");
    }
  }
}
