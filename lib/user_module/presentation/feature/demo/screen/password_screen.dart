import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/app_icons/app_icon_large.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/component/text_form_field/custom_text_form_filed.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../authentication/blocs/authentication/authentication_bloc.dart';
import '../../sign_in/screens/intro_screen.dart';
import '../../sign_up/blocs/sign_up/sign_up_bloc.dart';
import '../../sign_up/screens/signup_screen.dart';

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
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Form(
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
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translation.of("user.sign_up"),
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: AppColorScheme.onBlack,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      translation.of('user.enter_strong_password'),
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
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
              SizedBox(height: AppConstants.defaultPadding * 1.8),
              CustomTextFormField(
                controller: _passwordController,
                hintText: translation.of('user.enter_password'),
                hintStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: AppColorScheme.textFieldHintColor,
                    ),
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
                      errorText: translation
                          .of('user.password_must_be_least_8_characters_long')),
                  FormBuilderValidators.required(
                      errorText: translation.of("user.required")),
                ]),
              ),
              SizedBox(
                height: AppConstants.defaultPadding * 0.8,
              ),
              CustomTextFormField(
                controller: _confirmPasswordController,
                hintText: translation.of('user.confirm_password'),
                hintStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: AppColorScheme.textFieldHintColor,
                    ),
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
                      return translation.of('user.passwords_do_not_match');
                    }
                    return null;
                  },
                  FormBuilderValidators.minLength(8,
                      errorText: translation
                          .of('user.password_must_be_least_8_characters_long')),
                  FormBuilderValidators.required(
                    errorText: translation.of("user.required"),
                  ),
                ]),
              ),
              SizedBox(height: AppConstants.defaultPadding),
              InkWell(
                onTap: _navigateToNext,
                child: Container(
                  //width: 352,
                  height: 56,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: AppColorScheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppConstants.cornerRadiusMin),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      translation.of('user.continue'),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: AppColorScheme.onPrimaryLight,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
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
                          text: translation.of("user.already_a_user"),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColorScheme.onBlack.withOpacity(0.5),
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
                                color: AppColorScheme.onBlack.withOpacity(0.5),
                                fontSize: 12,
                              ),
                        ),
                        TextSpan(
                            text: translation.of("user.sign_in"),
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColorScheme.primaryColor,
                                      fontSize: 12,
                                    ),
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
      showErrorFlash(
          context: context, message: translation.of('user.invalid_password'));
    }
  }
}
