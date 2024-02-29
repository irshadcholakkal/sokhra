import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../blocs/featured_products_bloc/featured_products_event.dart';
import '../blocs/get_all_banners_bloc/get_all_banners_state.dart';
import '../../../../../user_module/presentation/feature/notifications/screens/notifications_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../../app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import '../../../../../app_settings_module/presentation/feature/app_settings/blocs/configurations/configurations_bloc.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/images/custom_network_image.dart';
import '../../../../../base_module/presentation/component/indicator/loading_or_error_indicator.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../user_module/presentation/feature/demo/screen/on_boarding_screen.dart';
import '../../../../../base_module/presentation/feature/network/blocs/network_bloc.dart';
import '../../../../../base_module/presentation/util/exit_popup_helper.dart';
import '../../../../../base_module/presentation/util/string_modifiers.dart';
import '../../../../../globals.dart';
import '../../../../../home/components/home_product_card.dart';
import '../../../../../home/feature/home/screens/our_story_screen.dart';
import '../../../../../home/feature/home/screens/search_page.dart';
import '../../../../../new_cart_module/domain/new_cart_model.dart';
import '../../../../../orders_module/presentation/feature/orders/screens/orders_screen.dart';
import '../../../../../user_module/domain/entity/authentication.dart';
import '../../../../../user_module/domain/user_data.dart';
import '../../../../../user_module/presentation/components/manage_address_bottom_sheet.dart';
import '../../../../../user_module/presentation/feature/authentication/blocs/authentication/authentication_bloc.dart';
import '../../../../../user_module/presentation/feature/choose_loction/screen/manage_address_screen.dart';
import '../../../../domain/models/category_model.dart';
import '../../../../domain/models/product_status.dart';
import '../../../components/delete_dialog.dart';
import '../../details/blocs/delivery_check_cubit/delivery_check_cubit.dart';
import '../blocs/featured_products_bloc/featured_products_bloc.dart';
import '../blocs/featured_products_bloc/featured_products_state.dart';
import '../blocs/get_all_banners_bloc/get_all_banners_bloc.dart';
import '../blocs/get_all_banners_bloc/get_all_banners_event.dart';
import '../blocs/list_all_categories_bloc/list_all_categories_bloc.dart';
import '../blocs/list_all_categories_bloc/list_all_categories_event.dart';
import '../blocs/list_all_categories_bloc/list_all_categories_state.dart';
import '../widgets/home_banners_carousel.dart';

class ListCatalogue extends StatefulWidget {
  const ListCatalogue({Key? key}) : super(key: key);

  @override
  _ListCatalogueState createState() => _ListCatalogueState();
}

