import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../base_module/domain/entity/app.dart';
import '../../../base_module/domain/entity/translation.dart';
import '../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../cart_wishlist_module/presentation/feature/cart/blocs/add_to_cart_bloc/add_to_cart_bloc.dart';
import '../../../cart_wishlist_module/presentation/feature/cart/blocs/add_to_cart_bloc/add_to_cart_state.dart';
import '../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_bloc.dart';
import '../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_event.dart';
import '../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_state.dart';
import '../../../user_module/domain/user_data.dart';
import '../../domain/models/product.dart';
import '../core/values/catalogue_router.dart';
import '../feature/list_catalogue/blocs/deals_bloc/deals_bloc.dart';
import 'product_card.dart';

class DealsWidget extends StatelessWidget {
  const DealsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToCartBloc, AddToCartState>(
      listener: (context, addToCartState) {
        if (addToCartState is AddToCartSuccess) {

          BlocProvider.of<CartBloc>(context).add(CartFetchEvent(
            deviceId: app.deviceId!,
            lng: userData.lng,
            lat: userData.lat
          ));
        }
      },
      child: BlocListener<CartBloc, CartState>(
        listener: (context, cartState) {
          if (cartState is UpdateCartSuccess ||
              cartState is DeleteCartSuccess) {

            BlocProvider.of<CartBloc>(context).add(CartFetchEvent(
              deviceId: app.deviceId!,
              lat: userData.lat,
              lng: userData.lng
            ));
          }
        },
        child: BlocBuilder<DealsBloc, DealsState>(
          builder: (context, dealsState) {
            if (dealsState is DealsFetchSuccess) {
              List<Product> list = dealsState.productList.products;
              if (list.isNotEmpty) {
                return ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        translation.of("catalogue.deals_of_the_day"),
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    const AppPadding(
                      dividedBy: 2,
                    ),



                    AnimationLimiter(
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          itemCount: list.length,
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              // maxCrossAxisExtent: 260,
                              // mainAxisExtent: 290,
                            maxCrossAxisExtent: 240,
                              mainAxisExtent: 290,

                              // childAspectRatio: _height>=_width?_width / (_height*_aspectRatio*1.2):_height / (_width/_aspectRatio*1.2 ),//
                              // childAspectRatio: 0.6,
                              crossAxisSpacing: 5,
                          mainAxisSpacing: 8
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              columnCount: 2, // Same as the crossAxisCount above
                              duration: const Duration(milliseconds: 500),
                              child:  SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.pushNamed(context, CatalogueRouter.detailScreen,
                                      //     arguments: list[index].productId);
                                      // pushNewScreenWithRouteSettings(context,
                                      //     settings: RouteSettings(
                                      //       name: CatalogueRouter.detailScreen,
                                      //       arguments: list[index],
                                      //     ),
                                      //     screen: DetailsScreen(
                                      //       product: list[index],
                                      //     ));
                                      Navigator.pushNamed(
                                          context, CatalogueRouter.detailScreen,
                                          arguments: list[index]);
                                    },
                                    child: BlocBuilder<CartBloc, CartState>(
                                      builder: (context, state) {
                                        if (state is ListLoaded) {
                                          return
                                            // FittedBox(
                                            //   fit: BoxFit.fill,
                                            // child: SizedBox(
                                            //   width: 200,
                                            //   height: 280,

                                              // child:
                                        ProductCard(
                                                width: 240,
                                                key: PageStorageKey("PRODUCTSLISTLOADED"),
                                                product: list[index],
                                            //   ),
                                            // ),
                                          );
                                        }
                                        return
                                          // FittedBox(
                                          // fit: BoxFit.fill,
                                          // child: SizedBox(
                                          //   width: 200,
                                          //   height: 280,
                                          //   child:
                                        ProductCard(
                                              width: 240,
                                              key: PageStorageKey("PRODUCTSLISTNOTLOADED"),
                                              product: list[index],
                                            // ),
                                          // ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  
                  
                  
                  ],
                );
              } else {
                return Container();
              }
            } else if (dealsState is DealsFetchFailed) {
              return
                InkWell(
                  onTap: (){
                    BlocProvider.of<DealsBloc>(context)
                        .add(DealsFetchEvent(
                        // pincode: userData.pinCode,
                        reFetch: true,
                        lat: userData.lat,
                        lng: userData.lng));
                  },
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Click to refresh",  style: Theme.of(context).textTheme.headline6,),
                        SizedBox(width: 10,),
                        Icon(Icons.refresh_sharp)
                      ],

                    ),
                  ),
                );

              //   Container(
              //   child: Center(
              //     child: Text(
              //       "${dealsState.error}",
              //       style: Theme.of(context).textTheme.headline6,
              //     ),
              //   ),
              // );
            } else if (dealsState is DealsFetchLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text(
                  translation.of("unexpected_error_occurred"),
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
