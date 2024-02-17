import 'package:flutter/material.dart';

import '../../../base_module/domain/entity/color_scheme.dart';
import '../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../base_module/presentation/component/buttons/custom_close_button.dart';
import '../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../../catalogue_module/presentation/feature/details/blocs/loctaion_check_cubit/location_check_cubit.dart';
import 'manage_address_content.dart';

class ManageAddressBottomSheet extends StatelessWidget {
  final bool isFromLocationScreen;
  final LocationDetails? locationDetails;

  const ManageAddressBottomSheet({
    Key? key,
    this.isFromLocationScreen = false,
    this.locationDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: AppColorScheme.backgroundColorLight,
      appBar: SimpleAppBar(title: "My Account",),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
           // mainAxisSize: MainAxisSize.min,
            children: [
            //  CustomCloseButton(),
             // AppPadding(multipliedBy: 0.6),
              ManageAddressContent(
                isFromLocationScreen: isFromLocationScreen,
                locationDetails: locationDetails,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
