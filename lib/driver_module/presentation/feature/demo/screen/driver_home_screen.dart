
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../base_module/data/entity/models/page_input.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../user_module/domain/entity/authentication.dart';
import '../../../../../user_module/presentation/components/signout_card.dart';
import '../../../../../user_module/presentation/core/values/user_assets.dart';
import '../../../../../user_module/presentation/feature/authentication/blocs/authentication/authentication_bloc.dart';
import '../bloc/deliverd_delivery_by_delivery_boy/delivered_delivery_by_delivery_boy_bloc.dart';
import '../bloc/pending_delivery_by_delivery_boy/pending_delivery_by_delivery_boy_bloc.dart';
import '../widgets/delivery_tab_widget.dart';
import '../widgets/pending_delivery_tab_view.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({Key? key}) : super(key: key);

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  @override
  void initState() {
    getPendingDelivery();
    getDeliveredData();

    super.initState();
  }

  getPendingDelivery() {
    BlocProvider.of<PendingDeliveryByDeliveryBoyBloc>(context).add(
        GetPendingDeliveryByDeliveryBoy(
            orderStatus: "DISPATCHED", pageInput: PageInput()));
  }

  getDeliveredData() {
    BlocProvider.of<DeliveredDeliveryByDeliveryBoyBloc>(context).add(
        GetDeliveredDeliveryByDeliveryBoy(
            pageInput: PageInput(), orderStatus: "DELIVERED"));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Theme.of(context).colorScheme.background,
          child: SvgPicture.asset(
            UserAssets.PATTERN,
            fit: BoxFit.fill,
          ),
        ),
        DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(126.0),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: Text(""),
                  // Theme.of(context).colorScheme.primary,
                  centerTitle: true,
                  title: Image.asset(
                    ThemeAssets.fresh,
                    fit: BoxFit.fitHeight,
                    height: MediaQuery.of(context).size.height / 20,
                  ),

                  actions: [
                    IconButton(
                      icon: Icon(
                        MdiIcons.power,
                        size: 27,
                        color:
                            AppColorScheme.primaryColorLight.withOpacity(0.85),
                      ),
                      onPressed: () {
                        _onSignOut(context);
                      },
                    ),
                    // LanguageSwitcherButton(),
                  ],

                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(122.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                          labelPadding:
                              const EdgeInsets.only(left: 6, right: 6),

                          onTap: (index) {},
                          tabs: [
                            Tab(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //  Text("pending"),
                                  Text(
                                    translation.of("user.pending"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            color: AppColorScheme
                                                .primaryColorLight,
                                            fontSize: 16),
                                  ),
                                  const SizedBox(width: 6),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      translation.of("user.delivered"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              color: AppColorScheme
                                                  .primaryColorLight,
                                              fontSize: 16,
                                              overflow: TextOverflow.ellipsis),
                                      maxLines: 1,
                                      // Theme.of(context)
                                      //     .colorScheme
                                      //     .onPrimary
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                          indicatorColor: AppColorScheme.primaryColorLight,
                          // Theme.of(context).colorScheme.background,
                          labelColor: AppColorScheme.primaryColorLight,
                          // Theme.of(context).colorScheme.primaryContainer,
                          unselectedLabelColor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding / 4,
                    vertical: AppConstants.defaultPadding / 4),
                child: TabBarView(
                  children: [
                    PendingDeliveryWidget(),
                    DeliveryTabWidget(),
                    // DeliveryTabNotCompletedWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onSignOut(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.all(AppConstants.defaultPadding),
            child: SignoutCard(
              onPressed: () async {
                // BlocProvider.of<SignOutBloc>(context).add(SignOut());
                _navigateToNext(context);
              },
            ),
          );
        });
  }

  void _navigateToNext(BuildContext context) async {
    await authentication.clearAuthenticatedUser();

    BlocProvider.of<AuthenticationBloc>(context).add(SignedOut());

    // Navigator.pushNamedAndRemoveUntil(
    //   context,
    //   UserRouter.signInScreen,
    //       (route) => false,
    // );
  }
}
