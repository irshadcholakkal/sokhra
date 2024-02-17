import 'package:flutter/material.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../../catalogue_module/presentation/feature/details/blocs/loctaion_check_cubit/location_check_cubit.dart';
import '../../../components/manage_address_content.dart';

class ManageAddressScreen extends StatefulWidget {
  final bool isFromLocationScreen;
  final LocationDetails? locationDetails;

  const ManageAddressScreen({
    Key? key,
    this.isFromLocationScreen = false,
    this.locationDetails,
  }) : super(key: key);

  @override
  State<ManageAddressScreen> createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.secondaryBackgroundColor,
      appBar: SimpleAppBar(
        title: "My addresses",
        canGoBack: !widget.isFromLocationScreen,
      ),
      body: ManageAddressContent(
        isFromLocationScreen: widget.isFromLocationScreen,
        locationDetails: widget.locationDetails,
      ),
    );
  }
}
