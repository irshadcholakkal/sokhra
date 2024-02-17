import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base_module/domain/entity/translation.dart';
import '../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_bloc.dart';
import '../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_state.dart';
import '../../../user_module/domain/user_data.dart';
import '../../domain/models/product.dart';
import '../core/values/catalogue_router.dart';
import '../feature/list_catalogue/blocs/customer_favourites_bloc/customer_favourites_bloc.dart';
import 'product_card.dart';

class CustomerFavouritesWidget extends StatelessWidget {
  const CustomerFavouritesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerFavouritesBloc, CustomerFavouritesState>(
      builder: (context, favState) {
        if (favState is CustomerFavouritesFetchSuccess) {
          List<Product> list = favState.productList.products;
          // debugPrint("list from deals widget $list");
          if (list.isNotEmpty) {
            return ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    translation.of(
                      "catalogue.customer_favourites",
                    ),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                const AppPadding(
                  dividedBy: 2,
                ),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        // maxCrossAxisExtent: 240,
                        // childAspectRatio: _height>=_width?_width / (_height*_aspectRatio*1.2):_height / (_width/_aspectRatio*1.2 ),//
                        // childAspectRatio: 0.6,
                        // mainAxisExtent: 290,
                        maxCrossAxisExtent: 240,
                        mainAxisExtent: 290,
                        crossAxisSpacing: 5,
                    mainAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, CatalogueRouter.detailScreen,
                              arguments: list[index].productId);
                        },
                        child: BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            if (state is ListLoaded) {
                              return
                                // FittedBox(
                                // fit: BoxFit.fill,
                                // child: SizedBox(
                                //   width: 200,
                                //   height: 280,
                                //   child:
                                  ProductCard(
                                    width: 240,
                                    key: PageStorageKey("PRODUCTSLISTLOADED"),
                                    product: list[index],
                                  // ),
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
                      );
                    })
              ],
            );
          } else {
            return Container();
          }
        } else if (favState is CustomerFavouritesFetchFailed) {
          return


            InkWell(
              onTap: (){
                BlocProvider.of<CustomerFavouritesBloc>(context).add(
                    CustomerFavouritesFetchEvent(
                        reFetch: true, pincode: userData.pinCode));
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
          //   child: Text("${favState.error}"),
          // );

        } else if (favState is CustomerFavouritesLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text(translation.of("unexpected_error_occurred")),
          );
        }
      },
    );
  }
}
