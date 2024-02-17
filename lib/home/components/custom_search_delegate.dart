import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../base_module/domain/entity/translation.dart';
import '../../base_module/presentation/core/values/app_constants.dart';
import '../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_bloc.dart';
import '../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_state.dart';
import '../../catalogue_module/domain/models/product.dart';
import '../../catalogue_module/presentation/components/product_card.dart';
import '../../catalogue_module/presentation/core/values/catalogue_router.dart';
import '../feature/home/blocs/search_bloc/search_bloc.dart';

class CustomSearchDelegate extends SearchDelegate {
  final String categoryId;

  CustomSearchDelegate({this.categoryId = ""});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(
            MdiIcons.backspaceOutline,
            color: Theme.of(context).colorScheme.primary,
          )),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.primary,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<SearchBloc>(context)
        .add(SearchResultFetchEvent(name: query, categoryId: this.categoryId));
    return Container(
      height: double.infinity,
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchResultsLoading) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is SearchResultsFetchFailed) {
            return Center(
              child: Text(
                state.error,
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          } else if (state is SearchResultsFetchSuccess) {
            if (state.data.products.isNotEmpty) {
              List<Product> _list = state.data.products;
              return _gridWidget(list: _list);
            } else {
              return Container(
                constraints: BoxConstraints(
                  maxWidth: 400,
                ),
                child: Center(
                  child: Text(
                    translation.of("no_item"),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              );
            }
          } else {
            return Center(
              child: Text(
                translation.of("unexpected_error_occurred"),
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }
        },
      ),
    );
  }

  Padding _gridWidget({
    required List<Product> list,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding / 4),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 240,
              // childAspectRatio: _height>=_width?_width / (_height*_aspectRatio*1.2):_height / (_width/_aspectRatio*1.2 ),//
              mainAxisExtent: 290,
              // childAspectRatio: 0.6,
              crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, CatalogueRouter.detailScreen,
                    arguments: list[index]);
                // pushNewScreenWithRouteSettings(context,
                //     settings: RouteSettings(
                //         name: CatalogueRouter.detailScreen,
                //         arguments: list[index]),
                //     screen: DetailsScreen(
                //       product: list[index],
                //     ));
              },
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is ListLoaded) {
                    return ProductCard(
                      width: 240,
                      key: PageStorageKey("PRODUCTSLISTLOADED"),
                      product: list[index],
                    );
                  }
                  return ProductCard(
                    width: 240,
                    key: PageStorageKey("PRODUCTSLISTNOTLOADED"),
                    product: list[index],
                  );
                },
              ),
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // double _height = MediaQuery.of(context).size.height;
    //
    // BlocProvider.of<SearchBloc>(context)
    //     .add(SearchResultFetchEvent(name: query));
    // return Container(
    //   constraints: const BoxConstraints(maxWidth: 320),
    //   height: double.infinity,
    //   child: BlocBuilder<SearchBloc, SearchState>(
    //     builder: (context, state) {
    //       if (state is SearchResultsLoading) {
    //         return Container(
    //           child: Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //         );
    //       } else if (state is SearchResultsFetchFailed) {
    //         return Center(
    //           child: Text(
    //             state.error,
    //             style: Theme.of(context).textTheme.headline5,
    //           ),
    //         );
    //       } else if (state is SearchResultsFetchSuccess) {
    //         if (state.data.products.isNotEmpty) {
    //           List<Product> _list = state.data.products;
    //           return ListView.separated(
    //               itemBuilder: (context, index) {
    //                 return ListTile(
    //                   onTap: () => query = _list[index].nameEn!,
    //                   title: Text('${_list[index].nameEn}'),
    //                 );
    //               },
    //               separatorBuilder: (context, index) {
    //                 return Divider();
    //               },
    //               itemCount: _list.length);
    //         } else {
    //           return Container(
    //             constraints: BoxConstraints(
    //                 maxWidth: 400,
    //                 maxHeight: _height - (AppConstants.defaultPadding * 6)),
    //             child: Center(
    //               child: Text(
    //                 translation.of("no_item"),
    //                 style: Theme.of(context).textTheme.headline5,
    //               ),
    //             ),
    //           );
    //         }
    //       } else {
    //         return Center(
    //           child: Text(
    //             translation.of("unexpected_error_occurred"),
    //             style: Theme.of(context).textTheme.headline5,
    //           ),
    //         );
    //       }
    //     },
    //   ),
    // );
    return Container();
  }
}
