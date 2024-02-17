import 'package:flutter/material.dart';

import 'base_module/domain/entity/translation.dart';
import 'cart_wishlist_module/presentation/core/values/cart_router.dart';
import 'catalogue_module/presentation/core/values/catalogue_router.dart';
import 'orders_module/presentation/core/values/orders_router.dart';
import 'payment_module/presentation/core/values/payments_router.dart';
// import 'customer_module/presentation/core/values/customer_router.dart';
import 'user_module/presentation/core/values/user_router.dart';
// import 'vendor_module/presentation/core/values/vendor_router.dart';

class CustomRouter {
  final _routes = [
    // CustomerRouter.generateRoute,
    UserRouter.generateRoute,
    PaymentsRouter.generateRoute,
    CatalogueRouter.generateRoute,
    CartRouter.generateRoute,
    OrdersRouter.generateRoute
    // VendorRouter.generateRoute,
  ];

  Route<dynamic> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments as Map? ?? {};
    // final menuItem = arguments['menuItem'] as FoodItem?;

    for (final item in _routes) {
      final route = item(settings);

      if (route != null) {
        return route;
      }
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            translation.of("coming_soon"),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}

final customRouter = CustomRouter();
