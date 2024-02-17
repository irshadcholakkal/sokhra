import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_settings_module/domain/entity/models/shipping_address.dart';
import '../../../../../app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/appbar/custom_appbar.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../user_module/data/entity/input_models/edit_address_arguments.dart';
import '../../../../../user_module/presentation/core/values/user_router.dart';
import '../blocs/address_selection_bloc/address_selection_bloc.dart';
import '../widgets/selectable_address_card.dart';

class SelectAddressScreen extends StatelessWidget {
  final double height;

  const SelectAddressScreen({Key? key, this.height = 360}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context: context,
        isHome: false,
        isTitleText: true,
        titleText: translation.of("cart.select_address"),
      ),
      body: BlocListener<AddressSelectionBloc, AddressSelectionState>(
        listener: (context, state) {
          if (state is AddressSelectionSuccess) {
            showSuccessFlash(
                context: context,
                message: translation.of("cart.address_change_success"));
          }
        },
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppPadding(),
                  Container(
                    height: height,
                    child: BlocBuilder<AppDataBloc, AppDataState>(
                      builder: (context, state) {
                        if (state is FetchAppDataSuccess) {
                          List<ShippingAddress> addressList =
                              state.appData.addressDetails!;
                          if (addressList.isNotEmpty) {
                            return ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: addressList.length,
                                itemBuilder: (context, index) {
                                  return SelectableAddressCard(
                                      address: addressList[index],
                                      userId: state.appData.user?.id);
                                });
                          } else {
                            return Container(
                              child: Center(
                                child: Text(
                                    translation.of("address_list_is_empty")),
                              ),
                            );
                          }
                        } else if (state is FetchAppDataFailed) {
                          return Text(
                            state.message,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            UserRouter.addAddressScreen,
                            arguments: EditAddressArguments());
                        // pushNewScreenWithRouteSettings(context,
                        //     settings: RouteSettings(
                        //         arguments: EditAddressArguments(),
                        //         name: UserRouter.addAddressScreen),
                        //     screen: AddAddressScreen());
                      },
                      child: Text(
                        translation.of("user.add_new_address"),
                        style: Theme.of(context).textTheme.button?.copyWith(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
