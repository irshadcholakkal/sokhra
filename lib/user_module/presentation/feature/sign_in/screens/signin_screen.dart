// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// import '../../../../../base_module/domain/entity/translation.dart';
// import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
// import '../../../../../base_module/presentation/component/padding/app_padding.dart';
// import '../../../../../driver_module/presentation/feature/demo/screen/driver_home_screen.dart';
// import '../../../../../home/feature/home/screens/home_screen.dart';
// import '../../../../data/entity/input_models/sign_in_input.dart';
// import '../../../../domain/entity/authentication.dart';
// import '../../../../domain/entity/models/role.dart';
// import '../../../core/values/user_assets.dart';
// import '../../../core/values/user_router.dart';
// import '../../authentication/blocs/authentication/authentication_bloc.dart';
// import '../../profile/widgets/forgot_password_dialog.dart';
// import '../blocs/sign_in/sign_in_bloc.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);

//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   final _formKey = GlobalKey<FormBuilderState>();
//   bool _loading = false;
//   final _signInBloc = SignInBloc();
//   late AuthenticationBloc _authenticationBloc;

//   @override
//   void initState() {
//     super.initState();
//     _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // const _height = 240.00;

//     return Stack(
//       children: [
//         Container(
//           height: double.infinity,
//           width: double.infinity,
//           color: Theme.of(context).colorScheme.background,
//           child: SvgPicture.asset(
//             UserAssets.PATTERN,
//             fit: BoxFit.fill,
//           ),
//         ),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const AppPadding(
//                     multipliedBy: 2,
//                   ),
//                   Center(
//                     child: Container(
//                       color: Colors.transparent,
//                       constraints: const BoxConstraints(maxWidth: 380),
//                       padding: const EdgeInsets.all(30),
//                       child: BlocListener<SignInBloc, SignInState>(
//                         bloc: _signInBloc,
//                         listener: (_, state) {
//                           if (state is SignInSuccess) {
//                             _authenticationBloc.add(SignedIn());
//                             _reFetchContent();
//                             _navigateToNext();
//                           } else if (state is SignInFailed) {
//                             showErrorFlash(
//                               context: context,
//                               message: state.message == 'NOT_FOUND' ||
//                                       state.message == 'FAILED'
//                                   ? translation.of("user.invalid_credentials")
//                                   : state.message,
//                             );

