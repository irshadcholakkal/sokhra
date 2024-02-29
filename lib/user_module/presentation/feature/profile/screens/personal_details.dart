import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import '../../../../../base_module/domain/args/navigation_args.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../domain/entity/authentication.dart';
import '../widgets/profile_edit_view.dart';

class personalDetails extends StatefulWidget {
  const personalDetails({Key? key}) : super(key: key);

  @override
  _personalDetailsState createState() => _personalDetailsState();
}

class _personalDetailsState extends State<personalDetails> {
  bool _editable = false;
  final ScrollController _scrollController = ScrollController();
  late FromDrawerArgs? _args;
  TextEditingController _promoCodeController = TextEditingController();

  @override
  void dispose() {
    _promoCodeController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _args = ModalRoute.of(context)!.settings.arguments as FromDrawerArgs?;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          return true;
        } else {
          return false;
          // ExitPopupHelper.showExitPopup(context);
        }
      },

      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColorScheme.surfaceColorLight,
        appBar: SimpleAppBar(title: translation.of('user.my_account')),
        body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 0), () {
              BlocProvider.of<AppDataBloc>(context)
                  .add(FetchAppData(reFetch: true));
              return true;
            });
          },
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 380),
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (authentication.isAuthenticated)
                          Row(
                            children: [
                              Text(
                                _editable
                                    ? translation.of("user.updateProfile")
                                    : translation.of("personal_details"),
                                style: TextStyle(
                                  color: Color(0xFF1D1B1E),
                                  fontSize: 16,
                                  fontFamily: AppConstants.defaultFont,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (!_editable)
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _editable = !_editable;
                                      });
                                    },
                                    icon: Icon(
                                      Iconsax.edit_2,
                                      color: AppColorScheme.primaryColor,
                                      size: 16,
                                    ))
                            ],
                          ),
                        Divider(
                          thickness: 0.50,
                        ),
                        const AppPadding(),
                        ProfileEditView(
                          editable: _editable,
                        ),
                        const AppPadding(
                          dividedBy: 4,
                        ),
                        // if (authentication.role == Role.CUSTOMER)
                        //   SizedBox(
                        //     width: double.infinity,
                        //     child: Align(
                        //       alignment: Alignment.centerLeft,
                        //       child: TextButton(
                        //         onPressed: () {
                        //           // pushNewScreenWithRouteSettings(context,
                        //           //     settings: RouteSettings(
                        //           //       name: UserRouter
                        //           //           .updatePasswordScreen,
                        //           //     ),
                        //           //     screen: UpdatePasswordScreen());
                        //           Navigator.pushNamed(context,
                        //               UserRouter.updatePasswordScreen);
                        //         },
                        //         child: Text(
                        //           translation
                        //               .of("user.change_password")
                        //               .toUpperCase(),
                        //           style: Theme.of(context)
                        //               .textTheme
                        //               .button!
                        //               .copyWith(
                        //                   decoration:
                        //                       TextDecoration.underline),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                      ],
                    ),
                  ),
                  // BlocBuilder<AppDataBloc, AppDataState>(
                  //   builder: (context, state) {
                  //     if (state is FetchAppDataSuccess) {
                  //       if (state.appData.discountCode != null) {
                  //         _promoCodeController.text =
                  //             state.appData.discountCode ??
                  //                 "XXXX-XXXX-XXXX-XXXX";
                  //         return Column(
                  //           children: [
                  //             Container(
                  //               constraints:
                  //                   const BoxConstraints(maxWidth: 380),
                  //               margin: const EdgeInsets.symmetric(
                  //                   horizontal:
                  //                       AppConstants.defaultPadding),
                  //               padding: const EdgeInsets.symmetric(
                  //                   vertical:
                  //                       AppConstants.defaultPadding * 0.4,
                  //                   horizontal:
                  //                       AppConstants.defaultPadding * 0.4),
                  //               decoration: BoxDecoration(
                  //                   color: Theme.of(context)
                  //                       .colorScheme
                  //                       .surface,
                  //                   borderRadius: BorderRadius.circular(
                  //                       AppConstants.cornerRadius)),
                  //               child: Center(
                  //                 child: Column(
                  //                   children: [
                  //                     Text(
                  //                       translation.of("discount_code"),
                  //                       style: Theme.of(context)
                  //                           .textTheme
                  //                           .headline6,
                  //                     ),
                  //                     AppPadding(
                  //                       dividedBy: 6,
                  //                     ),
                  //                     Row(
                  //                       children: [
                  //                         Container(
                  //                           constraints:
                  //                               const BoxConstraints(
                  //                                   maxWidth: 240),
                  //                           child: TextField(
                  //                             controller:
                  //                                 _promoCodeController,
                  //                             readOnly: true,
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           width: 5,
                  //                         ),
                  //                         IconButton(
                  //                             onPressed: () {
                  //                               Clipboard.setData(ClipboardData(
                  //                                       text:
                  //                                           _promoCodeController
                  //                                               .text))
                  //                                   .then((value) =>
                  //                                       showInfoFlash(
                  //                                           context:
                  //                                               context,
                  //                                           message:
                  //                                               translation.of(
                  //                                                   "copied_to_clipboard")));
                  //                             },
                  //                             icon: Icon(
                  //                               MdiIcons.contentCopy,
                  //                               color: Theme.of(context)
                  //                                   .colorScheme
                  //                                   .primary,
                  //                             )),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //             const AppPadding(),
                  //           ],
                  //         );
                  //       } else {
                  //         return Container();
                  //       }
                  //     } else {
                  //       return Container();
                  //     }
                  //   },
                  // ),
                  //---------------------------------Adress--------------------------------------------------------------------------------------//
                  // if (authentication.role == Role.CUSTOMER)
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Center(
                  //       child: Text(
                  //         translation.of("user.saved_address"),
                  //         style: Theme.of(context).textTheme.headline6,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  //     Row(children: [
                  //       SizedBox(
                  //         width: 50,
                  //       ),
                  //     ]),
                  //     BlocBuilder<AppDataBloc, AppDataState>(
                  //         builder: (appDataContext, state) {
                  //       if (state is FetchAppDataSuccess) {
                  //         List<ShippingAddress?>? addressList =
                  //             state.appData.addressDetails ?? [];
                  //         if (addressList.isNotEmpty) {
                  //           // debugPrint(
                  //           //     "addresslist length:${addressList.length}");
                  //           return SizedBox(
                  //             height: 360,
                  //             child: SingleChildScrollView(
                  //               scrollDirection: Axis.horizontal,
                  //               child: Row(
                  //                 children: [
                  //                   const SizedBox(
                  //                     width: 10,
                  //                   ),
                  //                   ListView.builder(
                  //                     padding: EdgeInsets.zero,
                  //                     controller: _scrollController,
                  //                     shrinkWrap: true,
                  //                     physics:
                  //                         NeverScrollableScrollPhysics(),
                  //                     scrollDirection: Axis.horizontal,
                  //                     itemCount: addressList.length,
                  //                     itemBuilder: (context, index) {
                  //                       return Center(
                  //                         child: BlocListener<ProfileBloc,
                  //                             ProfileState>(
                  //                           listener:
                  //                               (context2, profileState) {
                  //                             if (profileState
                  //                                 is ProfileEditAddressSuccess) {
                  //                               BlocProvider.of<
                  //                                           AppDataBloc>(
                  //                                       context)
                  //                                   .add(FetchAppData(
                  //                                       reFetch: true));
                  //                             }
                  //                             if (profileState
                  //                                 is ProfileDeleteAddressSuccess) {
                  //                               BlocProvider.of<
                  //                                           AppDataBloc>(
                  //                                       context)
                  //                                   .add(FetchAppData(
                  //                                       reFetch: true));
                  //                               showSuccessFlash(
                  //                                   context: context,
                  //                                   message: translation.of(
                  //                                       "user.delete_address_success"));
                  //                             }
                  //                             if (profileState
                  //                                 is ProfileDeleteAddressFailed) {
                  //                               showErrorFlash(
                  //                                   context: context,
                  //                                   message: translation.of(
                  //                                       "user.delete_address_failed"));
                  //                             }
                  //                           },
                  //                           child:
                  //                            AddressCard(
                  //                             address: addressList[index],
                  //                             userId: state.appData.id,
                  //                           ),
                  //                         ),
                  //                       );
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           );
                  //         } else {
                  //           return Container(
                  //             child: Center(
                  //               child: Text(translation
                  //                   .of("address_list_is_empty")),
                  //             ),
                  //           );
                  //         }
                  //       } else if (state is FetchAppDataFailed) {
                  //         return InkWell(
                  //           onTap: () {
                  //             BlocProvider.of<AppDataBloc>(context)
                  //                 .add(FetchAppData(reFetch: true));
                  //           },
                  //           child: Center(
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               crossAxisAlignment:
                  //                   CrossAxisAlignment.center,
                  //               children: [
                  //                 Text("Click to refresh"),
                  //                 SizedBox(
                  //                   width: 10,
                  //                 ),
                  //                 Icon(Icons.refresh)
                  //               ],
                  //             ),
                  //           ),
                  //         );
                  //         //   Text(
                  //         //   state.message,
                  //         //   style: Theme.of(context)
                  //         //       .textTheme
                  //         //       .headline6!
                  //         //       .copyWith(
                  //         //           color: Theme.of(context)
                  //         //               .colorScheme
                  //         //               .primary),
                  //         // );
                  //       } else {
                  //         return Container();
                  //       }
                  //     }),
                  //     const AppPadding(
                  //       dividedBy: 4,
                  //     ),
                  //     // SizedBox(
                  //     //   height: 30.0,
                  //     // ),
                  //     Center(
                  //       child: ElevatedButton(
                  //         style: ButtonStyle(
                  //           padding: MaterialStateProperty.all(
                  //             const EdgeInsets.symmetric(
                  //               horizontal: AppConstants.defaultPadding,
                  //               vertical: AppConstants.defaultPadding / 4,
                  //             ),
                  //           ),
                  //         ),
                  //         onPressed: () {
                  //           // pushNewScreenWithRouteSettings(context,
                  //           //     settings: RouteSettings(
                  //           //       name: UserRouter.addAddressScreen,
                  //           //       arguments: EditAddressArguments(),
                  //           //     ),
                  //           //     screen: AddAddressScreen());
                  //           Navigator.pushNamed(
                  //               context, UserRouter.addAddressScreen,
                  //               arguments: EditAddressArguments());
                  //         },
                  //         child: Text(
                  //           translation.of("user.add_new_address"),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: AppConstants.defaultPadding * 1.5),
                ]),

            ///////////////og start
            //   if (authentication.role == Role.CUSTOMER)
            //     Column(
            //       children: [
            //         Text(
            //           translation.of("user.saved_address"),
            //           style: Theme.of(context).textTheme.headline6,
            //         ),
            //         SizedBox(
            //           height: 10,
            //         ),
            //         Row(children: [
            //           SizedBox(
            //             width: 50,
            //           ),
            //         ]),
            //         BlocBuilder<AppDataBloc, AppDataState>(
            //             builder: (appDataContext, state) {
            //           if (state is FetchAppDataSuccess) {
            //             List<ShippingAddress?>? addressList =
            //                 state.appData.addressDetails ?? [];
            //
            //             if (addressList.isNotEmpty) {
            //               // debugPrint(
            //               //     "addresslist length:${addressList.length}");
            //               return SizedBox(
            //                 height: 360,
            //                 child: SingleChildScrollView(
            //                   scrollDirection: Axis.horizontal,
            //                   child: Row(
            //                     children: [
            //                       const SizedBox(
            //                         width: 10,
            //                       ),
            //                       ListView.builder(
            //                         controller: _scrollController,
            //                         shrinkWrap: true,
            //                         physics:
            //                             NeverScrollableScrollPhysics(),
            //                         scrollDirection: Axis.horizontal,
            //                         itemCount: addressList.length,
            //                         itemBuilder: (context, index) {
            //                           return Center(
            //                             child: BlocListener<ProfileBloc,
            //                                 ProfileState>(
            //                               listener:
            //                                   (context2, profileState) {
            //                                 if (profileState
            //                                     is ProfileEditAddressSuccess) {
            //                                   BlocProvider.of<
            //                                               AppDataBloc>(
            //                                           context)
            //                                       .add(FetchAppData(
            //                                           reFetch: true));
            //                                 }
            //
            //                                 if (profileState
            //                                     is ProfileDeleteAddressSuccess) {
            //                                   BlocProvider.of<
            //                                               AppDataBloc>(
            //                                           context)
            //                                       .add(FetchAppData(
            //                                           reFetch: true));
            //                                   showSuccessFlash(
            //                                       context: context,
            //                                       message: translation.of(
            //                                           "user.delete_address_success"));
            //                                 }
            //                                 if (profileState
            //                                     is ProfileDeleteAddressFailed) {
            //                                   showErrorFlash(
            //                                       context: context,
            //                                       message: translation.of(
            //                                           "user.delete_address_failed"));
            //                                 }
            //                               },
            //                               child: AddressCard(
            //                                 address: addressList[index],
            //                                 userId: state.appData.id,
            //                               ),
            //                             ),
            //                           );
            //                         },
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               );
            //             } else {
            //               return Container(
            //                 child: Center(
            //                   child: Text(translation
            //                       .of("address_list_is_empty")),
            //                 ),
            //               );
            //             }
            //           } else if (state is FetchAppDataFailed) {
            //             return
            //
            //
            //               InkWell(
            //                 onTap: (){
            //                   BlocProvider.of<AppDataBloc>(context)
            //                       .add(FetchAppData(reFetch: true));
            //
            //                 },
            //                 child: Center(
            //                   child: Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     crossAxisAlignment: CrossAxisAlignment.center,
            //                     children: [
            //                       Text("Click to refresh"),
            //                       SizedBox(width: 10,),
            //                       Icon(Icons.refresh)
            //                     ],
            //                   ),
            //                 ),
            //               );
            //
            //             //   Text(
            //             //   state.message,
            //             //   style: Theme.of(context)
            //             //       .textTheme
            //             //       .headline6!
            //             //       .copyWith(
            //             //           color: Theme.of(context)
            //             //               .colorScheme
            //             //               .primary),
            //             // );
            //
            //
            //           } else {
            //             return Container();
            //           }
            //         }),
            //         const AppPadding(
            //           dividedBy: 4,
            //         ),
            //         SizedBox(
            //           height: 30.0,
            //         ),
            //         ElevatedButton(
            //           style: ButtonStyle(
            //             padding: MaterialStateProperty.all(
            //               const EdgeInsets.symmetric(
            //                 horizontal: AppConstants.defaultPadding,
            //                 vertical: AppConstants.defaultPadding / 4,
            //               ),
            //             ),
            //           ),
            //           onPressed: () {
            //             // pushNewScreenWithRouteSettings(context,
            //             //     settings: RouteSettings(
            //             //       name: UserRouter.addAddressScreen,
            //             //       arguments: EditAddressArguments(),
            //             //     ),
            //             //     screen: AddAddressScreen());
            //             Navigator.pushNamed(
            //                 context, UserRouter.addAddressScreen,
            //                 arguments: EditAddressArguments());
            //           },
            //           child: Text(
            //             translation.of("user.add_new_address"),
            //           ),
            //         ),
            //       ],
            //     ),
            //   SizedBox(
            //     height: 30.0,
            //   ),
            // ]),
            //////////////// og end
          ),
        ),
      ),
      //  ],
    );
    //);
  }

  Widget textField(String title,
      {bool isPassword = false,
      bool isNumber = false,
      required TextEditingController textController,
      int lines = 1}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: AppConstants.defaultPadding * 0.5),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 2,
          ),
          TextFormField(
            maxLines: lines,
            controller: textController,
            // maxLength: length,
            // inputFormatters: [
            //   LengthLimitingTextInputFormatter(length),
            // ],
            obscureText: isPassword,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true),
          )
        ],
      ),
    );
  }
}
