import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_settings_module/domain/entity/models/shipping_address.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../base_module/presentation/util/string_modifiers.dart';
import '../blocs/address_selection_bloc/address_selection_bloc.dart';

class SelectableAddressCard extends StatelessWidget {
  const SelectableAddressCard(
      {Key? key, required this.address, required this.userId})
      : super(key: key);
  final ShippingAddress? address;
  final String? userId;

  @override
  Widget build(BuildContext context) {
    Color? color;
    String name = (address?.firstName ?? "") + " " + (address?.lastName ?? "");
    String? type =
        StringModifiers.enumToString(address?.type)?.replaceAll("_", "");
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
    return InkWell(
      onTap: () {
        BlocProvider.of<AddressSelectionBloc>(context).add(
            AddressSelectionSetEvent(address: address, addressText: _address));
      },
      child: Padding(
        padding: EdgeInsets.only(right: 10, left: 20.0, bottom: 10.0),
        //  padding: EdgeInsets.all(8.0),
        child: Card(
          color: color,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppConstants.defaultPadding * 0.6,
                horizontal: AppConstants.defaultPadding * 0.6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "$name",
                  style: Theme.of(context).textTheme.headline6,
                ),
                AppPadding(
                  dividedBy: 4,
                ),
                Container(
                  width: 300,
                  child: Text(
                    "${_address}",
                    textAlign: TextAlign.start,
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                AppPadding(
                  dividedBy: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
