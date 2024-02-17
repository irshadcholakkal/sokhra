import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lumiereorganics_app/base_module/presentation/feature/demo/screen/on_boarding_screen.dart';
import 'package:lumiereorganics_app/catalogue_module/presentation/feature/list_catalogue/blocs/get_deliver_shift_by_zone_bloc/get_delivery_shift_by_zone_bloc.dart';
import 'app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import 'app_settings_module/presentation/feature/app_settings/blocs/configurations/configurations_bloc.dart';
import 'base_module/domain/entity/app.dart';
import 'base_module/domain/entity/app_theme_singleton.dart';
import 'base_module/domain/entity/translation.dart';
import 'base_module/presentation/core/values/app_constants.dart';
import 'base_module/presentation/feature/demo/screen/blocs/sign_in_send_otp/sign_in_sent_otp_bloc.dart';
import 'base_module/presentation/feature/demo/screen/splash_screen.dart';
import 'base_module/presentation/feature/network/blocs/network_bloc.dart';
import 'base_module/presentation/feature/theming/bloc/theme_bloc.dart';
import 'base_module/presentation/feature/translation/bloc/translation_bloc.dart';
import 'base_module/presentation/util/permission_request.dart';
import 'base_module/presentation/util/simple_bloc_observer.dart';
import 'carousal_module/presentation/feature/carousal/blocs/carousal_bloc/carousal_bloc.dart';
import 'cart_wishlist_module/presentation/feature/cart/blocs/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_bloc.dart';
import 'cart_wishlist_module/presentation/feature/cart/blocs/variant_cubit/variant_cubit.dart';
import 'cart_wishlist_module/presentation/feature/shipping_details/blocs/address_selection_bloc/address_selection_bloc.dart';
import 'cart_wishlist_module/presentation/feature/wishlist/blocs/customer_wishlist_bloc/customer_wishlist_bloc.dart';
import 'catalogue_module/presentation/feature/details/blocs/delivery_check_cubit/delivery_check_cubit.dart';
import 'catalogue_module/presentation/feature/details/blocs/google_places_cubit/google_places_cubit.dart';
import 'catalogue_module/presentation/feature/details/blocs/loctaion_check_cubit/location_check_cubit.dart';
import 'catalogue_module/presentation/feature/details/blocs/product_count_cubit/product_count_cubit.dart';
import 'catalogue_module/presentation/feature/details/blocs/product_details_cubit/product_details_cubit.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/customer_favourites_bloc/customer_favourites_bloc.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/deals_bloc/deals_bloc.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/featured_bloc/featured_bloc.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/featured_products_bloc/featured_products_bloc.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/list_all_categories_bloc/list_all_categories_bloc.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/list_catalogue_bloc/list_catalogue_bloc.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/products_list_bloc/products_list_bloc.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/recent_ordered_products_bloc/recent_ordered_products_bloc.dart';
import 'catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_bloc.dart';
import 'custom_router.dart';
import 'driver_module/presentation/feature/demo/bloc/change_order_status_bloc/change_order_status_bloc.dart';
import 'driver_module/presentation/feature/demo/bloc/deliverd_delivery_by_delivery_boy/delivered_delivery_by_delivery_boy_bloc.dart';
import 'driver_module/presentation/feature/demo/bloc/pending_delivery_by_delivery_boy/pending_delivery_by_delivery_boy_bloc.dart';
import 'globals.dart';
import 'home/feature/home/blocs/search_bloc/search_bloc.dart';
import 'new_cart_module/presentation/blocs/new_add_to_cart_bloc/new_add_to_cart_bloc.dart';
import 'new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
import 'new_cart_module/presentation/blocs/new_update_cart_bloc/new_update_cart_bloc.dart';
import 'orders_module/presentation/feature/orders/blocs/order_bloc/order_bloc.dart';
import 'orders_module/presentation/feature/orders/blocs/repeat_order_bloc/repeat_order_bloc.dart';
import 'payment_module/presentation/feature/payment/blocs/payment_bloc/payment_bloc.dart';
import 'payment_module/presentation/feature/promocode/blocs/promo_code_bloc/promo_code_bloc.dart';
import 'payment_module/presentation/feature/wallet/blocs/refund_history_bloc/refund_history_bloc.dart';
import 'payment_module/presentation/feature/wallet/blocs/wallet_balance_bloc/wallet_balance_bloc.dart';
import 'payment_module/presentation/feature/wallet/blocs/wallet_bloc/wallet_bloc.dart';
import 'payment_module/presentation/feature/wallet/blocs/wallet_credit_history_bloc/wallet_credit_history_bloc.dart';
import 'payment_module/presentation/feature/wallet/blocs/wallet_debit_history_bloc/wallet_debit_history_bloc.dart';
import 'user_module/domain/entity/authentication.dart';
import 'user_module/domain/entity/models/role.dart';
import 'user_module/domain/user_data.dart';
import 'user_module/presentation/feature/authentication/blocs/authentication/authentication_bloc.dart';
import 'user_module/presentation/feature/choose_loction/bloc/manage_location/manage_location_bloc.dart';
import 'user_module/presentation/feature/notifications/blocs/notification_list/notification_list_bloc.dart';
import 'user_module/presentation/feature/profile/blocs/get_all_zone/get_all_available_zone_bloc.dart';
import 'user_module/presentation/feature/profile/blocs/profile/profile_bloc.dart';
import 'user_module/presentation/feature/sign_in/blocs/sign_in/sign_in_bloc.dart';
import 'user_module/presentation/feature/sign_out/blocs/sign_out_bloc/sign_out_bloc.dart';
import 'user_module/presentation/feature/sign_up/blocs/otp_verification_bloc/otp_verification_bloc.dart';
import 'user_module/presentation/feature/sign_up/blocs/send_otp_bloc/send_otp_bloc.dart';

