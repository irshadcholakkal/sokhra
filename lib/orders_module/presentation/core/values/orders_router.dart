import 'package:flutter/material.dart';

import '../../feature/orders/screens/orders_screen.dart';

class OrdersRouter {
  static const ordersScreen = "/ordersScreen";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ordersScreen:
        return

          PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const OrdersScreen(),
            transitionsBuilder: (_, animation, __, child) {
              return  SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );


        //   MaterialPageRoute(
        //   settings: settings,
        //   builder: (_) => const OrdersScreen(),
        // );


      default:
        return null;
    }
  }
}
