// import 'package:flutter/material.dart';
//
// import '../../feature/drawer/screens/drawer_screen.dart';
// import '../../feature/notifications/screens/notifications_screen.dart';
// import '../../feature/profile/screens/add_address_screen.dart';
// import '../../feature/profile/screens/profile_screen.dart';
// import '../../feature/profile/screens/update_password_screen.dart';
// import '../../feature/sign_in/screens/signin_screen.dart';
// import '../../feature/sign_up/screens/signup_screen.dart';
//
// class UserRouter {
//   static const profileScreen = '/profileScreen';
//   static const notificationScreen = '/notificationScreen';
//   static const updatePasswordScreen = '/updatePasswordScreen';
//   static const signInScreen = '/signInScreen';
//   static const signUpScreen = '/signUpScreen';
//   static const drawerScreen = "/drawerScreen";
//   static const addAddressScreen = "/addAddressScreen";
//
//   static Route<dynamic>? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case profileScreen:
//         return PageRouteBuilder(
//           settings: settings,
//           pageBuilder: (_, __, ___) => const ProfileScreen(),
//           transitionsBuilder: (_, animation, __, child) {
//             return SlideTransition(
//               position: Tween<Offset>(
//                 begin: const Offset(1.0, 0.0),
//                 end: Offset.zero,
//               ).animate(animation),
//               child: child,
//             );
//           },
//         );
//       case notificationScreen:
//         return PageRouteBuilder(
//           settings: settings,
//           pageBuilder: (_, __, ___) => const NotificationsScreen(),
//           transitionsBuilder: (_, animation, __, child) {
//             return SlideTransition(
//               position: Tween<Offset>(
//                 begin: const Offset(1.0, 0.0),
//                 end: Offset.zero,
//               ).animate(animation),
//               child: child,
//             );
//           },
//         );
//       case updatePasswordScreen:
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (_) => const UpdatePasswordScreen(),
//         );
//       case signInScreen:
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (_) => const SignInScreen(),
//         );
//       case signUpScreen:
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (_) => const SignUpScreen(),
//         );
//       case drawerScreen:
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (_) => const DrawerScreen(),
//         );
//       case addAddressScreen:
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (_) => const AddAddressScreen(),
//         );
//       default:
//         return null;
//     }
//   }
// }
//
//
//

import 'package:flutter/material.dart';
import '../../feature/sign_in/screens/intro_screen.dart';
import '../../../../base_module/presentation/feature/demo/screen/mobile_number_sign_up_screen.dart';
import '../../feature/drawer/screens/drawer_screen.dart';
import '../../feature/notifications/screens/notifications_screen.dart';
import '../../feature/profile/screens/personal_details.dart';
import '../../feature/profile/screens/update_password_screen.dart';
import '../../feature/sign_up/screens/signup_screen.dart';

class UserRouter {
  static const profileScreen = '/profileScreen';
  static const notificationScreen = '/notificationScreen';
  static const updatePasswordScreen = '/updatePasswordScreen';
  // static const signInScreen = '/signInScreen';
  static const signUpScreen = '/signUpScreen';
  static const drawerScreen = "/drawerScreen";
  static const addAddressScreen = "/addAddressScreen";
  static const introScreen = "/introScreen";
  static const subCategoryScreen = "/subCategoryScreen";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case profileScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const personalDetails(),
          //ProfileScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
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
      //   builder: (_) => const ProfileScreen(),
      //
      // );
      case notificationScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const NotificationsScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      //   MaterialPageRoute(
      //
      //   settings: settings,
      //   builder: (_) => const NotificationsScreen(),
      // );

      case updatePasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const UpdatePasswordScreen(),
        );
      // case signInScreen:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => const SignInScreen(),
      //   );
      case signUpScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MobileNumberScreenForSignUp(),
        );
      case drawerScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DrawerScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      //   MaterialPageRoute(
      //   settings: settings,
      //   builder: (_) => const DrawerScreen(),
      // );
      // case addAddressScreen:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => const AddAddressScreen(),
      //   );
      case introScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignInPage(),
        );
      default:
        return null;
    }
  }
}