final kGoogleApiKey = 'AIzaSyB8BFCKO8ehLV4_I6gNGQH7980Y896hVsk';

class CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = CustomHttpOverrides();

  Bloc.observer = SimpleBlocObserver();

  await initHiveForFlutter();
  await app.init();
  await appTheme.init();
  await translation.init();
  await authentication.init();
  await userData.init();
  await permissionRequest.init();
  // HttpOverrides.global = MyHttpOverrides();
  // ByteData data = await PlatformAssetBundle().load(
  //     'lib/base_module/presentation/core/assets/cert/lets-encrypt-r3.pem');
  // SecurityContext.defaultContext
  //     .setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(
    RestartWidget(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignOutBloc>(
            lazy: true,
            create: (_) => SignOutBloc(),
          ),
          // BlocProvider<FlutterFireBloc>(
          //   lazy: false,
          //   create: (_) => FlutterFireBloc()..add(InitializeFlutterFire()),
          // ),
          //  BlocProvider<CartListBloc>(
          //   lazy: false,
          //   create: (context) => CartListBloc()..add(FetchCartList()),
          // ),
          BlocProvider<SearchBloc>(
            lazy: false,
            create: (_) => SearchBloc(),
          ),
          BlocProvider<NetworkBloc>(
            lazy: false,
            create: (_) => NetworkBloc()..add(CheckNetwork()),
          ),
          BlocProvider<TranslationBloc>(
            lazy: false,
            create: (_) => TranslationBloc(),
          ),
          BlocProvider<ThemeBloc>(
            lazy: false,
            create: (_) => ThemeBloc(),
          ),
          BlocProvider<AuthenticationBloc>(
            lazy: false,
            create: (_) => AuthenticationBloc(),
          ),
          BlocProvider<CarousalBloc>(
            lazy: false,
            create: (_) => CarousalBloc(),
          ),
          BlocProvider<ProductsListBloc>(
            lazy: false,
            create: (_) => ProductsListBloc(),
          ),
          BlocProvider<ListCatalogueBloc>(
            lazy: false,
            create: (_) => ListCatalogueBloc(),
          ),
          BlocProvider<DeliveryCheckCubit>(create: (_) => DeliveryCheckCubit()),
          BlocProvider<FeaturedBloc>(
            lazy: false,
            create: (_) => FeaturedBloc(),
          ),
          // BlocProvider<ManageLocationBloc>(
          //   lazy: false,
          //   create: (_) => ManageLocationBloc(),
          // ),
          BlocProvider<AppDataBloc>(
            lazy: false,
            create: (_) => AppDataBloc(),
          ),
          BlocProvider<GooglePlacesCubit>(
            lazy: false,
            create: (_) => GooglePlacesCubit(),
          ),
          BlocProvider<NotificationListBloc>(
            lazy: authentication.role != Role.GUEST &&
                authentication.role != Role.CUSTOMER,
            create: (_) =>
                NotificationListBloc()
               // ..add(const FetchNotificationList()),
          ),

          BlocProvider<DealsBloc>(
            create: (_) => DealsBloc(),
          ),
          BlocProvider<CustomerFavouritesBloc>(
            create: (_) => CustomerFavouritesBloc(),
          ),
          BlocProvider<ProductDetailsCubit>(
            create: (_) => ProductDetailsCubit(),
          ),
          BlocProvider<ProfileBloc>(
            lazy: true,
            create: (_) => ProfileBloc(),
          ),
          BlocProvider<PromoCodeBloc>(
            lazy: true,
            create: (_) => PromoCodeBloc(),
          ),
          BlocProvider<PaymentBloc>(
            lazy: true,
            create: (_) => PaymentBloc(),
          ),
          BlocProvider<AddressSelectionBloc>(
            lazy: true,
            create: (_) => AddressSelectionBloc(),
          ),
          BlocProvider<OrderBloc>(
            lazy: true,
            create: (_) => OrderBloc(),
          ),
          BlocProvider<RepeatOrderBloc>(
            lazy: true,
            create: (_) => RepeatOrderBloc(),
          ),
          BlocProvider<WalletCreditHistoryBloc>(
            lazy: true,
            create: (_) => WalletCreditHistoryBloc(),
          ),
          BlocProvider<WalletDebitHistoryBloc>(
            lazy: true,
            create: (_) => WalletDebitHistoryBloc(),
          ),
          BlocProvider<WalletBalanceBloc>(
            lazy: true,
            create: (_) => WalletBalanceBloc(),
          ),
          BlocProvider<RefundHistoryBloc>(
            lazy: true,
            create: (_) => RefundHistoryBloc(),
          ),
          BlocProvider<WalletBloc>(
            lazy: true,
            create: (_) => WalletBloc(),
          ),
          BlocProvider<CartBloc>(
            lazy: true,
            create: (_) => CartBloc(),
          ),
          BlocProvider<AddToCartBloc>(
            lazy: true,
            create: (_) => AddToCartBloc(),
          ),
          BlocProvider<CustomerWishlistBloc>(
            lazy: true,
            create: (_) => CustomerWishlistBloc(),
          ),
          BlocProvider<ConfigurationsBloc>(
            lazy: true,
            create: (_) =>
                ConfigurationsBloc()
               // ..add(ConfigurationsFetchEvent()),
          ),
          BlocProvider<PendingDeliveryByDeliveryBoyBloc>(
            lazy: true,
            create: (_) => PendingDeliveryByDeliveryBoyBloc(),
          ),
          BlocProvider<DeliveredDeliveryByDeliveryBoyBloc>(
            lazy: true,
            create: (_) => DeliveredDeliveryByDeliveryBoyBloc(),
          ),
          BlocProvider<ChangeOrderStatusBloc>(
            lazy: true,
            create: (_) => ChangeOrderStatusBloc(),
          ),
          BlocProvider<VariantCubit>(
            create: (_) => VariantCubit(),
          ),
          BlocProvider<ProductCountCubit>(
            create: (_) => ProductCountCubit(),
          ),
          BlocProvider<LocationCheckCubit>(
            create: (_) => LocationCheckCubit(),
          ),
          BlocProvider<SignInBloc>(
            create: (_) => SignInBloc(),
          ),
          BlocProvider<ListAllCategoriesBloc>(
            create: (_) => ListAllCategoriesBloc(),
          ),
          BlocProvider<ManageLocationBloc>(
            create: (_) => ManageLocationBloc(),
          ),
          BlocProvider<SubcategoryItemsBloc>(
            create: (context) => SubcategoryItemsBloc(),
          ),
          BlocProvider<SignInSentOTPBloc>(
            create: (context) => SignInSentOTPBloc(),
          ),
          BlocProvider<NewCartBloc>(
            create: (context) => NewCartBloc(),
          ),
          BlocProvider<NewAddToCartBloc>(
            create: (context) => NewAddToCartBloc(),
          ),
          BlocProvider<NewUpdateCartBloc>(
            create: (context) => NewUpdateCartBloc(),
          ),
          BlocProvider<ListFeaturedProductsBloc>(
            create: (context) => ListFeaturedProductsBloc(),
          ),
          BlocProvider<RecentOrderedProductsBloc>(
            create: (context) => RecentOrderedProductsBloc(),
          ),

          BlocProvider<GetDeliveryShiftByZoneBloc>(
            create: (context) => GetDeliveryShiftByZoneBloc(),
          ),

          BlocProvider<SendOtpBloc>(
            create: (context) => SendOtpBloc(),
          ),
           BlocProvider<OtpVerificationBloc>(
            create: (context) => OtpVerificationBloc(),
          ),
           BlocProvider<GetAllZoneBloc>(
            create: (context) => GetAllZoneBloc(),
          ),
          // BlocProvider<TranslationBloc>(
          //   create: (context) => TranslationBloc(),
          // ),

          

          // BlocProvider<TsetBloc>(
          //   create: (_) => TsetBloc(),
          // ),
          // BlocProvider<GetCurrentLocationCubit>(
          //   create: (_) => GetCurrentLocationCubit(),
          // ),
          // BlocProvider<VendorBloc>(
          //   lazy: authentication.role != Role.VENDOR,
          //   create: (_) => VendorBloc()..add(const FetchVendor()),
          // ),
          // BlocProvider<CartBloc>(
          //   lazy: authentication.role != Role.GUEST &&
          //       authentication.role != Role.CUSTOMER,
          //   create: (_) => CartBloc()..add(const FetchCart()),
          // ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeBloc? _themeBloc;
  AppDataBloc? _appDataBloc;

  // VendorBloc? _vendorBloc;
  // CartBloc? _cartBloc;

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<LocationCheckCubit>(context).getLocation();
    WidgetsBinding.instance.window.onPlatformBrightnessChanged = () {
      if (appTheme.themeType == ThemeType.system) {
        _themeBloc ??= BlocProvider.of<ThemeBloc>(context);

        _themeBloc?.add(ChangeTheme(
          themeType: appTheme.themeType,
        ));
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("token is ${authentication.token}");
    debugPrint("userID is ${authentication.user?.id}");

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));

    return MultiBlocListener(
      listeners: [
        BlocListener<NetworkBloc, NetworkState>(
          listenWhen: (previousState, currentState) {
            return previousState == NetworkState.OFFLINE &&
                currentState == NetworkState.ONLINE;
          },
          listener: (context, state) {
            if (state == NetworkState.ONLINE) {
              globalReloadCommonData();
              globalReloadUserData();
            }
          },
        ),
        BlocListener<DeliveryCheckCubit, DeliveryCheckState>(
          listener: (context, state) {
            if (state is DeliveryCheckSuccess) {
              globalReloadCommonData();
              globalReloadUserData();
            }
          },
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, _) {
          return BlocBuilder<TranslationBloc, TranslationState>(
            builder: (context, _) {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    navigatorKey: globalNavigatorKey,
                    scaffoldMessengerKey: globalSnackBarKey,
                    title: AppConstants.appName,
                    theme: appTheme.themeData(context),
                    home: const SplashScreen(),
                    locale: translation.selectedLocale,
                    supportedLocales: translation.supportedLocales,
                    localizationsDelegates: const [
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      FormBuilderLocalizations.delegate,
                    ],
                    onGenerateRoute: customRouter.generateRoute,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