//                             setState(() {
//                               _loading = false;
//                             });
//                           } else {
//                             showInfoFlash(
//                               context: context,
//                               message: translation.of("user.signing_in"),
//                             );
//                           }
//                         },
//                         // child:Form(
//                         child: FormBuilder(
//                           key: _formKey,
//                           enabled: !_loading,
//                           autovalidateMode: AutovalidateMode.disabled,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Container(
//                                 width: double.infinity,
//                                 padding: EdgeInsets.symmetric(horizontal: 5),
//                                 child: Text(
//                                   translation.of("user.sign_in"),
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headline4!
//                                       .copyWith(
//                                           color: Theme.of(context)
//                                               .colorScheme
//                                               .primary),
//                                 ),
//                               ),
//                               const AppPadding(),
//                               _usernameTextField(),
//                               const AppPadding(dividedBy: 2),
//                               _passwordTextField(),
//                               const AppPadding(),
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: ElevatedButton(
//                                   child: Text(
//                                     _loading
//                                         ? translation
//                                             .of("user.signing_in")
//                                             .toUpperCase()
//                                         : translation
//                                             .of("user.sign_in")
//                                             .toUpperCase(),
//                                   ),
//                                   onPressed: _submitForm,
//                                 ),
//                                 // child: ElevatedButton(
//                                 //   onPressed: _submitForm,
//                                 //   child: Text(
//                                 //     _loading
//                                 //         ? translation
//                                 //             .of("user.signing_in")
//                                 //             .toUpperCase()
//                                 //         : translation.of("user.sign_in").toUpperCase(),
//                                 //   ),
//                                 // ),
//                               ),
//                               const AppPadding(dividedBy: 5),
//                               TextButton(
//                                 onPressed: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (_) {
//                                       return ForgotPasswordDialog();
//                                     },
//                                   );
//                                 },
//                                 child: Text(
//                                   translation.of("user.forgot_password"),
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .button!
//                                       .copyWith(
//                                         decoration: TextDecoration.underline,
//                                       ),
//                                 ),
//                               ),
//                               const AppPadding(),
//                               Text(
//                                 translation.of("user.new_user"),
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .subtitle1!
//                                     .copyWith(
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .onSurface,
//                                     ),
//                               ),
//                               const AppPadding(dividedBy: 6),
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pushNamed(
//                                     context,
//                                     UserRouter.signUpScreen,
//                                   );
//                                 },
//                                 child: Text(
//                                   translation.of("user.sign_up").toUpperCase(),
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .button!
//                                       .copyWith(
//                                         decoration: TextDecoration.underline,
//                                       ),
//                                 ),
//                               ),
//                               const AppPadding(dividedBy: 4),

//                               // TextButton(
//                               //   onPressed: () {
//                               //     // Navigator.pushReplacementNamed(
//                               //     //   context,
//                               //     //   CustomerRouter.customerHomeScreen,
//                               //     // );
//                               //   },
//                               //   child: Text(
//                               //     translation.of('skip'),
//                               //   ),
//                               // ),
//                               const AppPadding(multipliedBy: 2),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _usernameTextField() {
//     return FormBuilderTextField(
//       name: 'username',
//       keyboardType: TextInputType.phone,
//       textInputAction: TextInputAction.next,
//       maxLength: 10,
//       decoration: InputDecoration(
//         counter: Container(),
//         prefixIcon: Icon(
//           MdiIcons.phoneOutline,
//           color: Theme.of(context).colorScheme.primary,
//         ),
//         hintText: translation.of("user.phone"),
//       ),
//       validator: FormBuilderValidators.compose([
//         FormBuilderValidators.required(),
//       ]),
//       onChanged: (value) {
//         _formKey.currentState?.fields['username']?.validate();
//       },
//     );
//   }

//   Widget _passwordTextField() {
//     // return FormBuilderTextField(
//     //   name: 'password',
//     //   decoration: InputDecoration(
//     //     labelText: translation.of("user.password"),
//     //     prefixIcon: const Icon(MdiIcons.lockOutline),
//     //   ),
//     //   obscureText: true,
//     //   textInputAction: TextInputAction.done,
//     //   validator: FormBuilderValidators.compose([
//     //     FormBuilderValidators.required(context),
//     //   ]),
//     //   onChanged: (value) {
//     //     _formKey.currentState?.fields['password']?.validate();
//     //   },
//     //   onSubmitted: (value) {
//     //     _submitForm();
//     //   },
//     // );
//     return FormBuilderTextField(
//       name: "password",
//       keyboardType: TextInputType.emailAddress,
//       textInputAction: TextInputAction.done,
//       decoration: InputDecoration(
//         prefixIcon: Icon(
//           MdiIcons.lockOutline,
//           color: Theme.of(context).colorScheme.primary,
//         ),
//         hintText: translation.of("user.password"),
//       ),
//       obscureText: true,
//       validator: FormBuilderValidators.compose([
//         FormBuilderValidators.required(),
//       ]),
//       onChanged: (value) {
//         _formKey.currentState?.fields['password']?.validate();
//       },
//       // onSubmitted: (value) {
//       //   _submitForm();
//       // },
//     );
//   }

//   void _submitForm() {
//     if (!_loading && _formKey.currentState!.validate()) {
//       //      if (_formKey.currentState!.validate()) {
//       _signInBloc.add(SignIn(
//         signInInput: SignInInput(
//           username: _formKey.currentState!.fields['username']!.value
//               .trim()
//               .toString(),
//           password: _formKey.currentState!.fields['password']!.value
//               .trim()
//               .toString(),
//         ),
//       ));
//       setState(() {
//         _loading = true;
//       });
//       // Navigator.push(
//       //     context,
//       //     PageTransition(
//       //         child: ListCatalogue(), type: PageTransitionType.rightToLeft));
//     }
//   }

//   void _navigateToNext() {
//     final role = authentication.role;
//     // debugPrint("the role is $role");

//     switch (role) {
//       case Role.DRIVER:
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => DriverHomeScreen()));
//         break;
//       case Role.CUSTOMER:
//         // Navigator.pushNamedAndRemoveUntil(
//         //   context,
//         //   CatalogueRouter.listCatalogue,
//         //   (route) => false,
//         // );
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => HomeScreen()));
//         break;
//       case Role.VENDOR:
//         // Navigator.pushNamedAndRemoveUntil(
//         //   context,
//         //   VendorRouter.vendorHomeScreen,
//         //   (route) => false,
//         //  );
//         break;
//       case Role.GUEST:
//         // Navigator.pushNamedAndRemoveUntil(
//         //   context,
//         //   CatalogueRouter.listCatalogue,
//         //   (route) => false,
//         // );
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => HomeScreen()));

//         // Navigator.push(
//         //     context,
//         //     PageTransition(
//         //         child: ListCatalogue(), type: PageTransitionType.rightToLeft));
//         break;
//     }
//   }

//   Future<void> _reFetchContent() async {
//     // if (authentication.role == Role.VENDOR) {
//     //   BlocProvider.of<VendorBloc>(context).add(const FetchVendor(
//     //     reFetch: true,
//     //   ));
//     // }

//     // if (authentication.role == Role.CUSTOMER) {
//     //   BlocProvider.of<CartBloc>(context).add(const FetchCart(
//     //     reFetch: true,
//     //   ));
//     // }

//     return Future.delayed(const Duration(milliseconds: 500));
//   }
// }



