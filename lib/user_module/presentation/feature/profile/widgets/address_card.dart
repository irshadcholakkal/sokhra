import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app_settings_module/domain/entity/models/shipping_address.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/buttons/delete_button.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../base_module/presentation/util/string_modifiers.dart';
import '../../../../../globals.dart';
import '../../../../data/entity/input_models/edit_address_arguments.dart';
import '../../../components/manage_address_bottom_sheet.dart';
import '../../../core/values/user_router.dart';
import '../blocs/profile/profile_bloc.dart';

class AddressCard extends StatelessWidget {
  AddressCard({required this.address, required this.userId});

  final ShippingAddress? address;
  final String? userId;

  @override
  Widget build(BuildContext context) {
    String name = (address?.firstName ?? "") + " " + (address?.lastName ?? "");
    String? type =
        StringModifiers.enumToString(address?.type)?.replaceAll("_", " ");
    String? _address = ("House/Flat :" +
        (address?.house ?? "") +
        "\n" +
        "Street :" +
        (address?.street ?? "n/a") +
        "\n" +
        "Post :" +
        (address?.post ?? "n/a") +
        "\n" +
        "District :" +
        (address?.district ?? "n/a") +
        "\n" +
        "State :" +
        (address?.state ?? "n/a") +
        "\n" +
        ("Pincode :" + (address?.pincode ?? translation.of("n/a"))) +
        "\n" +
        ("Landmark :" + (address?.landmark ?? translation.of("n/a"))) +
        "\n" +
        "Type :" +
        "${type == null ? translation.of("n/a") : type}" +
        "\n"
            "Phone :" +
        ((address?.phone ?? translation.of("n/a"))));

    return Container(

      child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  ThemeAssets.location,
                  // width: 20,
                  // height: 20,
                  // fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // RichText(
                          //   text: TextSpan(
                          //     // Define your text spans here
                          //     children: <TextSpan>[
                          //       TextSpan(
                          //         text: "Home",
                          //         style:
                          //             Theme.of(context).textTheme.caption?.copyWith(
                          //                   fontWeight: FontWeight.w700,
                          //                   color: Theme.of(context)
                          //                       .colorScheme
                          //                       .onBackground,
                          //                 ),
                          //       ),
                          //       if (addressItem?.isDefault == true)
                          //         TextSpan(
                          //           text: "    You are here",
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .caption
                          //               ?.copyWith(
                          //                 fontWeight: FontWeight.w500,
                          //                 fontSize: 8,
                          //                 color: Theme.of(context)
                          //                     .colorScheme
                          //                     .onTertiaryContainer,
                          //               ),
                          //         ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          Text(
                           
       "${ StringModifiers.enumToString(address?.type)?.replaceAll("_", " ")}",
                            style: TextStyle(
                              color: Color(0xFF1D1B1E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      // SizedBox(width: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 232,
                            child: Text(
                              [
                                address?.firstName ?? "",
                                address?.house ?? "",
                                address?.landmark ?? "",
                                address?.pincode ?? ""
                              ].where((e) => e.isNotEmpty).join(", "),
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground
                                            .withOpacity(0.5),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                      ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showBottomSheetPopup(
                                builder: (context) {
                                  return ManageAddressBottomSheet();
                                },
                              );

                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (_) => ManageAddressScreen(),
                              // ));
                            },
                            child: Container(
                              width: 56.72,
                              height: 19.01,
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 8.36, vertical: 2.51),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.42, color: Color(0xFFCBC4CF)),
                                  borderRadius: BorderRadius.circular(8.36),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Change",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                        fontSize: 9.19,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        color: AppColorScheme.primaryColor,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
    );


    // Padding(
     // padding: EdgeInsets.only(right: 10, left: 10.0, bottom: 10.0),
      //  padding: EdgeInsets.all(8.0),
      // child: Stack(
      //   children: [
      //     Card(
      //       clipBehavior: Clip.antiAlias,
      //       shape: RoundedRectangleBorder(
      //         side: address?.isDefault == true
      //             ? BorderSide(color: Theme.of(context).colorScheme.primary)
      //             : BorderSide(color: Colors.transparent),
      //         borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
      //       ),
      //       child: Container(
      //         padding: const EdgeInsets.symmetric(
      //             vertical: AppConstants.defaultPadding * 0.6,
      //             horizontal: AppConstants.defaultPadding * 0.6),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Text(
      //               "$name",
      //               style: Theme.of(context).textTheme.headline6,
      //             ),
      //             AppPadding(
      //               dividedBy: 4,
      //             ),
      //             Container(
      //               width: 300,
      //               child: Text(
      //                 "${_address}",
      //                 textAlign: TextAlign.start,
      //               ),
      //             ),
      //             Divider(
      //               thickness: 1,
      //             ),
      //             AppPadding(
      //               dividedBy: 4,
      //             ),
      //             ElevatedButton(
      //               style: ButtonStyle(
      //                 padding: MaterialStateProperty.all(
      //                   const EdgeInsets.symmetric(
      //                     horizontal: AppConstants.defaultPadding,
      //                     vertical: AppConstants.defaultPadding / 4,
      //                   ),
      //                 ),
      //               ),
      //               onPressed: () {
      //                 // pushNewScreenWithRouteSettings(context,
      //                 //     settings: RouteSettings(
      //                 //       name: UserRouter.addAddressScreen,
      //                 //       arguments: EditAddressArguments(
      //                 //           address: address,
      //                 //           userId: userId,
      //                 //           addressId: address?.id,
      //                 //           isEdit: true),
      //                 //     ),
      //                 //     screen: AddAddressScreen());
      //                 Navigator.pushNamed(context, UserRouter.addAddressScreen,
      //                     arguments: EditAddressArguments(
      //                         address: address,
      //                         userId: userId,
      //                         addressId: address?.id,
      //                         isEdit: true));
      //               },
      //               child: Text(
      //                 translation.of("edit"),
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       right: 10,
      //       top: 10,
      //       child: DeleteButton(
      //         onPressed: () {
      //           if (userId != null && address?.id! != null) {
      //             BlocProvider.of<ProfileBloc>(context).add(
      //               ProfileDeleteAddress(
      //                 customerId: userId!,
      //                 address: address!,
      //               ),
      //             );
      //           } else {
      //             showErrorFlash(
      //                 context: context,
      //                 message: translation.of("unexpected_error_occurred"));
      //           }
      //         },
      //       ),
      //     ),
      //   ],
      // ),
   // );
  }
}
