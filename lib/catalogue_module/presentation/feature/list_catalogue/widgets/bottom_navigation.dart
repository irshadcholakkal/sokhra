// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';
// import '../../../../../new_cart_module/presentation/widget/cart_bottom_bar.dart';
// import '../../../../../orders_module/presentation/feature/orders/screens/orders_screen.dart';
// import '../../../../../user_module/presentation/feature/profile/screens/profile_page.dart';
// import '../screens/list_catalogue.dart';
// // class MyBottomNavigationBar extends StatelessWidget {
// //   PersistentTabController _controller =
// //       PersistentTabController(initialIndex: 0);
// //   Color active = AppColorScheme.primaryColor;
// //   Color inactive = Color(0xFFD5BBFC);
// //   List<PersistentBottomNavBarItem> _navBarItems() {
// //     return [
// //       PersistentBottomNavBarItem(
// //         icon: Icon(Iconsax.home_2),
// //         title: "Home",
// //         activeColorPrimary: active,
// //         inactiveColorPrimary: inactive,
// //       ),
// //       PersistentBottomNavBarItem(
// //         icon: Icon(Iconsax.shopping_bag),
// //         title: "Cart",
// //         activeColorPrimary: active,
// //         inactiveColorPrimary: inactive,
// //       ),
// //       PersistentBottomNavBarItem(
// //         icon: Icon(Iconsax.clipboard_text),
// //         title: "Orders",
// //         activeColorPrimary: active,
// //         inactiveColorPrimary: inactive,
// //       ),
// //       PersistentBottomNavBarItem(
// //         icon: Icon(Iconsax.user),
// //         title: "Profile",
// //         activeColorPrimary: active,
// //         inactiveColorPrimary: inactive,
// //       ),
// //     ];
// //   }
// //   List<Widget> _screens() {
// //     return [
// //       ListCatalogue(),
// // CartBottomBar(),
// //       OrdersScreen(),
// // ProfileScreen ()   ];
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return PersistentTabView(
// //       context,
// //       controller: _controller,
// //       screens: _screens(),
// //       items: _navBarItems(),
// //       confineInSafeArea: true,
// //       backgroundColor: AppColorScheme.onPrimaryLight,
// //       handleAndroidBackButtonPress: true,
// //       resizeToAvoidBottomInset: true,
// //       stateManagement: true,
// //       hideNavigationBarWhenKeyboardShows: true,
// //       popAllScreensOnTapOfSelectedTab: true,
// //       popActionScreens: PopActionScreensType.all,
// //       itemAnimationProperties: ItemAnimationProperties(
// //         duration: Duration(milliseconds: 200),
// //         curve: Curves.easeInOut,
// //       ),
// //       screenTransitionAnimation: ScreenTransitionAnimation(
// //         animateTabTransition: true,
// //         curve: Curves.easeInOut,
// //         duration: Duration(milliseconds: 200),
// //       ),
// //       navBarHeight: 90,
// //       decoration: NavBarDecoration(
// //           adjustScreenBottomPaddingOnCurve: true,
// //           borderRadius: BorderRadius.circular(20)),
// //      navBarStyle: NavBarStyle.style3,
// //     );
// //   }
// // }
// class MyBottomNavigationBar extends StatefulWidget {
//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }
// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   int _currentIndex = 0;
//   List<Widget> _screens = [
//     ListCatalogue(),
//     CartBottomBar(),
//     OrdersScreen(),
//     ProfileScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_currentIndex],
//       bottomNavigationBar: Container(
//         height: 90,
//         decoration: ShapeDecoration(
//           color: AppColorScheme.onPrimaryLight,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//         ),
//         child: Stack(
//           children: [
//             BottomNavigationBar(
//               backgroundColor: Colors.transparent,
//               type: BottomNavigationBarType.fixed,
//               selectedLabelStyle: TextStyle(
//                 color: AppColorScheme.primaryColor,
//                 fontSize: 11,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w500,
//               ),
//               unselectedLabelStyle: TextStyle(
//                 color: Color(0xFFD5BBFC),
//                 fontSize: 11,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w500,
//               ),
//               currentIndex: _currentIndex,
//               onTap: (index) {
//                 setState(() {
//                   _currentIndex = index;
//                 });
//               },
//               selectedItemColor: AppColorScheme.primaryColor,
//               unselectedItemColor: Color(0xFFD5BBFC),
//               showSelectedLabels: true,
//               showUnselectedLabels: true,
//               items: [
//                 BottomNavigationBarItem(
//                   icon: Icon(Iconsax.home_2),
//                   label: "Home",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Iconsax.shopping_bag),
//                   label: "Cart",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Iconsax.clipboard_text),
//                   label: "Orders",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Iconsax.user),
//                   label: "Profile",
//                 ),
//               ],
//             ),
//             Positioned(
//               left: (_currentIndex == 0
//                   ? MediaQuery.of(context).size.width * 0.059
//                   : _currentIndex == 1
//                       ? MediaQuery.of(context).size.width * 0.310
//                       : _currentIndex == 2
//                           ? MediaQuery.of(context).size.width * 0.57
//                           : _currentIndex == 3
//                               ? MediaQuery.of(context).size.width * 0.81
//                               : null),
//               //_currentIndex * (MediaQuery.of(context).size.width /4)),
//               top: 0,
//               child: Container(
//                 width: MediaQuery.of(context).size.width / 8.5,
//                 height: 4,
//                 decoration: ShapeDecoration(
//                   color: AppColorScheme.primaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(10),
//                       bottomRight: Radius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

















import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';
import 'package:lumiereorganics_app/catalogue_module/presentation/feature/list_catalogue/blocs/featured_products_bloc/featured_products_bloc.dart';
import 'package:lumiereorganics_app/catalogue_module/presentation/feature/list_catalogue/blocs/featured_products_bloc/featured_products_event.dart';
import 'package:lumiereorganics_app/catalogue_module/presentation/feature/list_catalogue/screens/products_list.dart';
import 'package:lumiereorganics_app/new_cart_module/domain/new_cart_model.dart';
import 'package:lumiereorganics_app/new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
import 'package:lumiereorganics_app/new_cart_module/presentation/blocs/new_cart_bloc/new_cart_event.dart';
import 'package:lumiereorganics_app/new_cart_module/presentation/blocs/new_cart_bloc/new_cart_state.dart';
import 'package:lumiereorganics_app/user_module/domain/user_data.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../new_cart_module/presentation/widget/cart_bottom_bar.dart';
import '../../../../../orders_module/presentation/feature/orders/screens/orders_screen.dart';
import '../../../../../payment_module/presentation/feature/payment_status/payment_status_screen.dart';
import '../../../../../user_module/presentation/feature/profile/screens/profile_page.dart';
import '../../../../../user_module/presentation/feature/profile/screens/personal_details.dart';
import '../screens/list_catalogue.dart';

// class MyBottomNavigationBar extends StatelessWidget {
//   PersistentTabController _controller =
//       PersistentTabController(initialIndex: 0);
//   Color active = AppColorScheme.primaryColor;
//   Color inactive = Color(0xFFD5BBFC);
//   List<PersistentBottomNavBarItem> _navBarItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Icon(Iconsax.home_2),
//         title: "Home",
//         activeColorPrimary: active,
//         inactiveColorPrimary: inactive,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Iconsax.shopping_bag),
//         title: "Cart",
//         activeColorPrimary: active,
//         inactiveColorPrimary: inactive,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Iconsax.clipboard_text),
//         title: "Orders",
//         activeColorPrimary: active,
//         inactiveColorPrimary: inactive,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Iconsax.user),
//         title: "Profile",
//         activeColorPrimary: active,
//         inactiveColorPrimary: inactive,
//       ),
//     ];
//   }
//   List<Widget> _screens() {
//     return [
//       ListCatalogue(),
// CartBottomBar(),
//       OrdersScreen(),
// ProfileScreen ()   ];
//   }
//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _screens(),
//       items: _navBarItems(),
//       confineInSafeArea: true,
//       backgroundColor: AppColorScheme.onPrimaryLight,
//       handleAndroidBackButtonPress: true,
//       resizeToAvoidBottomInset: true,
//       stateManagement: true,
//       hideNavigationBarWhenKeyboardShows: true,
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: ItemAnimationProperties(
//         duration: Duration(milliseconds: 200),
//         curve: Curves.easeInOut,
//       ),
//       screenTransitionAnimation: ScreenTransitionAnimation(
//         animateTabTransition: true,
//         curve: Curves.easeInOut,
//         duration: Duration(milliseconds: 200),
//       ),
//       navBarHeight: 90,
//       decoration: NavBarDecoration(
//           adjustScreenBottomPaddingOnCurve: true,
//           borderRadius: BorderRadius.circular(20)),
//      navBarStyle: NavBarStyle.style3,
//     );
//   }
// }

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  List<Cart> _cartList = [];

  // List<Widget> _screens = [
  //   ListCatalogue(),
  //   CartBottomBar(),
  //   OrdersScreen(),
  //   ProfileScreen(),
  // ];

  @override
  void initState() {
    super.initState();

    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NewCartBloc, NewCartState>(
        listener: (context, state) {
          if (state is CartLoaded) {
            setState(() {
              _cartList = state.cartList ?? [];
            });
          } else if (state is CartLoading) {
          } else if (state is CartLoadingFailed) {
            BlocProvider.of<NewCartBloc>(context).add(
              FetchCartItems(pincode: userData.pinCode),
            );
          }
        },
        child: _currentIndex == 0
            ? ListCatalogue()
            : _currentIndex == 1
                ? CartBottomBar(
                    cartList: _cartList,
                    onPress: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                  )
                : _currentIndex == 2
                    ? OrdersScreen(
                        onPress: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                      )
                    :            
                    ProfileScreen(
          onPress: (){
            setState(() {
              _currentIndex =0;
            });
          },
        ),
      ),
      bottomNavigationBar: _currentIndex == 1
          ? SizedBox()
          : Container(
              height: 90,
              decoration: ShapeDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),

                  ),
                ),
              ),
              child: Stack(
                children: [
                  BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    type: BottomNavigationBarType.fixed,
                    selectedLabelStyle: TextStyle(
                      color: AppColorScheme.primaryColor,
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: Color(0xFFD5BBFC),
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    currentIndex: _currentIndex,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    selectedItemColor: AppColorScheme.primaryColor,
                    unselectedItemColor: Color(0xFFD5BBFC),
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Iconsax.home_2),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Iconsax.shopping_bag),
                        label: "Cart",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Iconsax.clipboard_text),
                        label: "Orders",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Iconsax.user),
                        label: "Profile",
                      ),
                    ],
                  ),
                  Positioned(
                    left: (_currentIndex == 0
                        ? MediaQuery.of(context).size.width * 0.059
                        : _currentIndex == 1
                            ? MediaQuery.of(context).size.width * 0.310
                            : _currentIndex == 2
                                ? MediaQuery.of(context).size.width * 0.57
                                : _currentIndex == 3
                                    ? MediaQuery.of(context).size.width * 0.81
                                    : null),

                    //_currentIndex * (MediaQuery.of(context).size.width /4)),
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 8.5,
                      height: 4,
                      decoration: ShapeDecoration(
                        color: AppColorScheme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  _getProducts() {
    BlocProvider.of<AppDataBloc>(context).add(FetchAppData());
    // globalReloadCommonData();
    // globalReloadUserData();
    BlocProvider.of<ListFeaturedProductsBloc>(context).add(
      FetchFeaturedProducts(pincode: userData.pinCode),
    );
    BlocProvider.of<NewCartBloc>(context).add(
      FetchCartItems(pincode: userData.pinCode),
    );
  }
}

