import 'package:flutter/material.dart';

import '../../feature/cart/screens/cart_screen.dart';
import '../../feature/shipping_details/screen/select_address_screen.dart';
import '../../feature/shipping_details/screen/shipping_details_screen.dart';
import '../../feature/wishlist/screens/customer_wishlist_screen.dart';

class CartRouter {
  static const cartScreen = "/cartScreen";
  static const shippingDetailsScreen = "/shippingDetailsScreen";
  static const selectAddressScreen = "/selectAddressScreen";
  static const wishlistScreen = "/wishlistScreen";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case cartScreen:
        return

    //       PageRouteBuilder(
    //         settings: settings,
    //         pageBuilder: (_, __, ___) => const CartScreen(),
    // transitionsBuilder: (_, animation, __, child) {
    // return  SlideTransition(
    // position: Tween<Offset>(
    // begin: const Offset(1.0, 0.0),
    // end: Offset.zero,
    // ).animate(animation),
    // child: child,
    // );});

          MaterialPageRoute(
          settings: settings,
          builder: (_) => const CartScreen(),
        );
      case shippingDetailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ShippingDetailsScreen(),
        );
      case selectAddressScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SelectAddressScreen(),
        );
      case wishlistScreen:
        return   PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const CustomerWishlistScreen(),
            transitionsBuilder: (_, animation, __, child) {
              return  SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );});
          // MaterialPageRoute(
          //   settings: settings, builder: (_) => const CustomerWishlistScreen());
      default:
        return null;
    }
  }
}
