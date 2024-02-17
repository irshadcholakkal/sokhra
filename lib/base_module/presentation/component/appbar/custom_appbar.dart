import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../cart_wishlist_module/presentation/core/values/cart_router.dart';
import '../../../../home/components/custom_search_delegate.dart';
import '../../../../user_module/domain/entity/authentication.dart';
import '../../../../user_module/domain/user_data.dart';
import '../../../../user_module/presentation/core/values/user_router.dart';
import '../../../../user_module/presentation/feature/notifications/blocs/notification_list/notification_list_bloc.dart';
import '../../core/values/app_assets.dart';

class CustomAppbar extends AppBar {
  final double radius;
  final bool isHome;
  final bool isProductList;
  final bool isTitleText;
  final String? titleText;
  final BuildContext context;
  final String? categoryId;
  final VoidCallback? onSortButtonClick;
  CustomAppbar(
      {this.titleText,
      this.isTitleText = false,
      this.isProductList = false,
      this.isHome = true,
      this.onSortButtonClick,
      required this.context,
      this.radius = 30,
      this.categoryId})
      : assert(isTitleText ? titleText != null : titleText == null),
        assert(isProductList == true
            ? onSortButtonClick != null
            : onSortButtonClick == null),
        super(
            elevation: 5,
            backgroundColor: Theme.of(context).colorScheme.surface,
            leading: isHome
                ? IconButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, UserRouter.drawerScreen);
                      Navigator.of(context).pushNamed(UserRouter.drawerScreen);

                      // pushNewScreenWithRouteSettings(context,
                      //     withNavBar: false,
                      //     settings: RouteSettings(
                      //       name: UserRouter.drawerScreen,
                      //     ),
                      //     screen: DrawerScreen());
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).colorScheme.primary,
                    ))
                : IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Theme.of(context).colorScheme.primary,
                    )),
            title: isTitleText
                ? Text(
                    titleText!,
                    style: Theme.of(context).textTheme.headline6,
                  )
                // : SvgPicture.asset(ThemeAssets.appIconSecondary),
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      child: Image.asset(
                        ThemeAssets.appIconSecondary,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
            centerTitle: isTitleText ? false : true,
            actions: [
              if (authentication.isAuthenticated)
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(UserRouter.notificationScreen);
                      // pushNewScreenWithRouteSettings(context,
                      //     withNavBar: false,
                      //     settings: RouteSettings(
                      //         name: UserRouter.notificationScreen),
                      //     screen: NotificationsScreen());
                    },
                    icon: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        BlocBuilder<NotificationListBloc,
                            NotificationListState>(
                          builder: (context, state) {
                            if (state is FetchNotificationListSuccess) {
                              num length = state
                                      .notificationList.notifications?.length ??
                                  0;
                              if (length > userData.notificationCount) {
                                return Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                );
                              } else {
                                return Container(
                                  height: 10,
                                );
                              }
                            } else {
                              return Container(
                                height: 10,
                              );
                            }
                          },
                        )
                      ],
                    )),
              IconButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(CartRouter.wishlistScreen),

                  // pushNewScreenWithRouteSettings(context,
                  // withNavBar: false,
                  // settings: RouteSettings(name: CartRouter.wishlistScreen),
                  // screen: CustomerWishlistScreen()),
                  icon: Icon(
                    Icons.favorite_outline,
                    color: Theme.of(context).colorScheme.primary,
                  )),
              IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate:
                          CustomSearchDelegate(categoryId: categoryId ?? ""),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                  )),
              // Container(
              //   margin: const EdgeInsets.only(right: 20, left: 10),
              //   width: 100,
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //
              //     ],
              //   ),
              // ),
            ],
            shape: isProductList
                ? null
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius))),
            bottom: isProductList
                ? PreferredSize(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Tab(
                            child: TextButton.icon(
                                onPressed: onSortButtonClick,
                                icon: Icon(MdiIcons.sort),
                                label: Text("Sort")),
                          ),
                          Container(
                            height: 32,
                            child: Center(
                              child: VerticalDivider(
                                width: 1,
                                color: Theme.of(context).colorScheme.primary,
                                thickness: 1,
                              ),
                            ),
                          ),
                          Tab(
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(MdiIcons.filter),
                                label: Text("Filter")),
                          ),
                        ],
                      ),
                    ),
                    preferredSize: Size.fromHeight(40))
                : null);
}
