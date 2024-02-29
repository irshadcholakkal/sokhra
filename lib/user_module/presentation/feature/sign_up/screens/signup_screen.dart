import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/app_icons/app_icon_large.dart';
import '../../../../../base_module/presentation/component/images/custom_image_view.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/component/text_form_field/custom_text_form_filed.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../base_module/presentation/util/validate.dart';
import '../../../../data/entity/input_models/otp_input.dart';
import '../../../../data/entity/input_models/otp_type.dart';
import '../../../../data/entity/input_models/sign_up_input.dart';
import '../../../../domain/entity/authentication.dart';
import '../../authentication/blocs/authentication/authentication_bloc.dart';
import '../../profile/screens/add_address_screen.dart';
import '../../profile/widgets/otp_verification_dialog.dart';
import '../blocs/sign_up/sign_up_bloc.dart';

class SignUpScreenPersonalDetials extends StatefulWidget {
  final String phone;
  final String password;
  const SignUpScreenPersonalDetials(
      {Key? key, required this.phone, required this.password})
      : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreenPersonalDetials> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool _loading = false;

  final _signUpBloc = SignUpBloc();
  late AuthenticationBloc _authenticationBloc;
  bool _isLoading = false;

  // String firstName = '';
  // String lastName = '';
  // String email = '';
  XFile? _image;
  final _picker = ImagePicker();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<AppDataBloc>(context).add(FetchAppData(reFetch: true));
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
            child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSubmitting) {
              setState(() {
                _isLoading = true;
              });
            } else if (state is SignUpSuccess) {
              setState(() {
                _isLoading = false;
              });
              _authenticationBloc.add(SignedIn());
              _navigateToNext();
            } else if (state is SignUpFailed) {
              showErrorFlash(context: context, message: "Sign up failed");

              setState(() {
                _isLoading = false;
              });
            } else {
              setState(() {
                _isLoading = false;
              });
            }
          },
          bloc: _signUpBloc,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding * 1.2),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: AppConstants.defaultPadding * 1.25), //  Padding(
                  // padding: const EdgeInsets.only(left: 24),
                  // child:
                  AppIconLarge(),
                  // ),
                  AppPadding(
                    multipliedBy: 6.1,
                  ),
                  Container(
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Let’s introduce yourself',
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
                                    color: AppColorScheme.onBlack,
                                    fontSize: 22,
                                    fontFamily: AppConstants.defaultFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Text(
                          'Enter your personal details',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                color: AppColorScheme.onBlack.withOpacity(0.50),
                                fontSize: 12,
                                fontFamily: AppConstants.defaultFont,
                                fontWeight: FontWeight.w400,
                              ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: AppConstants.defaultPadding * 1.8),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          foregroundColor: AppColorScheme.backgroundLight,
                          radius: 50,
                          backgroundColor: AppColorScheme.backgroundLight,
                          child: (_image == null || _image == '')
                              ? CustomImageView(
                                  margin: EdgeInsets.all(18),
                                  // radius: BorderRadius.circular(),
                                  height: 100,
                                  width: 100,
                                  // color: Colors.red,
                                  svgPath: ThemeAssets.profile,
                                )
                              : Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: FileImage(
                                            File(_image!.path),
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                        ),
                        InkWell(
                          onTap: _pickImage,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: AppColorScheme.primaryColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Iconsax.edit_2,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  AppPadding(
                    multipliedBy: 0.7,
                  ),

                  _firstNameTextField(),
                  AppPadding(
                    multipliedBy: 0.7,
                  ),

                  _secondNameTextField(),
                  AppPadding(
                    multipliedBy: 0.7,
                  ),
                  _emailTextField(),
                  AppPadding(
                    multipliedBy: 0.7,
                  ),

                  InkWell(
                    onTap: _onSubmit,
                    // _navigateToNext,
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
                        child: _isLoading
                            ? CupertinoActivityIndicator(
                                color: AppColorScheme.backgroundColorLight,
                              )
                            : Text(
                                'Continue',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      color: AppColorScheme.onPrimaryLight,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );

    // Stack(
    //   children: [
    //     Container(
    //       height: double.infinity,
    //       width: double.infinity,
    //       color: Theme.of(context).colorScheme.background,
    //       child: SvgPicture.asset(
    //         UserAssets.PATTERN,
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //     Scaffold(
    //       backgroundColor: Colors.transparent,
    //       appBar: AppBar(
    //         iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
    //         // title: Text(
    //         //   translation.of("user.sign_up"),
    //         //   style: Theme.of(context).textTheme.headline6!.copyWith(
    //         //         color: Theme.of(context).colorScheme.primary,
    //         //       ),
    //         // ),
    //         // centerTitle: false,
    //         backgroundColor: Colors.transparent,
    //         elevation: 0,
    //       ),
    //       body: SingleChildScrollView(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const AppPadding(
    //               dividedBy: 2,
    //             ),
    //             Center(
    //               child: Container(
    //                 constraints: const BoxConstraints(maxWidth: 380),
    //                 padding: const EdgeInsets.all(24),
    //                 child: BlocListener<SignUpBloc, SignUpState>(
    //                   bloc: _signUpBloc,
    //                   listener: (context, state) {
    //                     if (state is SignUpSuccess) {
    //                       _authenticationBloc.add(SignedIn());
    //                       _navigateToNext();
    //                     } else if (state is SignUpFailed) {
    //                       showErrorFlash(
    //                         context: context,
    //                         message: state.message.contains('ALREADY_EXIST') ||
    //                                 state.message.contains('FAILED')
    //                             ? translation.of("user.user_exist_already")
    //                             : state.message,
    //                       );
    //                       setState(() {
    //                         _loading = false;
    //                       });
    //                     } else if (state is SendSignUpOtpSuccess) {
    //                       _showVerifyOtpDialog();
    //                       setState(() {
    //                         _loading = false;
    //                       });
    //                     } else if (state is SendSignUpOtpFailed) {
    //                       showErrorFlash(
    //                         context: context,
    //                         message: state.message.contains('ALREADY_EXIST') ||
    //                                 state.message.contains('FAILED')
    //                             ? translation.of("user.user_exist_already")
    //                             : state.message,
    //                       );
    //                       setState(() {
    //                         _loading = false;
    //                       });
    //                     } else {
    //                       showInfoFlash(
    //                         context: context,
    //                         message: translation.of("user.signing_up"),
    //                       );
    //                     }
    //                   },
    //                   child: FormBuilder(
    //                     key: _formKey,
    //                     enabled: !_loading,
    //                     autovalidateMode: AutovalidateMode.disabled,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: <Widget>[
    //                         Container(
    //                           alignment: Alignment.centerLeft,
    //                           width: 380,
    //                           padding: EdgeInsets.symmetric(horizontal: 5),
    //                           child: SizedBox(
    //                             width: 200,
    //                             child: Text(
    //                               translation.of("user.sign_up"),
    //                               style: Theme.of(context)
    //                                   .textTheme
    //                                   .headline4!
    //                                   .copyWith(
    //                                       color:
    //                                           Theme.of(context).primaryColor),
    //                               textAlign: TextAlign.left,
    //                             ),
    //                           ),
    //                         ),
    //                         const AppPadding(dividedBy: 1.6),
    //                         _firstNameTextField(),
    //                         const AppPadding(dividedBy: 1.6),
    //                         _lastNameTextField(),
    //                         const AppPadding(dividedBy: 1.6),
    //                         _phoneTextField(),
    //                         const AppPadding(dividedBy: 1.6),
    //                         _emailTextField(),
    //                         const AppPadding(dividedBy: 1.6),
    //                         _passwordTextField(),
    //                         const AppPadding(dividedBy: 1.6),
    //                         _confirmPasswordTextField(),
    //                         const AppPadding(),
    //                         SizedBox(
    //                           width: double.infinity,
    //                           child: ElevatedButton(
    //                             onPressed: _submitForm,
    //                             child: Text(
    //                               _loading
    //                                   ? translation.of("user.signing_up")
    //                                   : translation
    //                                       .of("user.register")
    //                                       .toUpperCase(),
    //                             ),
    //                           ),
    //                         ),
    //                         const AppPadding(),
    //                         Text(
    //                           translation.of("user.existing_user"),
    //                           style: Theme.of(context)
    //                               .textTheme
    //                               .subtitle1!
    //                               .copyWith(
    //                                 color:
    //                                     Theme.of(context).colorScheme.onSurface,
    //                               ),
    //                         ),
    //                         const AppPadding(dividedBy: 4),
    //                         SizedBox(
    //                           width: double.infinity,
    //                           child: TextButton(
    //                             onPressed: () {
    //                               // Navigator.pushNamedAndRemoveUntil(
    //                               //     context,
    //                               //     UserRouter.signInScreen,
    //                               //     (Route<dynamic> route) => false);
    //                             },
    //                             child: Text(
    //                               translation.of("user.sign_in").toUpperCase(),
    //                               style: Theme.of(context)
    //                                   .textTheme
    //                                   .button!
    //                                   .copyWith(
    //                                       decoration: TextDecoration.underline),
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  Widget _firstNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if(firstName.isEmpty)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translation.of("user.first_name"),
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: AppColorScheme.inActive.withOpacity(0.75),
                    fontSize: 11,
                    fontFamily: AppConstants.defaultFont,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              height: AppConstants.defaultPadding * 0.2,
            ),
          ],
        ),
        CustomTextFormField(
          controller: _firstNameController,
          hintText: translation.of("user.first_name"),
          fillColor: AppColorScheme.backgroundLight,
          filled: true,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: translation.of("user.required"),
            ),
          ]),
        )
      ],
    );
  }

  Widget _secondNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (lastName.isNotEmpty)
        Column(
          children: [
            Text(
              translation.of("user.last_name"),
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: AppColorScheme.inActive.withOpacity(0.75),
                    fontSize: 11,
                    fontFamily: AppConstants.defaultFont,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: AppConstants.defaultPadding * 0.2,
        ),
        CustomTextFormField(
          controller: _lastNameController,
          hintText: translation.of("user.last_name"),
          fillColor: AppColorScheme.backgroundLight,
          filled: true,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: translation.of("user.required"),
            ),
          ]),
        )
      ],
    );
  }

  Widget _hfirstNameTextField() {
    return FormBuilderTextField(
      name: 'firstName',

      decoration: InputDecoration(
          hintText: translation.of("user.first_name"),
          prefixIcon: Icon(
            MdiIcons.accountCircleOutline,
            color: Theme.of(context).colorScheme.primary,
          )),
      // decoration: InputDecoration(
      //   labelText: translation.of("user.first_name"),
      //   prefixIcon: MdiIcons.shieldAccount,
      // ),
      textInputAction: TextInputAction.next,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      onChanged: (value) {
        _formKey.currentState?.fields['firstName']?.validate();
      },
    );
  }

  Widget _lastNameTextField() {
    return FormBuilderTextField(
      name: 'lastName',
      decoration: InputDecoration(
        hintText: translation.of("user.last_name"),
        prefixIcon: Icon(
          MdiIcons.accountCircleOutline,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),

      // decoration: InputDecoration(
      //   labelText: translation.of("user.last_name"),
      //   prefixIcon: const Icon(MdiIcons.shieldAccount),
      // ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget _phoneTextField() {
    return FormBuilderTextField(
      name: 'phone',
      maxLength: 10,
      decoration: InputDecoration(
        counter: Container(),
        prefixIcon: Icon(
          MdiIcons.phoneOutline,
          color: Theme.of(context).colorScheme.primary,
        ),
        hintText: translation.of("user.phone"),
      ),
      // decoration: InputDecoration(
      //   labelText: translation.of("user.phone"),
      //   prefixIcon: const Icon(MdiIcons.phoneOutline),
      // ),
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validate.phone(value);
      },
      onChanged: (value) {
        _formKey.currentState?.fields['phone']?.validate();
      },
    );
  }

  Widget _emailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (email.isNotEmpty)
        Column(
          children: [
            Text(
              translation.of("user.email"),
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: AppColorScheme.inActive.withOpacity(0.75),
                    fontSize: 11,
                    fontFamily: AppConstants.defaultFont,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: AppConstants.defaultPadding * 0.2,
        ),
        CustomTextFormField(
          controller: _emailController,
          hintText: translation.of('user.enter_e-mail_address'),
          fillColor: AppColorScheme.backgroundLight,
          filled: true,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: translation.of(translation.of("user.required")),
            ),
          ]),
        )
      ],
    );
  }

  Widget _passwordTextField() {
    return FormBuilderTextField(
      name: 'password',
      decoration: InputDecoration(
        prefixIcon: Icon(
          MdiIcons.lockOutline,
          color: Theme.of(context).colorScheme.primary,
        ),
        hintText: translation.of("user.password"),
      ),
      // decoration: InputDecoration(
      //   labelText: translation.of("user.password"),
      //   prefixIcon: const Icon(MdiIcons.lockOutline),
      // ),
      obscureText: true,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validate.password(value);
      },
      onChanged: (value) {
        _formKey.currentState?.fields['password']?.validate();
      },
    );
  }

  Widget _confirmPasswordTextField() {
    return FormBuilderTextField(
      name: 'confirmPassword',
      decoration: InputDecoration(
        prefixIcon: Icon(
          MdiIcons.lockOutline,
          color: Theme.of(context).colorScheme.primary,
        ),
        hintText: translation.of("user.confirm_password"),
      ),
      // decoration: InputDecoration(
      //   labelText: translation.of("user.confirm_password"),
      //   prefixIcon: const Icon(MdiIcons.lockOutline),
      // ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      validator: (value) {
        return Validate.equal(
          _formKey.currentState?.fields['password']?.value?.trim()?.toString(),
          value,
        );
      },
      onChanged: (value) {
        _formKey.currentState?.fields['confirmPassword']?.validate();
      },
      onSubmitted: (value) {
        // _sendSignUpOtp();
        // _submitForm("123456");
      },
    );
  }

  void _showVerifyOtpDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return OtpVerificationDialog(
          otpInput: OtpInput(
            phone: _formKey.currentState?.fields['phone']?.value
                ?.trim()
                ?.toString(),
            otpType: OtpType.PHONE,
          ),
          isProfile: false,
        );
      },
    ).then((value) {
      final otp = (value ?? "") as String;

      if (otp.isNotEmpty) {
        _submitForm(otp);
      }
    });
  }

  // void _sendSignUpOtp() {
  //   if (!_loading && _formKey.currentState!.validate()) {
  //     _signUpBloc.add(SendSignUpOtp(
  //       otpInput: OtpInput(
  //         phone:
  //             _formKey.currentState?.fields['phone']?.value?.trim()?.toString(),
  //         otpType: OtpType.PHONE,
  //       ),
  //     ));

  //     setState(() {
  //       _loading = true;
  //     });
  //   }
  // }

  void _submitForm([String? otp]) {
    final _otp = otp?.trim() ?? "12345";

    if (_otp.isNotEmpty && !_loading && _formKey.currentState!.validate()) {
      String? firstName =
          _formKey.currentState?.fields['firstName']?.value?.trim() ??
              "".toString();
      String? lastName =
          _formKey.currentState?.fields['lastName']?.value?.trim() ??
              "".toString();

      _signUpBloc.add(SignUp(
        signUpInput: SignUpInput(
          name: "${firstName!} ${lastName!}",
          lastName: "",
          avatar: _image,
          phone:
              _formKey.currentState!.fields['phone']?.value?.trim()?.toString(),
          email:
              _formKey.currentState?.fields['email']?.value?.trim()?.toString(),
          password: _formKey.currentState!.fields['password']?.value
              ?.trim()
              ?.toString(),
          otp: _otp,
        ),
      ));

      setState(() {
        _loading = true;
      });
    }
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() == true) {}

    _signUpBloc.add(SignUp(
      signUpInput: SignUpInput(
        name: _firstNameController.text,
        lastName: _lastNameController.text,
        avatar: _image,
        phone: widget.phone,
        email: _emailController.text,
        password: widget.password,
      ),
    ));
    // print("aaaaaaaaaa");
    // print(_formKey.currentState?.validate());
    // print(_firstNameController.text);
    // print(_lastNameController.text);
    // print(_emailController.text);
  }

  void _navigateToNext() {
    final role = authentication.role;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AddAddressScreen()),
      (route) => false,
    );
    // Navigator.push(
    //       context,
    //       PageTransition(
    //           child: ListCatalogue(), type: PageTransitionType.rightToLeft));
    // Navigator.pushNamedAndRemoveUntil(
    //       context,
    //       UserRouter.profileScreen,
    //       (route) => false,
    //     );
    // switch (role) {
    //   case Role.DRIVER:
    //    Navigator.pushNamedAndRemoveUntil(
    //       context,
    //       UserRouter.profileScreen,
    //       (route) => false,
    //     );
    //     break;
    //   case Role.CUSTOMER:
    //     Navigator.pushNamedAndRemoveUntil(
    //       context,
    //       UserRouter.profileScreen,
    //       (route) => false,
    //     );
    //     break;
    //   case Role.VENDOR:
    //    Navigator.pushNamedAndRemoveUntil(
    //       context,
    //       UserRouter.profileScreen,
    //       (route) => false,
    //     );
    //     break;
    //   case Role.GUEST:
    //     break;
    //}
  }
}
