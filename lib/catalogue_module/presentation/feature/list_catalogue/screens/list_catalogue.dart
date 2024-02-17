import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../home/feature/home/screens/search_screen.dart';
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
import '../../../../../base_module/presentation/feature/demo/screen/on_boarding_screen.dart';
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
            fontFamily: 'Poppins',
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
          _mainContent(),
          // if (!_disable) _locationContent(),
          // if (!_disable) _shippingContent(),
          // !_disable && _cartList.isNotEmpty == true
          //     ? SizedBox()
          //     : SizedBox(height: 10)
        ],
      ),

//       child :Scaffold(
// bottomNavigationBar: MyBottomNavigationBar(),      )
    );
  }

  Widget _searchBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Color(0xFFF7EDFF)
          //Colors.grey.shade100,
          //border: Border.all(color: Colors.grey.shade200),
          ),
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
                      //activeCategories[index].subCategories ?? [],
                      // selectedSubCategoryId:null
                      // activeCategories[index].subCategories?.first.id,
                    ),
                    //      SearchPage(
                    //   isSearchEnabled: true,
                    //   subCategoryList: allSubcategoryList,
                    // ),
                    // SearchScreen(
                    //     isSearchEnabled: true,
                    //     subCategoryList: allSubcategoryList),
                  ));
              // showSearch(
              //   context: context,
              //   delegate:
              // // SearchScreen(),
              //   ProductSearchScreen(),
              // );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.search_outlined,
                  color: Color.fromARGB(255, 102, 100, 102),
                ),
                SizedBox(width: 10.0),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Color(0xFFAEAAAE)),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    onTap: () {
                      // showSearch(
                      //   context: context,
                      //   delegate: ProductSearchScreen(),
                      // );
                    },
                    animatedTexts: [
                      RotateAnimatedText(
                        translation.of('search_bar.search_curd'),
                       // 'Search "curd"',
                        duration: Duration(seconds: 4),
                        transitionHeight: 40,
                      ),
                      RotateAnimatedText(
                       translation.of('search_bar.search_rice'),

                       // 'Search "rice"',
                        duration: Duration(seconds: 4),
                        transitionHeight: 40,
                      ),
                      RotateAnimatedText(
                        translation.of('search_bar.search_chips'),
                       // 'Search "chips"',
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
      // color: Colors.yellow,
      child: BlocBuilder<ListFeaturedProductsBloc, ListFeaturedProductsState>(
        builder: (context, state) {
          if (state is FeaturedProductsLoaded &&
              state.featuredProducts.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          translation.of('catalogue.top_seller'),
                          //"Top Sellers",
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
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 251,
                    // color: Colors.red,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.featuredProducts.length,
                      itemBuilder: (context, index) {
                        final product = state.featuredProducts[index];
                        int itemQuantity = 1;
                        bool isInCart = false;
                        final isInStock =
                            product.variants?.firstOrNull?.status ==
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
                  SizedBox(height: 8),
                ],
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }

  Widget _categoriesSection() {
    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 10.0,
      ),
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

                      // "Categories",
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
                // SizedBox(height: 8),
                SizedBox(
                  height: 140,
                  //150
                  width: double.infinity,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: activeCategories.length,

                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 4,
                    //   mainAxisExtent: 122,
                    //   mainAxisSpacing: 4.0,
                    //   crossAxisSpacing: 8.0,
                    // ),
                    // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    //   maxCrossAxisExtent: 90,
                    //   mainAxisSpacing: 8.0,
                    //   crossAxisSpacing: 8.0,
                    //   childAspectRatio: 0.7,
                    //
                    // ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchPage(
                                  isSearchEnabled: true,
                                  subCategoryList:
                                      // allSubcategoryList,
                                      //     activeCategories[index].subCategories ?? [],
                                      // selectedSubCategoryId: activeCategories[index]
                                      //     .subCategories
                                      //     ?.first
                                      //     .id,
                                      activeCategories[index].subCategories ??
                                          [],
                                  selectedSubCategoryId:
                                      // activeCategories[index].subCategories !=
                                      //             null &&
                                      //         activeCategories[index]
                                      //             .subCategories!
                                      //             .isNotEmpty
                                      //     ? activeCategories[index]
                                      //         .subCategories!
                                      //         .first
                                      //         .id
                                      //     : null,
                                      activeCategories[index]
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
                            width: 72,
                            // color: Colors.red,
                            child: Column(
                              children: [
                                Container(
                                  height: 69.41,
                                  width: 69.41,

                                  // padding: EdgeInsets.all(10.0),
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
                                    imageAsset:
                                        ThemeAssets.dummy_image_catogery,
                                    opacity: 0.5,
                                    placeHolderFit: BoxFit.contain,
                                    placeHolderPadding: EdgeInsets.all(8),
                                  ),
                                ),
                                Container(
                                  // width: 80,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: Text(
                                          translation.isArabic
                                        ? activeCategories[index].nameAr??activeCategories[index].nameEn!
                                        : translation.isFrench
                                        ? activeCategories[index].nameFr??activeCategories[index].nameEn!
                                        : activeCategories[index].nameEn!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // SizedBox(height: 4)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // SizedBox(height: 8),
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
      // color: Colors.yellow,
      child: BlocBuilder<ListFeaturedProductsBloc, ListFeaturedProductsState>(
        builder: (context, state) {
          if (state is FeaturedProductsLoaded &&
              state.featuredProducts.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          translation.of('catalogue.seasonal_pulses'),

                          //"Seasonal Pulses",
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
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 251,
                    // color: Colors.red,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.featuredProducts.length,
                      itemBuilder: (context, index) {
                        final product = state.featuredProducts[index];
                        int itemQuantity = 1;
                        bool isInCart = false;
                        final isInStock =
                            product.variants?.firstOrNull?.status ==
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
                  SizedBox(height: 8),
                ],
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }

  Widget _softDrinksSection() {
    return Container(
      // color: Colors.yellow,
      child: BlocBuilder<ListFeaturedProductsBloc, ListFeaturedProductsState>(
        builder: (context, state) {
          if (state is FeaturedProductsLoaded &&
              state.featuredProducts.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                      translation.of('catalogue.soft_drinks'),

                          //"Soft Drinks",
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
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 251,
                    // color: Colors.red,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.featuredProducts.length,
                      itemBuilder: (context, index) {
                        final product = state.featuredProducts[index];
                        int itemQuantity = 1;
                        bool isInCart = false;
                        final isInStock =
                            product.variants?.firstOrNull?.status ==
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
                  SizedBox(height: 8),
                ],
              ),
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
    // return BlocListener<NewCartBloc, NewCartState>(
    //   listener: (context, state) {
    //     if (state is CartLoaded) {
    //       setState(() {
    //         _cartList = state.cartList ?? [];
    //       });
    //     }
    //   },
    // child:
    return Scaffold(
      backgroundColor: Color(0xFFFEF7FF),
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,

      // drawer: _drawerContent(),
      //  bottomNavigationBar:
      //    !_disable ? MyBottomNavigationBar():null,
      //  CartBottomBar(cartList: _cartList) : null,
      // bottomNavigationBar: MyBottomNavigationBar(showBottomNavigationBar: true),

      body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: SafeArea(
            child: Column(
              children: [
                // SizedBox(
                //   height: 30,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: _searchBox()),
                    _notificationContent()
                  ],
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        //     child: Image.asset(
                        //       ThemeAssets.locationIconsaxSvg,
                        //       fit: BoxFit.fill,
                        //       width: 14,
                        //       height: 14,
                        //     ),
                        //                    SvgPicture.asset(
                        //   ThemeAssets.locationIconsaxSvg,
                        //   fit: BoxFit.fill,
                        //   width: 14,
                        //   height: 14,
                        // ),

                        child: _addressCard()),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          HomeBannerCarousel(),

                          _categoriesSection(),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          _topSellersSection(),
                          _seasonalPulsesSection(),
                          _showBanner(),
                          _softDrinksSection(),
                          // _externalMediaSection(),
                          // SizedBox(height: 10),
                          // _cartList.isNotEmpty == true ? SizedBox(height: 120) : SizedBox()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )

          //  CustomScrollView(
          //   physics: AlwaysScrollableScrollPhysics(),
          //   slivers: [
          //     SliverAppBar(
          //       // backgroundColor: Theme.of(context).colorScheme.onTertiary,
          //       elevation: 0,
          //       leading: IconButton(
          //         onPressed: () {
          //           setState(() {
          //             _disable = true;
          //           });
          //           _scaffoldKey.currentState!.openDrawer();
          //         },
          //         icon: Icon(
          //           Icons.menu,
          //           color: AppColorScheme.onBackgroundLight,
          //           size: 30,
          //         ),
          //       ),
          //       pinned: true,
          //       centerTitle: false,
          //       expandedHeight: 250.0,
          //       // actions: [
          //       //   if (!_disable) _shippingContent(),
          //       // ],
          //       bottom: PreferredSize(
          //         preferredSize: Size.fromHeight(48),
          //         child: _searchBox(),
          //       ),
          //       flexibleSpace: FlexibleSpaceBar(
          //         stretchModes: [StretchMode.zoomBackground],
          //         background: Image(
          //           image: AssetImage(ThemeAssets.appLatestIcon),
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     ),
          //     SliverList(
          //       delegate: SliverChildBuilderDelegate(
          //         (BuildContext context, int index) {
          //           return Padding(
          //               padding: EdgeInsets.only(
          //                   left: 5, bottom: 20, right: 10, top: 10),
          //               child: Column(
          //                 children: [
          //                   _categoriesSection(),
          //                   HomeBannerCarousel(),
          //                   SizedBox(height: 10,),
          //                   _orderAgainSection(),
          //                   _bestSellersSection(),
          //                   // _externalMediaSection(),
          //                   // SizedBox(height: 10),
          //                   // _cartList.isNotEmpty == true ? SizedBox(height: 120) : SizedBox()
          //                 ],
          //               ));
          //         },
          //         childCount: 1,
          //       ),
          //     ),
          //   ],
          // ),
          ),
      // body: RefreshIndicator(
      //   onRefresh: _onRefresh,
      //   child: ListView(
      //     shrinkWrap: true,
      //     children: [
      //       // _searchBox(),
      //       _categoriesSection(),
      //       HomeBannerCarousel(),
      //       _orderAgainSection(),
      //       _bestSellersSection(),
      //       // _externalMediaSection(),
      //       SizedBox(height: 20),
      //       // _cartList.isNotEmpty == true ? SizedBox(height: 120) : SizedBox()
      //     ],
      //   ),
      // ),
    );
    // );
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
            "Profile",
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
                  "My account",
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
                    title: Text("Home", style: _drawerTitleStyle),
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
                    title: Text("Address", style: _drawerTitleStyle),
                  ),
                ),
                // SizedBox(height: 10),
                // Container(
                //   decoration: BoxDecoration(
                //     // color: Colors.grey.shade300,
                //     borderRadius: BorderRadius.circular(11.0),
                //   ),
                //   child: ListTile(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(11.0),
                //     ),
                //     leading: SvgPicture.asset(
                //       ThemeAssets.wallet_icon,
                //     ),
                //     title: Text("Wallet", style: _drawerTitleStyle),
                //   ),
                // ),
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
                    title: Text("My orders", style: _drawerTitleStyle),
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
        color: Color(0xFFF7EDFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: badges.Badge(
        stackFit: StackFit.loose,
        position: badges.BadgePosition.topEnd(top: 9, end: 3),
        badgeContent: Container(
          width: 0.1,
          height: 0.1,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
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

      //Icon(Iconsax.notification),
    );
  }

  Widget _showBanner() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 38),
        width: 369,
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
                  borderRadius: BorderRadius.circular(11.0),
                  color: Colors.grey.shade300,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11.0),
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
                  "Logout",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                content: Text(
                  "Are you sure to logout?",
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

                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (_) => ManageAddressScreen(),
                // ));
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
                // width: 20,
                // height: 20,
                // fit: BoxFit.cover,
              ),
              SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  // RichText(
                  //   text: TextSpan(
                  //     // Define your text spans here
                  //     children: <TextSpan>[
                  //       TextSpan(
                  //         text: "Home",
                  //         style:
                  //             Theme.of(context).textTheme.caption?.copyWith(
                  //                   fontWeight: FontWeight.w700,
                  //                   color: Theme.of(context)
                  //                       .colorScheme
                  //                       .onBackground,
                  //                 ),
                  //       ),
                  //       if (addressItem?.isDefault == true)
                  //         TextSpan(
                  //           text: "    You are here",
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .caption
                  //               ?.copyWith(
                  //                 fontWeight: FontWeight.w500,
                  //                 fontSize: 8,
                  //                 color: Theme.of(context)
                  //                     .colorScheme
                  //                     .onTertiaryContainer,
                  //               ),
                  //         ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  Text(
                    "${capitalize(StringModifiers.enumToString(addressItem?.type)?.replaceAll("_", " "))}",

                    // "${ StringModifiers.enumToString(addressItem?.type)?.replaceAll("_", " ").toLowerCase()}",
                    style: TextStyle(
                      color: Color(0xFF1D1B1E),
                      fontSize: 12,
                      fontFamily: 'Poppins',
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
                        fontFamily: 'Poppins',
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     showBottomSheetPopup(
              //       builder: (context) {
              //         return ManageAddressBottomSheet();
              //       },
              //     );

              //     // Navigator.of(context).push(MaterialPageRoute(
              //     //   builder: (_) => ManageAddressScreen(),
              //     // ));
              //   },
              // child: Container(
              //   width: 56.72,
              //   height: 19.01,
              //   // padding: const EdgeInsets.symmetric(
              //   //     horizontal: 8.36, vertical: 2.51),
              //   decoration: ShapeDecoration(
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(
              //           width: 0.42, color: Color(0xFFCBC4CF)),
              //       borderRadius: BorderRadius.circular(8.36),
              //     ),
              //   ),
              //   child: Center(
              //     child: Text(
              //       "Change",
              //       style: Theme.of(context)
              //           .textTheme
              //           .caption
              //           ?.copyWith(
              //             fontSize: 9.19,
              //             fontFamily: 'Poppins',
              //             fontWeight: FontWeight.w500,
              //             color: AppColorScheme.primaryColor,
              //           ),
              //     ),
              //   ),
              // ),
              // ),
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
