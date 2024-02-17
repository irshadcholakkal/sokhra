import 'package:flutter/material.dart';

import '../../feature/payment/screens/payment_screen.dart';
import '../../feature/payment_status/payment_status_screen.dart';
import '../../feature/wallet/screens/wallet_screen.dart';

class PaymentsRouter {
  static const paymentStatusScreen = "/paymentStatusScreen";
  static const walletScreen = "/walletScreen";
  static const paymentScreen = "/paymentScreen";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case paymentStatusScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PaymentStatusScreen(),
        );
      case walletScreen:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const WalletScreen(),
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
        //   builder: (_) => const WalletScreen(),
        // );
      case paymentScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PaymentScreen(),
        );
      default:
        return null;
    }
  }
}
