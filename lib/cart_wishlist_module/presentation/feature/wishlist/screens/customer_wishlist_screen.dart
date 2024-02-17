import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/appbar/custom_appbar.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../catalogue_module/presentation/core/values/catalogue_router.dart';
import '../../../../../user_module/domain/user_data.dart';
import '../../../../domain/models/wish_list.dart';
import '../../../components/wishlist_card.dart';
import '../../cart/blocs/cart_bloc/cart_bloc.dart';
import '../../cart/blocs/cart_bloc/cart_state.dart';
import '../blocs/customer_wishlist_bloc/customer_wishlist_bloc.dart';

class CustomerWishlistScreen extends StatefulWidget {
  const CustomerWishlistScreen({Key? key}) : super(key: key);

  @override
  State<CustomerWishlistScreen> createState() => _CustomerWishlistScreenState();
}

class _CustomerWishlistScreenState extends State<CustomerWishlistScreen> {

  @override
  void initState() {
    BlocProvider.of<CustomerWishlistBloc>(context)
        .add(CustomerWishListFetchEvent(
        reFetch: true,
        lat: userData.lat,
        lng:  userData.lng
    ));
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppbar(
        context: context,
        isHome: false,
        isTitleText: true,
        titleText: translation.of("cart.wishlist"),
      ),
      body: RefreshIndicator(
        onRefresh: () async => BlocProvider.of<CustomerWishlistBloc>(context)
            .add(CustomerWishListFetchEvent(
            reFetch: true,
       lat: userData.lat,
          lng:  userData.lng
        )),
        child: ListView(
          shrinkWrap: true,
          children: [
            const AppPadding(
              dividedBy: 2,
            ),
            BlocBuilder<CustomerWishlistBloc, CustomerWishlistState>(
              builder: (context, state) {
                if (state is CustomerWishlistMutationSuccessState) {
                  return _gridWidget(list: state.wishList);
                }
                if (state is CustomerWishlistFetchSuccessState) {
                  return _gridWidget(list: state.wishList);
                } else if (state is CustomerWishlistLoadingState) {
                  // return _gridWidget(list: state.wishList);
                  return Container(
                    height: 300,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is CustomerWishlistFailedState) {
                  return SizedBox(
                    height: 300,
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          BlocProvider.of<CustomerWishlistBloc>(context)
                              .add(CustomerWishListFetchEvent(
                              // pinCode: userData.pinCode,
                              reFetch: true,
                              lng: userData.lng ,
                              lat:  userData.lat));
                        },
                        child: Container(
                            height: 60,
                            width: 100,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Refresh"),
                                SizedBox(width: 5,),
                                Icon(MdiIcons.refresh)
                              ],
                            )),
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 300,
                    child: Center(
                      child: Text(translation.of("cart.wishlist_empty")),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
      // bottomNavigationBar:
      //     BlocProvider.of<CustomerWishlistBloc>(context).wishList.isEmpty
      //         ? null
      //         : Container(
      //             color: Colors.transparent,
      //             padding: const EdgeInsets.all(8.0),
      //             child: ElevatedButton(
      //                 onPressed: () => {},
      //                 child: Text(
      //                   "Add all items to Cart".toUpperCase(),
      //                   style: Theme.of(context).textTheme.button?.copyWith(
      //                       color: Theme.of(context).colorScheme.onPrimary),
      //                 )),
      //           ),
    );
  }

  AnimationLimiter _gridWidget({
    required List<WishList> list,
  }) {
    return AnimationLimiter(

      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding / 4),
        child: list.isNotEmpty
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, CatalogueRouter.detailScreen,
                      //     arguments: list[index].productId);
                      // pushNewScreenWithRouteSettings(context,
                      //     settings: RouteSettings(
                      //         name: CatalogueRouter.detailScreen,
                      //         arguments: list[index]),
                      //     screen: DetailsScreen(
                      //       product: list[index].product,
                      //     ));
                      Navigator.of(context).pushNamed(
                          CatalogueRouter.detailScreen,
                          arguments: list[index].product);
                    },
                    child: AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child:  SlideAnimation(
                        verticalOffset: 30.0,
                        child: FadeInAnimation(
                          child: BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              if (state is ListLoaded) {
                                return WishlistCard(
                                  key: PageStorageKey("PRODUCTSLISTLOADED"),
                                  wishListItem: list[index],
                                );
                              }
                              return WishlistCard(
                                key: PageStorageKey("PRODUCTSLISTNOTLOADED"),
                                wishListItem: list[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                })
            : Container(
                height: 300,
                child: Center(
                  child: Text("Wishlist is empty"),
                ),
              ),
      ),

    );
  }

  // Padding _gridWidget({
  //   required List<WishList> list,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(
  //         horizontal: AppConstants.defaultPadding / 4),
  //     child: list.isNotEmpty
  //         ? GridView.builder(
  //             physics: NeverScrollableScrollPhysics(),
  //             shrinkWrap: true,
  //             itemCount: list.length,
  //             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
  //                 maxCrossAxisExtent: 240,
  //                 // childAspectRatio: _height>=_width?_width / (_height*_aspectRatio*1.2):_height / (_width/_aspectRatio*1.2 ),//
  //                 childAspectRatio: 0.6,
  //                 crossAxisSpacing: 5),
  //             itemBuilder: (context, index) {
  //               return InkWell(
  //                 onTap: () {
  //                   // Navigator.pushNamed(context, CatalogueRouter.detailScreen,
  //                   //     arguments: list[index].productId);
  //                   pushNewScreenWithRouteSettings(context,
  //                       settings: RouteSettings(
  //                           name: CatalogueRouter.detailScreen,
  //                           arguments: list[index]),
  //                       screen: DetailsScreen(
  //                         product: list[index].product,
  //                       ));
  //                 },
  //                 child: BlocBuilder<CartBloc, CartState>(
  //                   builder: (context, state) {
  //                     if (state is ListLoaded) {
  //                       return ProductCard(
  //                         key: PageStorageKey("PRODUCTSLISTLOADED"),
  //                         product: list[index].product ?? Product(),
  //                         wishlistVariant: list[index].variant,
  //                       );
  //                     }
  //                     return ProductCard(
  //                       key: PageStorageKey("PRODUCTSLISTNOTLOADED"),
  //                       product: list[index].product ?? Product(),
  //                       wishlistVariant: list[index].variant,
  //                     );
  //                   },
  //                 ),
  //               );
  //             })
  //         : Center(
  //             child: Container(height: 300, child: Text("Wishlist is empty")),
  //           ),
  //   );
  // }

}
