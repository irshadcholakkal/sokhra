import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base_module/data/entity/graphql_service.dart';
import '../../../../../base_module/domain/args/navigation_args.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/appbar/custom_appbar.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_bloc.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_event.dart';
import '../../../../../cart_wishlist_module/presentation/feature/wishlist/blocs/customer_wishlist_bloc/customer_wishlist_bloc.dart';
import '../../../../../main.dart';
import '../../../../../orders_module/presentation/core/values/orders_router.dart';
import '../../../../../payment_module/presentation/core/values/payments_router.dart';
import '../../../../../user_module/presentation/components/signout_card.dart';
import '../../../../../user_module/presentation/core/values/user_router.dart';
import '../../../../domain/entity/authentication.dart';
import '../../../../domain/user_data.dart';
import '../../authentication/blocs/authentication/authentication_bloc.dart';
import '../../sign_out/blocs/sign_out_bloc/sign_out_bloc.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppbar(
        context: context,
        isHome: false,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: BlocListener<SignOutBloc, SignOutState>(
            listener: (context, state) {
              if (state is SignOutSuccess) {
                BlocProvider.of<AuthenticationBloc>(context).add(SignedOut());
                _navigateToNext(context);
              } else if (state is SignOutFailed) {
                showErrorFlash(
                  context: context,
                  message: state.message,
                );
              }
            },
            child: Container(
              width: double.infinity,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 420),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Theme.of(context).backgroundColor,
                        width: double.infinity,
                        padding: EdgeInsets.all(AppConstants.defaultPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 360,
                              child: Text(
                                "Hi ${Authentication().user?.name ?? "Guest"}", //TODO change dummy details
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                            const AppPadding(
                              dividedBy: 4,
                            ),
                            if (!authentication.isAuthenticated)
                              ElevatedButton(
                                  onPressed: () {
                                    // pushNewScreenWithRouteSettings(context,
                                    //     settings: RouteSettings(
                                    //       name: UserRouter.signInScreen,
                                    //     ),
                                    //     withNavBar: false,
                                    //     screen: SignInScreen());
                                    // Navigator.pushNamed(
                                    //     context, UserRouter.signInScreen);
                                  },
                                  child: Text(
                                    translation
                                        .of("user.sign_in")
                                        .toUpperCase(),
                                  )),
                            if (authentication.isAuthenticated)
                              Container(
                                width: 360,
                                child: Text(
                                  Authentication().authenticatedUser != null
                                      ? Authentication()
                                          .authenticatedUser!
                                          .user!
                                          .email!
                                      : "username@email.com",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                            if (authentication.isAuthenticated)
                              Container(
                                width: 360,
                                child: Text(
                                  Authentication().authenticatedUser != null
                                      ? Authentication()
                                          .authenticatedUser!
                                          .user!
                                          .phone!
                                      : "+91 9999999999",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (authentication.isAuthenticated)
                        Column(
                          children: [
                            ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppConstants.defaultPadding),
                                title: Text(
                                  "Profile",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                onTap: () => _profileOnTap(context),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                )),
                            const Divider(
                              thickness: 1,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppConstants.defaultPadding),
                              title: Text(
                                "My Orders",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              onTap: () => _myOrdersOnTap(context),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppConstants.defaultPadding),
                              title: Text(
                                "Wallet",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              onTap: () => _walletOnTap(context),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppConstants.defaultPadding),
                              title: Text(
                                "Notifications",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              onTap: () => _notificationOnTap(context),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppConstants.defaultPadding),
                              title: Text(
                                "Signout",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              onTap: () => _onSignOut(context),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                      const AppPadding(
                        multipliedBy: 4,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // SizedBox(
                            //   height: 100,
                            //   width: 120,
                            //   child: SvgPicture.asset(
                            //     ThemeAssets.appIconSecondary,
                            //     fit: BoxFit.fitWidth,
                            //   ),
                            // ),
                            SizedBox(
                              height: 100,
                              width: 120,
                              child: Image.asset(
                                ThemeAssets.appIconSecondary,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Center(
                                child: Text(
                                  "Version 1.0",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ),
                            const AppPadding(),
                            Container(
                              width: 200,
                              child: Center(
                                child: Text(
                                  "Designed and developed by",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.5)),
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              child: Center(
                                child: Text(
                                  "Armino Technologies",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
    BlocProvider.of<CustomerWishlistBloc>(context)
        .add(CustomerWishListResetEvent());
    BlocProvider.of<CartBloc>(context).add(CartResetEvent());
    await Future.value([
      await userData.removeUserData(),
      await authentication.clearAuthenticatedUser()
    ]);

    graphQLService.resetCache();
    // CustomPageController.controller.jumpToTab(0);
    RestartWidget.restartApp(context);
    // await userData.removeUserData();
    // await authentication.clearAuthenticatedUser().then((value) {
    //   graphQLService.resetCache();
    //   CustomPageController.controller.jumpToTab(0);
    // });
  }

  _profileOnTap(BuildContext context) {
    Navigator.pushNamed(context, UserRouter.profileScreen,
        arguments: FromDrawerArgs(isFromDrawer: true));
  }

  _walletOnTap(BuildContext context) {
    Navigator.pushNamed(context, PaymentsRouter.walletScreen,
        arguments: FromDrawerArgs(isFromDrawer: true));
  }

  _myOrdersOnTap(BuildContext context) {
    Navigator.pushNamed(context, OrdersRouter.ordersScreen);
  }

  _notificationOnTap(BuildContext context) {
    Navigator.pushNamed(context, UserRouter.notificationScreen);
  }
}
