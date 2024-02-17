import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/base_module/presentation/util/string_modifiers.dart';
import 'package:lumiereorganics_app/user_module/presentation/feature/choose_loction/screen/map_location_picker_screen.dart';
import '../../../app_settings_module/domain/entity/models/app_data.dart';
import '../../../app_settings_module/domain/entity/models/shipping_address.dart';
import '../../../base_module/domain/entity/color_scheme.dart';
import '../../../base_module/domain/entity/translation.dart';
import '../../../base_module/presentation/core/values/app_assets.dart';

class DeliveryAdressListCard extends StatefulWidget {
  final ShippingAddress addressData;
  final AppData appData;
  final bool isSelected;

  const DeliveryAdressListCard({
    Key? key,
    required this.addressData,
    required this.appData,
    this.isSelected = false,
  });

  @override
  State<DeliveryAdressListCard> createState() => _DeliveryAdressListCardState();
}

class _DeliveryAdressListCardState extends State<DeliveryAdressListCard> {
 bool isDefaultSelected = false;

  @override
  void initState() {
    super.initState();
    // Set the initial state based on widget.addressData.isDefault
    isDefaultSelected = widget.addressData.isDefault == true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            ThemeAssets.location,
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
                    // SizedBox(
                    //   width: 12,
                    //   height: 12,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //           builder: (_) => MapLocationPicker(
                    //             initialPosition: LatLng(
                    //               double.parse(widget.addressData.lat!),
                    //               double.parse(widget.addressData.lon!),
                    //             ),
                    //             customerInfo: widget.appData,
                    //             shippingAddress: widget.addressData,
                    //             selectTitle: translation
                    //                 .of('customer.delivery_location'),
                    //             selectText: 'Confirm location & proceed',
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //     child: Icon(
                    //       Iconsax.edit_2,
                    //       color: AppColorScheme.primaryColor,
                    //       size: 12,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
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
                              widget.addressData.firstName ?? "",
                              widget.addressData.house ?? "",
                              widget.addressData.landmark ?? "",
                              widget.addressData.pincode ?? ""
                            ].where((e) => e.isNotEmpty).join(", "),
                            style: Theme.of(context).textTheme.caption?.copyWith(
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
                        
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Radio<bool>(
            fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.selected)
                    ? AppColorScheme.primaryColor
                    : AppColorScheme.primaryColor;
              }),
            value:isDefaultSelected,
            groupValue: widget.isSelected,
            onChanged: (bool? value) {
              if (value != null && value) {
                
              }
            },
          ),
        ],
      ),
    );
  }
}
