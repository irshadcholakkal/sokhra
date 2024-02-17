import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/base_module/presentation/util/string_modifiers.dart';
import 'package:lumiereorganics_app/user_module/presentation/feature/profile/screens/adresses_page.dart';

import '../../../../../app_settings_module/domain/entity/models/app_data.dart';
import '../../../../../app_settings_module/domain/entity/models/shipping_address.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../profile/blocs/profile/profile_bloc.dart';
import '../screen/map_location_picker_screen.dart';

class AddressListCard extends StatefulWidget {
  final ShippingAddress addressData;
  final AppData appData;

  const AddressListCard({
    Key? key,
    required this.addressData,
    required this.appData,
  });

  @override
  State<AddressListCard> createState() => _AddressListCardState();
}

class _AddressListCardState extends State<AddressListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(
      //   vertical: AppConstants.defaultPadding / 4,
      // ),
      // padding: EdgeInsets.symmetric(
      //   horizontal: AppConstants.defaultPadding / 2,
      //   vertical: AppConstants.defaultPadding / 2,
      // ),
      // width: double.infinity,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(
      //     AppConstants.cornerRadius,
      //   ),
      //   color: Theme.of(context).colorScheme.surface,
      // ),
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
                    Text(
                      "${StringModifiers.enumToString(widget.addressData.type)?.replaceAll("_", " ")}",
                      style: TextStyle(
                        color: Color(0xFF1D1B1E),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 12,
                      height: 12,
                      child: 
                      // child: IconButton(
                      //     onPressed: () {
                      //       Navigator.of(context).push(
                      //         MaterialPageRoute(
                      //           builder: (_) => MapLocationPicker(
                      //             initialPosition: LatLng(
                      //                 double.parse(widget.addressData.lat!),
                      //                 double.parse(widget.addressData.lon!)),
                      //             customerInfo: widget.appData,
                      //             shippingAddress: widget.addressData,
                      //             selectTitle: translation
                      //                 .of('customer.delivery_location'),
                      //             selectText: 'Confirm location & proceed',
                      //           ),
                      //         ),
                      //       );
                      //     },
                         GestureDetector(
                          onTap: () {

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => EditAddressScreen(
                                  addressData: widget.addressData,
                                  appData: widget.appData,
                                )
                                
                                // MapLocationPicker(
                                //   initialPosition: LatLng(
                                //       double.parse(widget.addressData.lat!),
                                //       double.parse(widget.addressData.lng!)),
                                //   customerInfo: widget.appData,
                                //   shippingAddress: widget.addressData,
                                //   selectTitle: translation
                                //       .of('customer.delivery_location'),
                                //   selectText: 'Confirm location & proceed',
                                // ),
                              ),
                            );
                            
                          },
                           child: Icon(
                              Iconsax.edit_2,
                              color: AppColorScheme.primaryColor,
                              size: 12,
                            ),
                         )
                          //),
                    )
                  ],
                ),
                // RichText(
                //   text: TextSpan(
                //     // Define your text spans here
                //     children: <TextSpan>[
                //       TextSpan(
                //         text: "Home",
                //         style: Theme.of(context)
                //             .textTheme
                //             .subtitle2
                //             ?.copyWith(
                //               fontWeight: FontWeight.w600,
                //               color: Theme.of(context)
                //                   .colorScheme
                //                   .onBackground,
                //             ),
                //       ),
                //       if (widget.addressData.isDefault == true)
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
                // SizedBox(width: 2),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 232,
                          child: Text(
                            [
                              widget.addressData.house ?? "",
                              widget.addressData.landmark ?? "",
                              widget.addressData.zone ?? ""
                            ].where((e) => e.isNotEmpty).join(", "),
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(0.5),
                                    ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        if (widget.addressData.isDefault == true)
                          Text(
                            'Default',
                            style: TextStyle(
                              color: AppColorScheme.primaryColor,
                              fontSize: 9,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          // Container(
          //   // color: Colors.yellow,
          //   width: 20,
          //   height: 20,
          //   child: PopupMenuButton<String>(
          //     splashRadius: 10,
          //     iconSize: 16,
          //     padding: EdgeInsets.zero,
          //     onSelected: (value) {
          //       if (value == "EDIT") {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (_) => MapLocationPicker(
          //               initialPosition: LatLng(
          //                   double.parse(widget.addressData.lat!),
          //                   double.parse(widget.addressData.lon!)),
          //               customerInfo: widget.appData,
          //               shippingAddress: widget.addressData,
          //               selectTitle:
          //                   translation.of('customer.delivery_location'),
          //               selectText: 'Confirm location & proceed',
          //             ),
          //           ),
          //         );
          //       } else if (value == "DELETE") {
          //         BlocProvider.of<ProfileBloc>(context).add(
          //           ProfileDeleteAddress(
          //             customerId: widget.appData.id!,
          //             address: widget.addressData,
          //           ),
          //         );
          //       }
          //     },
          //     itemBuilder: (context) {
          //       return <PopupMenuEntry<String>>[
          //         PopupMenuItem<String>(
          //           value: 'EDIT',
          //           child: Text(
          //             translation.of('edit'),
          //             style: Theme.of(context).textTheme.caption?.copyWith(
          //                   fontWeight: FontWeight.w400,
          //                   color: Theme.of(context).colorScheme.onBackground,
          //                 ),
          //           ),
          //         ),
          //         if (widget.addressData.isDefault != true)
          //           PopupMenuItem<String>(
          //             value: 'DELETE',
          //             child: Text(
          //               "Delete",
          //               style: Theme.of(context).textTheme.caption?.copyWith(
          //                     fontWeight: FontWeight.w400,
          //                     color: Theme.of(context).colorScheme.onBackground,
          //                   ),
          //             ),
          //           ),
          //       ];
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
