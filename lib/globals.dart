import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import 'base_module/domain/entity/color_scheme.dart';
import 'user_module/presentation/feature/sign_in/screens/intro_screen.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/featured_products_bloc/featured_products_bloc.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/featured_products_bloc/featured_products_event.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/list_all_categories_bloc/list_all_categories_bloc.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/list_all_categories_bloc/list_all_categories_event.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/recent_ordered_products_bloc/recent_ordered_products_bloc.dart';
import 'home/feature/home/screens/location_screen.dart';
import 'new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
import 'new_cart_module/presentation/blocs/new_cart_bloc/new_cart_event.dart';
import 'user_module/domain/entity/authentication.dart';
import 'user_module/domain/user_data.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

final globalSnackBarKey = GlobalKey<ScaffoldMessengerState>();

void showSnackBar(SnackBar snackBar) {
  globalSnackBarKey.currentState?.showSnackBar(snackBar);
}

void showToast(String message) {
  showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor:
          Theme.of(globalNavigatorKey.currentContext!).colorScheme.primary,
    ),
  );
}

void showSuccessToast(String message) {
  showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.greenAccent,
    ),
  );
}

void showErrorToast(String message) {
  showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor:
          Theme.of(globalNavigatorKey.currentContext!).colorScheme.error,
    ),
  );
}

void showBottomSheetPopup({required WidgetBuilder builder}) {
  showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: true,
    context: globalNavigatorKey.currentContext!,
    backgroundColor: Colors.transparent,
    barrierColor: AppColorScheme.barrierColor.withOpacity(0.9),
    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.only(
    //     topLeft: Radius.circular(20),
    //     topRight: Radius.circular(20),
    //   ),
    // ),

    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: builder(context),
      );
    },
  );
}

void globalNavigateToWelcomeScreen() {
  globalClearUserData();

  globalNavigatorKey.currentState?.pushAndRemoveUntil(
    MaterialPageRoute(builder: (_) => const SignInPage()
    //IntroScreen()
    ),
    (route) => false,
  );
}

void globalNavigateToHomeScreen() {
  Widget nextScreen = const SignInPage();
  // IntroScreen();

  if (authentication.isAuthenticated) {
    globalReloadCommonData();
    globalReloadUserData();
    nextScreen = const LocationScreen();
  }

  globalNavigatorKey.currentState?.pushAndRemoveUntil(
    MaterialPageRoute(builder: (_) => nextScreen),
    (route) => false,
  );
}

void globalReloadCommonData() {
  if (globalNavigatorKey.currentContext == null) return;

  BlocProvider.of<ListAllCategoriesBloc>(globalNavigatorKey.currentContext!)
      .add(
    ListAllCategories(
     pincode: userData.pinCode
      ),
  );

  BlocProvider.of<ListFeaturedProductsBloc>(globalNavigatorKey.currentContext!)
      .add(
    FetchFeaturedProducts(pincode: userData.pinCode),
  );

  if (!authentication.isAuthenticated) return;

  //can add extra common blocs here
}

void globalReloadUserData() {
  if (globalNavigatorKey.currentContext == null ||
      !authentication.isAuthenticated) {
    return;
  }

  BlocProvider.of<NewCartBloc>(globalNavigatorKey.currentContext!).add(
    FetchCartItems(pincode: userData.pinCode),
  );

  BlocProvider.of<RecentOrderedProductsBloc>(globalNavigatorKey.currentContext!)
      .add(
    FetchRecentOrderedProducts(),
  );

  BlocProvider.of<AppDataBloc>(globalNavigatorKey.currentContext!)
      .add(FetchAppData());
}

void globalClearUserData() {
  if (globalNavigatorKey.currentContext == null) return;
}
