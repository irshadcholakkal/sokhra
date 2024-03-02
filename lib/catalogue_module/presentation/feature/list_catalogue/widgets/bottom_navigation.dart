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
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../new_cart_module/presentation/widget/cart_bottom_bar.dart';
import '../../../../../orders_module/presentation/feature/orders/screens/orders_screen.dart';
import '../../../../../payment_module/presentation/feature/payment_status/payment_status_screen.dart';
import '../../../../../user_module/presentation/feature/profile/screens/profile_page.dart';
import '../../../../../user_module/presentation/feature/profile/screens/personal_details.dart';
import '../screens/list_catalogue.dart';

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
                    : ProfileScreen(
                        onPress: () {
                          setState(() {
                            _currentIndex = 0;
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
                    topLeft: Radius.circular(AppConstants.cornerRadius),
                    topRight: Radius.circular(AppConstants.cornerRadius),
                  ),
                ),
              ),
              child: Stack(
                children: [
                  BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    type: BottomNavigationBarType.fixed,
                    selectedLabelStyle:
                        Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: AppColorScheme.primaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                    unselectedLabelStyle:
                        Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: AppColorScheme.primaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                    currentIndex: _currentIndex,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    selectedItemColor: AppColorScheme.primaryColor,
                    unselectedItemColor: AppColorScheme.inActiveText,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Iconsax.home_2),
                        label: translation.of("catalogue.home"),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Iconsax.shopping_bag),
                        label: translation.of("catalogue.cart"),
                        // "Cart",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Iconsax.clipboard_text),
                        label: translation.of("catalogue.orders"),
                        //"Orders",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Iconsax.user),
                        label: translation.of("catalogue.profile"),
                        // "Profile",
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
                            bottomLeft:
                                Radius.circular(AppConstants.cornerRadiusMin),
                            bottomRight:
                                Radius.circular(AppConstants.cornerRadiusMin),
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