class _ListCatalogueState extends State<ListCatalogue> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _disable = false;
  List<Cart> _cartList = [];
  String? _addressId;

  late GetAllBannersBloc _getAllBannersBloc;

  TextStyle? get _drawerTitleStyle =>
      Theme.of(context).textTheme.subtitle1?.copyWith(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onBackground,
          );

  TextStyle? get _homeTitleStyle =>
      Theme.of(context).textTheme.subtitle1?.copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: AppConstants.defaultFont,
            fontSize: 16,
            color: Theme.of(context).colorScheme.onBackground,
          );

  @override
  void initState() {
    super.initState();

    BlocProvider.of<DeliveryCheckCubit>(context).checkPinCode(
      pincode: userData.pinCode,
      place: userData.place,
      lat: userData.lat,
      lng: userData.lng,
    );

    _getAllBannersBloc = GetAllBannersBloc();
    _getAllBannersBloc.add(FetchAllBanners());
    _getListAllCategories();
  }

  @override
  void dispose() {
    super.dispose();
    _getAllBannersBloc.close();
  }

  void _getListAllCategories() {
    // BlocProvider.of<GetDeliveryShiftByZoneBloc>(context)
    //     .add(GetDeliveryShiftByZoneFetchEvent(zone: "560016"));

    BlocProvider.of<ListAllCategoriesBloc>(context).add(
      ListAllCategories(pincode: userData.pinCode),
    );

    BlocProvider.of<ListFeaturedProductsBloc>(
            globalNavigatorKey.currentContext!)
        .add(
      FetchFeaturedProducts(
          // pincode: userData.pinCode,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Future.delayed(Duration(milliseconds: 150), () {
            setState(() {
              _disable = false;
            });
          });
          return true;
        } else {
          return ExitPopupHelper.showExitPopup(context);
        }
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _mainContent(),
          ),
        ],
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColorScheme.onTertiaryContainerLite),
      height: 36,
      width: 302,
      child: BlocBuilder<ListAllCategoriesBloc, ListAllCategoriesState>(
          builder: (context, state) {
        if (state is AllCategoriesLoaded && state.categories.isNotEmpty) {
          List<Category> activeCategories = [];
          List<SubCategory> subcategoryList = [];
          List<SubCategory> allSubcategoryList = [];

          state.categories.forEach((element) {
            if (element.active == true) {
              activeCategories.add(element);
            }
          });

          activeCategories.forEach((element) {
            if (element.subCategories != null) {
              if (element.subCategories!.isNotEmpty) {
                element.subCategories!.forEach((subCat) {
                  subcategoryList.add(subCat);
                });
              }
            }
          });

          if (state.categories.isNotEmpty) {
            for (int i = 0; i < state.categories.length; i++) {
              if (state.categories[i].subCategories?.isNotEmpty == true) {
                for (int j = 0;
                    j < state.categories[i].subCategories!.length;
                    j++) {
                  allSubcategoryList.add(state.categories[i].subCategories![j]);
                }
              }
            }
          }
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(
                      isSearchEnabled: true,
                      subCategoryList: allSubcategoryList,
                    ),
                  ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.search_outlined, color: AppColorScheme.barrierColor),
                SizedBox(width: AppConstants.defaultPadding * 0.5),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: AppConstants.defaultFont,
                        color: AppColorScheme.grey,
                        // Color(0xFFAEAAAE)
                      ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    onTap: () {},
                    animatedTexts: [
                      RotateAnimatedText(
                        translation.of('search_bar.search_curd'),
                        duration: Duration(seconds: 4),
                        transitionHeight: 40,
                      ),
                      RotateAnimatedText(
                        translation.of('search_bar.search_rice'),
                        duration: Duration(seconds: 4),
                        transitionHeight: 40,
                      ),
                      RotateAnimatedText(
                        translation.of('search_bar.search_chips'),
                        duration: Duration(seconds: 4),
                        transitionHeight: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox();
      }),
    );
  }

  Widget _topSellersSection() {
    return Container(
      child: BlocBuilder<ListFeaturedProductsBloc, ListFeaturedProductsState>(
        builder: (context, state) {
          if (state is FeaturedProductsLoaded &&
              state.featuredProducts.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      translation.of('catalogue.top_seller'),
                      style: _homeTitleStyle,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Iconsax.arrow_right_3,
                      size: 16,
                    )
                  ],
                ),
                SizedBox(height: AppConstants.defaultPadding * 0.4),
                Container(
                  height: 251,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.featuredProducts.length,
                    itemBuilder: (context, index) {
                      final product = state.featuredProducts[index];
                      int itemQuantity = 1;
                      bool isInCart = false;
                      final isInStock = product.variants?.firstOrNull?.status ==
                          ProductStatus.IN_STOCK.name;
                      final cartItem = _cartList.firstWhere(
                        (element) => element.product?.id == product.id,
                        orElse: () => Cart(),
                      );

                      if (cartItem.id != null) {
                        isInCart = true;
                        itemQuantity = cartItem.quantity ?? 1;
                      }

                      return HomeProductCard(
                        margin: EdgeInsetsDirectional.only(
                          start: 12,
                          end: state.featuredProducts.length - 1 == index
                              ? 12
                              : 0,
                        ),
                        product: product,
                        isInStock: isInStock,
                        isInCart: isInCart,
                        cartItem: cartItem,
                        itemQuantity: itemQuantity,
                      );
                    },
                  ),
                ),
                SizedBox(height: AppConstants.defaultPadding * 0.4),
              ],
            );
          }

          return SizedBox();
        },
      ),
    );
  }

  Widget _categoriesSection() {
    return Container(
      child: BlocBuilder<ListAllCategoriesBloc, ListAllCategoriesState>(
        builder: (context, state) {
          if (state is AllCategoriesLoaded && state.categories.isNotEmpty) {
            List<Category> activeCategories = [];
            List<SubCategory> subcategoryList = [];
            List<SubCategory> allSubcategoryList = [];

            state.categories.forEach((element) {
              if (element.active == true) {
                activeCategories.add(element);
              }
            });

            activeCategories.forEach((element) {
              if (element.subCategories != null) {
                if (element.isBigImage == true) {}

                if (element.subCategories!.isNotEmpty) {
                  element.subCategories!.forEach((subCat) {
                    subcategoryList.add(subCat);
                  });
                }
              }
            });

            if (state.categories.isNotEmpty) {
              for (int i = 0; i < state.categories.length; i++) {
                if (state.categories[i].subCategories?.isNotEmpty == true) {
                  for (int j = 0;
                      j < state.categories[i].subCategories!.length;
                      j++) {
                    allSubcategoryList
                        .add(state.categories[i].subCategories![j]);
                  }
                }
              }
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      translation.of('catalogue.categories'),
                      style: _homeTitleStyle,
                    ),
                    AppPadding(
                      multipliedBy: 0.5,
                    ),
                    Icon(
                      Iconsax.arrow_right_3,
                      size: 16,
                    )
                  ],
                ),
                AppPadding(
                  multipliedBy: 0.5,
                ),
                SizedBox(
                  height: 140,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: activeCategories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage(
                                isSearchEnabled: true,
                                subCategoryList:
                                    activeCategories[index].subCategories ?? [],
                                selectedSubCategoryId: activeCategories[index]
                                            .subCategories
                                            ?.isNotEmpty ==
                                        true
                                    ? activeCategories[index]
                                        .subCategories
                                        ?.first
                                        .id
                                    : "",
                                categoryId: activeCategories[index].id,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 75,
                          child: Column(
                            children: [
                              Container(
                                height: 69.41,
                                width: 69.41,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE5F3F4),
                                  borderRadius: BorderRadius.circular(
                                    AppConstants.cornerRadiuscircle,
                                  ),
                                  border: Border.all(
                                    color:
                                        AppColorScheme.productCardBorderColor,
                                  ),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: CustomNetworkImage(
                                  urlList: [
                                    StringModifiers.toUrl(
                                      activeCategories[index].avatar,
                                    ),
                                  ],
                                  borderRadius: AppConstants.cornerRadius,
                                  fit: BoxFit.contain,
                                  imageAsset: ThemeAssets.dummy_image_catogery,
                                  opacity: 0.5,
                                  placeHolderFit: BoxFit.contain,
                                  placeHolderPadding: EdgeInsets.all(8),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: Text(
                                  translation.isArabic
                                      ? activeCategories[index].nameAr ??
                                          activeCategories[index].nameEn!
                                      : translation.isFrench
                                          ? activeCategories[index].nameFr ??
                                              activeCategories[index].nameEn!
                                          : activeCategories[index].nameEn!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        fontFamily: AppConstants.defaultFont,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return LoadingOrErrorIndicator(
            padding: const EdgeInsets.only(
              top: AppConstants.defaultPadding * 2,
              bottom: AppConstants.defaultPadding,
            ),
            isLoading: state is! AllCategoriesLoadingFailed,
            onRetry: () {
              BlocProvider.of<ListAllCategoriesBloc>(context).add(
                ListAllCategories(pincode: userData.pinCode),
              );
            },
          );
        },
      ),
    );
  }

  Widget _seasonalPulsesSection() {
    return Container(
      child: BlocBuilder<ListFeaturedProductsBloc, ListFeaturedProductsState>(
        builder: (context, state) {
          if (state is FeaturedProductsLoaded &&
              state.featuredProducts.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      translation.of('catalogue.seasonal_pulses'),
                      style: _homeTitleStyle,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Iconsax.arrow_right_3,
                      size: 16,
                    )
                  ],
                ),
                SizedBox(height: AppConstants.defaultPadding * 0.4),
                Container(
                  height: 251,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.featuredProducts.length,
                    itemBuilder: (context, index) {
                      final product = state.featuredProducts[index];
                      int itemQuantity = 1;
                      bool isInCart = false;
                      final isInStock = product.variants?.firstOrNull?.status ==
                          ProductStatus.IN_STOCK.name;

                      final cartItem = _cartList.firstWhere(
                        (element) => element.product?.id == product.id,
                        orElse: () => Cart(),
                      );

                      if (cartItem.id != null) {
                        isInCart = true;
                        itemQuantity = cartItem.quantity ?? 1;
                      }

                      return HomeProductCard(
                        margin: EdgeInsetsDirectional.only(
                          start: 12,
                          end: state.featuredProducts.length - 1 == index
                              ? 12
                              : 0,
                        ),
                        product: product,
                        isInStock: isInStock,
                        isInCart: isInCart,
                        cartItem: cartItem,
                        itemQuantity: itemQuantity,
                      );
                    },
                  ),
                ),
                SizedBox(height: AppConstants.defaultPadding * 0.4),
              ],
            );
          }

          return SizedBox();
        },
      ),
    );
  }

  Widget _softDrinksSection() {
    return Container(
      child: BlocBuilder<ListFeaturedProductsBloc, ListFeaturedProductsState>(
        builder: (context, state) {
          if (state is FeaturedProductsLoaded &&
              state.featuredProducts.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      translation.of('catalogue.soft_drinks'),
                      style: _homeTitleStyle,
                    ),
                    SizedBox(
                      width: AppConstants.defaultPadding * 0.6,
                    ),
                    Icon(
                      Iconsax.arrow_right_3,
                      size: 16,
                    )
                  ],
                ),
                SizedBox(height: AppConstants.defaultPadding * 0.4),
                Container(
                  height: 251,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.featuredProducts.length,
                    itemBuilder: (context, index) {
                      final product = state.featuredProducts[index];
                      int itemQuantity = 1;
                      bool isInCart = false;
                      final isInStock = product.variants?.firstOrNull?.status ==
                          ProductStatus.IN_STOCK.name;

                      final cartItem = _cartList.firstWhere(
                        (element) => element.product?.id == product.id,
                        orElse: () => Cart(),
                      );

                      if (cartItem.id != null) {
                        isInCart = true;
                        itemQuantity = cartItem.quantity ?? 1;
                      }

                      return HomeProductCard(
                        margin: EdgeInsetsDirectional.only(
                          start: 12,
                          end: state.featuredProducts.length - 1 == index
                              ? 12
                              : 0,
                        ),
                        product: product,
                        isInStock: isInStock,
                        isInCart: isInCart,
                        cartItem: cartItem,
                        itemQuantity: itemQuantity,
                      );
                    },
                  ),
                ),
                SizedBox(height: AppConstants.defaultPadding * 0.4),
              ],
            );
          }

          return SizedBox();
        },
      ),
    );
  }

  Widget _externalMediaSection() {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        if (state == NetworkState.OFFLINE) {
          return SizedBox();
        }

        return SizedBox(
          height: 2000,
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse("https://360vishnu.wixsite.com/lumiereorganics"),
            ),
          ),
        );
      },
    );
  }

  Widget _mainContent() {
    return Scaffold(
      backgroundColor: AppColorScheme.scaffoldBackgroundColorLight,
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: _searchBox()),
                    _notificationContent()
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          HomeBannerCarousel(),
                          AppPadding(
                            multipliedBy: 1,
                          ),
                          _categoriesSection(),
                          // AppPadding(
                          //   multipliedBy: 1,
                          // ),
                          _topSellersSection(),
                          AppPadding(
                            multipliedBy: 1,
                          ),
                          _seasonalPulsesSection(),
                          AppPadding(
                            multipliedBy: 1,
                          ),
                          _showBanner(),
                          AppPadding(
                            multipliedBy: 1,
                          ),
                          _softDrinksSection(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget _drawerContent() {
    return GestureDetector(
      onHorizontalDragUpdate: (details) => null,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColorScheme.onBackgroundLight,
            ),
            onPressed: () {
              Future.delayed(Duration(milliseconds: 150), () {
                setState(() {
                  _disable = false;
                });
              });

              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            translation.of('catalogue.profile'),
            //  "Profile",
            style: TextStyle(
              color: AppColorScheme.onBackgroundLight,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            color: AppColorScheme.backgroundColorLight,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  translation.of('user.my_account'),
                  style: _drawerTitleStyle?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  authentication.user?.phone ?? "",
                  style: _drawerTitleStyle?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: _drawerTitleStyle?.color?.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  child: ListTile(
                    horizontalTitleGap: 0,
                    onTap: () {
                      Future.delayed(Duration(milliseconds: 150), () {
                        setState(() {
                          _disable = false;
                        });
                      });

                      Navigator.of(context).pop();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    leading: SvgPicture.asset(
                      ThemeAssets.home_icon,
                    ),
                    title: Text(translation.of('catalogue.home'),
                        style: _drawerTitleStyle),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  child: ListTile(
                    horizontalTitleGap: 0,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ManageAddressScreen(),
                      ));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    leading: SvgPicture.asset(
                      ThemeAssets.address_icon,
                    ),
                    title: Text(translation.of('catalogue.address'),
                        style: _drawerTitleStyle),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  child: ListTile(
                    horizontalTitleGap: 0,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => OrdersScreen(),
                      ));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    leading: SvgPicture.asset(
                      ThemeAssets.orders_icon,
                    ),
                    title: Text(translation.of('catalogue.my_orders'),
                        style: _drawerTitleStyle),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  child: ListTile(
                    horizontalTitleGap: 0,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => OurStoryScreen(),
                      ));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    leading: SvgPicture.asset(
                      ThemeAssets.story_icon,
                    ),
                    title: Text("Our story", style: _drawerTitleStyle),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  child: ListTile(
                    horizontalTitleGap: 0,
                    onTap: _onSignOut,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    leading: SvgPicture.asset(
                      ThemeAssets.logout_icon,
                    ),
                    title: Text("Logout", style: _drawerTitleStyle),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  child: ListTile(
                    horizontalTitleGap: 0,
                    onTap: _deleteAccountDialog,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    leading: Icon(Icons.delete_outlined,
                        color: Theme.of(context).colorScheme.onBackground),
                    // leading: SvgPicture.asset(
                    //   ThemeAssets.logout_icon,
                    // ),
                    title: Text("Delete account", style: _drawerTitleStyle),
                  ),
                ),
                SizedBox(height: 80),
                BlocBuilder<ConfigurationsBloc, ConfigurationsState>(
                  builder: (context, state) {
                    if (state is ConfigurationsFetchSuccessState) {
                      final whatsAppConfig =
                          state.data.settings?.firstOrNull?.whatsappSettings;
                      final whatsappNumber =
                          whatsAppConfig?.number?.trim() ?? "";
                      final whatsappMessage =
                          whatsAppConfig?.message?.trim() ?? "";

                      if (whatsappNumber.isNotEmpty) {
                        return InkWell(
                          onTap: () {
                            launchUrl(
                              Uri.parse(
                                "https://wa.me/$whatsappNumber?text=$whatsappMessage",
                              ),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 70.0),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  color: AppColorScheme.primaryColor,
                                ),
                                child: Center(
                                  child: SizedBox(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.whatsapp,
                                          color: AppColorScheme
                                              .backgroundColorLight,
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          "Whatsapp support",
                                          style: _drawerTitleStyle?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColorScheme
                                                .backgroundColorLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }

                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _locationContent() {
    final topPadding = MediaQuery.of(context).padding.top;

    return Positioned(
      top: topPadding,
      left: 50.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // showLocationsDialog(
            //   context,
            //   initialValue: userData.pinCode,
            // );

            showBottomSheetPopup(
              builder: (context) {
                return ManageAddressBottomSheet();
              },
            );

            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (_) => ManageAddressScreen(),
            // ));
          },
          child: BlocBuilder<DeliveryCheckCubit, DeliveryCheckState>(
            builder: (context, state) {
              return Container(
                // color: Colors.red,
                height: kToolbarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (userData.place.isNotEmpty)
                      Text(
                        userData.place,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 10,
                          color: AppColorScheme.secondaryColorLight,
                        ),
                        Text(
                          userData.pinCode.isEmpty
                              ? "Select location"
                              : userData.pinCode,
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                fontWeight: FontWeight.w500,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _shippingContent() {
    final topPadding = MediaQuery.of(context).padding.top;

    return Positioned(
      top: topPadding,
      right: 10.0,
      child: Material(
        color: Colors.transparent,
        child: BlocBuilder<DeliveryCheckCubit, DeliveryCheckState>(
          builder: (context, state) {
            if (state is DeliveryCheckSuccess) {
              final deliveryInfo = state.data;
              String deliveryMessage = "";

              if (deliveryInfo.hasSameDayDelivery == true) {
                deliveryMessage = "Delivery in\n 2 Hrs.";
              } else if (deliveryInfo.hasSameDayShipping == true) {
                deliveryMessage = "Same day\n shipping";
              }

              if (deliveryMessage.isNotEmpty) {
                return SizedBox(
                  height: kToolbarHeight,
                  child: Container(
                    // width: 101,
                    margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 3,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 12.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColorScheme.primaryColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppConstants.cornerRadius / 2),
                              color: AppColorScheme.deliveryCardBgColor),
                          child: CustomNetworkImage(
                            height: 19,
                            width: 19,
                            svgAsset: ThemeAssets.pedalBikeWhite,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              deliveryMessage,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColorScheme.onBackgroundDark,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            }

            return SizedBox();
          },
        ),
      ),
    );
  }

  Widget _notificationContent() {
    return Container(
      width: 34,
      height: 36,
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: ShapeDecoration(
        color: AppColorScheme.onTertiaryContainerLite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.cornerRadiusMin),
        ),
      ),
      child: badges.Badge(
        stackFit: StackFit.loose,
        position: badges.BadgePosition.topEnd(top: 9, end: 3),
        badgeContent: Container(
          width: 0.01,
          height: 0.01,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColorScheme.accentColorLight,
          ),
        ),
        child: Center(
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsScreen(),
                      ));
                },
                child: Icon(Iconsax.notification))),
      ),
    );
  }

  Widget _showBanner() {
    return Container(
        height: 276.75,
        decoration: BoxDecoration(),
        child: BlocBuilder(
          bloc: _getAllBannersBloc,
          builder: (context, state) {
            if (state is GetAllBannersLoaded) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppConstants.cornerRadiusMin),
                  color: Colors.grey.shade300,
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppConstants.cornerRadiusMin),
                  child: CachedNetworkImage(
                    alignment: Alignment.center,
                    imageUrl: AppConstants.filesUrl + state.banners![1].avatar!,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) {
                      return Image.asset(
                        ThemeAssets.dummy_image_wider,
                      );
                    },
                  ),
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ));
  }

  void _onSignOut() {
    bool isSubmitting = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState2) {
            return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is UnAuthenticated) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => OnBoardingScreen()
                          //SignInPage(),
                          ),
                      (route) => false);
                }
              },
              child: AlertDialog(
                insetPadding: const EdgeInsets.all(AppConstants.defaultPadding),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.cornerRadius),
                ),
                title: Text(
                  translation.of('catalogue.Logout'),
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                content: Text(
                  translation.of('catalogue.are_you_sure_to_logout'),
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                actionsAlignment: MainAxisAlignment.spaceAround,
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      if (isSubmitting) return;
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      translation.of('no').toUpperCase(),
                      style: Theme.of(context).textTheme.button?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                    style:
                        Theme.of(context).elevatedButtonTheme.style?.copyWith(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(horizontal: 45),
                              ),
                            ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (isSubmitting) return;

                      setState2(() {
                        isSubmitting = true;
                      });

                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(SignedOut());
                    },
                    child: isSubmitting
                        ? CupertinoActivityIndicator()
                        : Text(
                            translation.of("yes").toUpperCase(),
                            style: Theme.of(context).textTheme.button?.copyWith(
                                color: Theme.of(context).colorScheme.error),
                          ),
                    style:
                        Theme.of(context).outlinedButtonTheme.style?.copyWith(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(horizontal: 45),
                              ),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _deleteAccountDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return const DeleteAccountDialog();
      },
    );
  }

  Widget _addressCard() {
    return BlocBuilder<AppDataBloc, AppDataState>(
      builder: (context, state) {
        if (state is FetchAppDataSuccess) {
          final appData = state.appData;
          final addressData = state.appData.addressDetails;

          final addressItem = addressData?.firstWhereOrNull(
                (element) => element.isDefault == true,
              ) ??
              addressData?.firstOrNull;

          _addressId = addressItem?.id;

          if (_addressId == null) {
            return TextButton(
              onPressed: () {
                showBottomSheetPopup(
                  builder: (context) {
                    return ManageAddressBottomSheet();
                  },
                );
              },
              child: Text(
                "Add address",
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                      decoration: TextDecoration.underline,
                    ),
              ),
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                ThemeAssets.location,
              ),
              SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  Text(
                    "${capitalize(StringModifiers.enumToString(addressItem?.type)?.replaceAll("_", " "))}",

                    // "${ StringModifiers.enumToString(addressItem?.type)?.replaceAll("_", " ").toLowerCase()}",
                    style: TextStyle(
                      color: Color(0xFF1D1B1E),
                      fontSize: 12,
                      fontFamily: AppConstants.defaultFont,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              SizedBox(width: 5),
              SizedBox(
                width: 232,
                child: Text(
                  [
                    addressItem?.firstName ?? "",
                    addressItem?.house ?? "",
                    addressItem?.landmark ?? "",
                    addressItem?.pincode ?? ""
                  ].where((e) => e.isNotEmpty).join(", "),
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5),
                        fontSize: 10,
                        fontFamily: AppConstants.defaultFont,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          );
        }

        return authentication.token.isNotEmpty
            ? LoadingOrErrorIndicator(
                isLoading: state is! FetchAppDataFailed,
                error: state.errorMessage,
                //onRetry: _getAddress,
              )
            : SizedBox.shrink();
      },
    );
  }

  String capitalize(input) {
    return input?.isNotEmpty == true
        ? input[0].toUpperCase() + input.substring(1).toLowerCase()
        : '';
  }

  Future<void> _onRefresh() {
    return Future.delayed(Duration(milliseconds: 500), () {
      globalReloadCommonData();
      globalReloadUserData();
    });
  }
}
