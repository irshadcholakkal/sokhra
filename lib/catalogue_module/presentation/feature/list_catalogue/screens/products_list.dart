import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../base_module/data/entity/models/sort_input.dart';
import '../../../../../base_module/domain/entity/app.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/appbar/custom_appbar.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/add_to_cart_bloc/add_to_cart_bloc.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/add_to_cart_bloc/add_to_cart_state.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_bloc.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_event.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_state.dart';
import '../../../../../user_module/domain/user_data.dart';
import '../../../../domain/models/category.dart';
import '../../../../domain/models/product.dart';
import '../../../../domain/models/sub_category.dart';
import '../../../components/product_card.dart';
import '../../../components/shimmer_grid_card.dart';
import '../../../core/values/catalogue_router.dart';
import '../blocs/products_list_bloc/products_list_bloc.dart';
import '../blocs/sort_cubit/sort_cubit.dart';
import '../blocs/sub_category_cubit/sub_category_cubit.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({
    Key? key,
  }) : super(key: key);

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final ScrollController _scrollController = ScrollController();
  late Categorys args;
  late final ProductsListBloc _productsListBloc;
  SortCubit _sortCubit = SortCubit();
  SubCategoryCubit _subCategoryCubit = SubCategoryCubit();

  @override
  void initState() {
    super.initState();
    _productsListBloc = BlocProvider.of<ProductsListBloc>(context);
    _scrollController.addListener(_onScroll);
    _sortCubit.setSortType(sortInput: SortInput());
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _sortCubit.setSortType(sortInput: SortInput());
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as Categorys;
    _productsListBloc.add(ProductsListFetchEvent(
        categoryId: args.id!,
        pincode: userData.pinCode,
        lat: userData.lat,
        lng: userData.lng));
    debugPrint("category id is ${args.id}");

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return BlocProvider.value(
      value: _sortCubit,
      child: Scaffold(
        appBar: CustomAppbar(
          isHome: false,
          context: context,
          categoryId: args.id,
          // isProductList: true,
          // onSortButtonClick: () {
          //   _sortBottomSheet(context);
          // },
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     _sortBottomSheet(context);
        //   },
        //   child: Icon(MdiIcons.sort),
        // ),
        body: RefreshIndicator(
          onRefresh: _reFetchContent,
          child: MultiBlocListener(
            listeners: [
              BlocListener<SortCubit, SortState>(
                listener: (context, state) {
                  if (state is SortSuccess) {
                    _productsListBloc.add(ProductsListFetchEvent(
                        lat: userData.lat,
                        lng: userData.lng,
                        categoryId: args.id!,
                        reFetch: true,
                        pincode: userData.pinCode,
                        sortInput: state.sortInput));
                  }
                },
              ),
            ],
            child: BlocProvider<SubCategoryCubit>(
              create: (context) => _subCategoryCubit,
              child: Container(
                // padding: const EdgeInsets.symmetric(
                //     horizontal: AppConstants.defaultPadding / 4),
                child: ListView(
                  children: [
                    const AppPadding(
                      dividedBy: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.defaultPadding / 4),
                      child: Text(
                        "${args.nameEn ?? translation.of("n/a")}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const AppPadding(
                      dividedBy: 2,
                    ),
                    BlocListener<AddToCartBloc, AddToCartState>(
                      listener: (context, addToCartState) {
                        if (addToCartState is AddToCartSuccess) {
                          BlocProvider.of<CartBloc>(context).add(CartFetchEvent(
                            lng: userData.lng,
                            lat: userData.lat,
                            deviceId: app.deviceId!,
                          ));
                        }
                      },
                      child: BlocListener<CartBloc, CartState>(
                        listener: (context, cartState) {
                          if (cartState is UpdateCartSuccess ||
                              cartState is DeleteCartSuccess) {
                            BlocProvider.of<CartBloc>(context).add(
                                CartFetchEvent(
                                    deviceId: app.deviceId!,
                                    lat: userData.lat,
                                    lng: userData.lng));
                          }
                        },
                        child: BlocBuilder<ProductsListBloc, ProductsListState>(
                          builder: (context, state) {
                            if (state is ProductsListLoading) {
                              return Column(
                                children: [
                                  Container(
                                    height: 30,
                                    width: _width,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              AppConstants.cornerRadius),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 6,
                                          itemBuilder: (context, index) {
                                            return Shimmer.fromColors(
                                              baseColor: Colors.grey.shade300,
                                              highlightColor: AppColorScheme
                                                  .onPrimaryLight
                                                  .withOpacity(0.6),
                                              period: Duration(seconds: 5),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: AppColorScheme
                                                        .onPrimaryLight,
                                                  ),
                                                  width: 80,
                                                  height: 30,
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppConstants.cornerRadius,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppConstants.cornerRadius),
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                mainAxisExtent: 250,
                                                maxCrossAxisExtent: 220,
                                                mainAxisSpacing: 5,
                                                // childAspectRatio: 0.6,
                                                crossAxisSpacing: 5),
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return Shimmer.fromColors(
                                              baseColor: Colors.grey.shade300,
                                              highlightColor: AppColorScheme
                                                  .onPrimaryLight
                                                  .withOpacity(0.6),
                                              period: Duration(seconds: 5),
                                              child: ShimmerGridCard());
                                        }),
                                  )
                                ],
                              );
                            } else if (state is ProductsListFetchFailed) {
                              return Center(
                                child: Text(
                                  state.error,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              );
                            } else if (state is ProductsListFetchSuccess) {
                              List<Product> _list = state.data.products;
                              List<SubCategory> _chipList = [
                                SubCategory(
                                  nameEn: "All",
                                  id: "",
                                )
                              ];
                              _chipList.addAll(args.subCategories ?? []);
                              if (_list.length > 0) {
                                return ListView(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: [
                                    _chipsWidget(_chipList),
                                    AppPadding(
                                      dividedBy: 3,
                                    ),
                                    _gridWidget(
                                      list: _list,
                                    ),
                                  ],
                                );
                              } else {
                                return Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 400,
                                      maxHeight: _height -
                                          (AppConstants.defaultPadding * 6)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _chipsWidget(_chipList),
                                      const AppPadding(
                                        multipliedBy: 6,
                                      ),
                                      Center(
                                        child: Text(
                                          translation.of("no_item"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                      ),
                                    ],
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
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<dynamic> _sortBottomSheet(BuildContext context) {
  //   return showModalBottomSheet(
  //       clipBehavior: Clip.antiAlias,
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(AppConstants.cornerRadius),
  //               topRight: Radius.circular(AppConstants.cornerRadius))),
  //       context: context,
  //       builder: (context) {
  //         Map<String, SortInput> sortMap = {
  //           "Default": SortInput(),
  //           "Price: Low to High": SortInput(price: "Asc"),
  //           "Price: High to Low": SortInput(price: "Desc"),
  //           "Latest first": SortInput(createdAt: "Desc"),
  //           "Oldest first": SortInput(createdAt: "Asc"),
  //         };
  //         SortInput? value;
  //         return BlocProvider.value(
  //           value: _sortCubit,
  //           child: Container(
  //               clipBehavior: Clip.antiAlias,
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(AppConstants.cornerRadius),
  //                       topRight: Radius.circular(AppConstants.cornerRadius))),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: BlocBuilder<SortCubit, SortState>(
  //                     builder: (context, state) {
  //                   if (state is SortSuccess) {
  //                     value = state.sortInput;
  //                     return ListView.builder(
  //                         shrinkWrap: true,
  //                         itemCount: sortMap.length,
  //                         itemBuilder: (context, index) {
  //                           return ListTile<SortInput>(
  //                             activeColor:
  //                                 Theme.of(context).colorScheme.secondary,
  //                             controlAffinity: ListTileControlAffinity.trailing,
  //                             title: Text(sortMap.keys.elementAt(index)),
  //                             selected:
  //                                 sortMap.values.elementAt(index) == value,
  //                             groupValue: value,
  //                             value: sortMap.values.elementAt(index),
  //                             onChanged: (newValue) {
  //                               BlocProvider.of<SortCubit>(context)
  //                                   .setSortType(sortInput: newValue);
  //                               Navigator.pop(context);
  //                             },
  //                           );
  //                         });
  //                   } else {
  //                     return ListView.builder(
  //                         shrinkWrap: true,
  //                         itemCount: sortMap.length,
  //                         itemBuilder: (context, index) {
  //                           return RadioListTile<SortInput>(
  //                             controlAffinity: ListTileControlAffinity.trailing,
  //                             title: Text(sortMap.keys.elementAt(index)),
  //                             selected:
  //                                 sortMap.values.elementAt(index) == value,
  //                             groupValue: value,
  //                             value: sortMap.values.elementAt(index),
  //                             onChanged: (newValue) {
  //                               BlocProvider.of<SortCubit>(context)
  //                                   .setSortType(sortInput: newValue);
  //                               Navigator.pop(context);
  //                             },
  //                           );
  //                         });
  //                   }
  //                 }),
  //               )),
  //         );
  //       });
  // }

  Padding _gridWidget({
    required List<Product> list,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding / 4),
      child: AnimationLimiter(
        child: GridView.builder(
            controller: _scrollController,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 240,
                mainAxisExtent: 290,

                // childAspectRatio: _height>=_width?_width / (_height*_aspectRatio*1.2):_height / (_width/_aspectRatio*1.2 ),//
                // childAspectRatio: 0.6,
                // mainAxisExtent: 280,
                crossAxisSpacing: 5,
                mainAxisSpacing: 8),
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
                child: AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: 2, // Same as the crossAxisCount above
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Material(
                        child: Hero(
                          tag: list[index].productId.toString(),
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
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  AnimationLimiter _chipsWidget(List<SubCategory> _chips) {
    return AnimationLimiter(
      child: Container(
        height: 50,
        child: BlocBuilder<SubCategoryCubit, SubCategoryState>(
          builder: (context, state) {
            if (state is SubCategoryLoaded) {
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _chips.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: FilterChip(
                                selected: state.selectedIndex ==
                                    _chips.indexOf(_chips[index]),
                                label: Text("${_chips[index].nameEn}"),
                                labelStyle: state.selectedIndex !=
                                        _chips.indexOf(_chips[index])
                                    ? Theme.of(context).textTheme.button
                                    : Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary),
                                onSelected: (bool onChecked) {
                                  BlocProvider.of<SubCategoryCubit>(context)
                                      .setIndex(index: index);
                                  _productsListBloc.add(
                                    ProductsListFetchEvent(
                                        lng: userData.lng,
                                        lat: userData.lat,
                                        categoryId: args.id!,
                                        pincode: userData.pinCode,
                                        reFetch: true,
                                        subCategoryId: _chips[index].id),
                                  );
                                }),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  void _onScroll() {
    final triggerFetchMoreSize =
        0.8 * _scrollController.position.maxScrollExtent;

    if (_scrollController.position.pixels > triggerFetchMoreSize) {
      BlocProvider.of<ProductsListBloc>(context).add(ProductsListFetchEvent(
          lat: userData.lat,
          lng: userData.lng,
          categoryId: args.id!,
          pincode: userData.pinCode));
    }
  }

  Future<void> _reFetchContent() async {
    if (_productsListBloc.state is! ProductsListLoading) {
      _productsListBloc.add(ProductsListFetchEvent(
          lat: userData.lat,
          lng: userData.lng,
          categoryId: args.id!,
          reFetch: true,
          pincode: userData.pinCode));
      _subCategoryCubit.setIndex(index: 0);
    }
    return await Future.delayed(Duration(milliseconds: 500));
  }
}
