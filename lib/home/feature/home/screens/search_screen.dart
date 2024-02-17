// // // import 'dart:async';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';
// // // import 'package:shimmer/shimmer.dart';
// // // import '../../../../base_module/domain/entity/translation.dart';
// // // import '../../../../catalogue_module/domain/models/category_model.dart';
// // // import '../../../../catalogue_module/domain/models/product_status.dart';
// // // import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_bloc.dart';
// // // import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_event.dart';
// // // import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_state.dart';
// // // import '../../../../new_cart_module/domain/new_cart_model.dart';
// // // import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
// // // import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_state.dart';
// // // import '../../../../user_module/domain/user_data.dart';
// // // import '../../../components/home_product_card.dart';
// // // class ProductSearchScreen extends SearchDelegate {
// // //   final SubCategory? category;
// // //   Timer? _timer;
// // //   String _lastQuery = "";
// // //   final _scrollController = ScrollController();
// // //   final _subcategoryItemsBloc = SubcategoryItemsBloc();
// // //   ProductSearchScreen({this.category}) {
// // //     _scrollController.addListener(_onScroll);
// // //   }
// // //   @override
// // //   String get searchFieldLabel => translation.of("search");
// // //   @override
// // //   TextInputAction get textInputAction => TextInputAction.done;
// // //   @override
// // //   List<Widget> buildActions(BuildContext context) {
// // //     return [
// // //       IconButton(
// // //         icon: const Icon(Icons.clear),
// // //         onPressed: () {
// // //           query = '';
// // //         },
// // //       ),
// // //     ];
// // //   }
// // //   @override
// // //   Widget buildLeading(BuildContext context) {
// // //     return IconButton(
// // //       icon: const Icon(Icons.arrow_back),
// // //       onPressed: () {
// // //         close(context, null);
// // //       },
// // //     );
// // //   }
// // //   @override
// // //   Widget buildResults(BuildContext context) {
// // //     if (query.length < 1) {
// // //       return _statusWidget(translation.of("add_search_text"));
// // //     }
// // //     return Scaffold(
// // //       body: Container(
// // //         padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
// // //         child: RefreshIndicator(
// // //           onRefresh: _reFetchContent,
// // //           child: BlocBuilder<NewCartBloc, NewCartState>(
// // //             builder: (context, state) {
// // //               List<Cart> cartList = [];
// // //               if (state is CartLoaded) {
// // //                 cartList = state.cartList ?? [];
// // //               }
// // //               return BlocBuilder<SubcategoryItemsBloc, SubcategoryItemsState>(
// // //                 bloc: _subcategoryItemsBloc,
// // //                 builder: (context, state) {
// // //                   if (state is SubcategoryItemsLoading) {
// // //                     return GridView.builder(
// // //                       padding: EdgeInsets.all(8.0),
// // //                       shrinkWrap: true,
// // //                       physics: NeverScrollableScrollPhysics(),
// // //                       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
// // //                         maxCrossAxisExtent: 240,
// // //                         // childAspectRatio: 160 / 240,
// // //                         childAspectRatio: 136 / 240,
// // //                         crossAxisSpacing: 8.0,
// // //                         mainAxisSpacing: 8.0,
// // //                       ),
// // //                       itemCount: 10,
// // //                       itemBuilder: (context, index) {
// // //                         return Container(
// // //                           decoration: BoxDecoration(
// // //                             borderRadius: BorderRadius.circular(11.0),
// // //                           ),
// // //                           child: ClipRRect(
// // //                             borderRadius: BorderRadius.circular(11.0),
// // //                             child: Shimmer.fromColors(
// // //                               baseColor: Colors.grey.shade300,
// // //                               highlightColor: AppColorScheme.onPrimaryLight.withOpacity(0.6),
// // //                               period: Duration(seconds: 5),
// // //                               child: Container(
// // //                                 color: Colors.yellow,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         );
// // //                       },
// // //                     );
// // //                   } else if (state is SubcategoryItemsLoaded) {
// // //                     return ListView(
// // //                       padding: EdgeInsets.all(8.0),
// // //                       children: [
// // //                         Container(
// // //                           decoration: BoxDecoration(
// // //                             borderRadius: BorderRadius.circular(12.0),
// // //                           ),
// // //                         ),
// // //                         GridView.builder(
// // //                           shrinkWrap: true,
// // //                           physics: NeverScrollableScrollPhysics(),
// // //                           gridDelegate:
// // //                               SliverGridDelegateWithMaxCrossAxisExtent(
// // //                             maxCrossAxisExtent: 240,
// // //                             // childAspectRatio: 136 / 240,
// // //                             // childAspectRatio: 160 / 240,
// // //                             crossAxisSpacing: 8.0,
// // //                             mainAxisSpacing: 8.0,
// // //                                 mainAxisExtent: 258
// // //                           ),
// // //                           itemCount: state.products.length,
// // //                           itemBuilder: (context, index) {
// // //                             final product = state.products[index];
// // //                             int itemQuantity = 1;
// // //                             bool isInCart = false;
// // //                             final isInStock =
// // //                                product.variants?[index].status  == ProductStatus.IN_STOCK.name;
// // //                             final cartItem = cartList.firstWhere(
// // //                               (element) => element.product?.id == product.id,
// // //                               orElse: () => Cart(),
// // //                             );
// // //                             if (cartItem.id != null) {
// // //                               isInCart = true;
// // //                               itemQuantity = cartItem.quantity ?? 1;
// // //                             }
// // //                             return HomeProductCard(
// // //                               product: product,
// // //                               isInStock: isInStock,
// // //                               isInCart: isInCart,
// // //                               cartItem: cartItem,
// // //                               itemQuantity: itemQuantity,
// // //                             );
// // //                           },
// // //                         )
// // //                       ],
// // //                     );
// // //                   } else {
// // //                     return Container(
// // //                       child: Center(
// // //                         child: Text("No data"),
// // //                       ),
// // //                     );
// // //                   }
// // //                 },
// // //               );
// // //             },
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //   @override
// // //   Widget buildSuggestions(BuildContext context) {
// // //     _search();
// // //     return buildResults(context);
// // //   }
// // //   Widget _statusWidget(String message) {
// // //     return Column(
// // //       mainAxisAlignment: MainAxisAlignment.center,
// // //       children: <Widget>[
// // //         Center(
// // //           child: Text(message),
// // //         )
// // //       ],
// // //     );
// // //   }
// // //   void _search() {
// // //     if (query != _lastQuery) {
// // //       _lastQuery = query;
// // //       _subcategoryItemsBloc.add(ClearProductsBySubcategory());
// // //       _timer?.cancel();
// // //       _timer = Timer(const Duration(milliseconds: 350), () {
// // //         if (query.length > 0) {
// // //           _reFetchContent();
// // //         }
// // //         _timer?.cancel();
// // //       });
// // //     }
// // //   }
// // //   void _onScroll() {
// // //     //TODO: _onScroll
// // //     // final triggerFetchMoreSize =
// // //     //     0.8 * _scrollController.position.maxScrollExtent;
// // //     //
// // //     // if (_scrollController.position.pixels > triggerFetchMoreSize &&
// // //     //     !_subcategoryItemsBloc.hasReachedMax) {
// // //     //   _subcategoryItemsBloc.add( FetchProductsBySubcategory());
// // //     // }
// // //   }
// // //   Future<void> _reFetchContent() async {
// // //     if (_subcategoryItemsBloc.state is! SubcategoryItemsLoading) {
// // //       _subcategoryItemsBloc.add(FetchProductsBySubcategory(
// // //         searchKey: query,
// // //         //@deprecated - search through all sub categories
// // //         // subcategoryId: category?.id ?? "",
// // //         pincode: userData.pinCode,
// // //       ));
// // //     }
// // //     return Future.delayed(const Duration(milliseconds: 500));
// // //   }
// // // }

// // import 'package:easy_refresh/easy_refresh.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/rendering.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:iconsax/iconsax.dart';
// // import 'package:lumiereorganics_app/catalogue_module/domain/models/category_model.dart';

// // import '../../../../base_module/data/entity/models/sort_input.dart';
// // import '../../../../base_module/domain/entity/color_scheme.dart';
// // import '../../../../base_module/presentation/core/values/app_constants.dart';
// // import '../../../../catalogue_module/domain/models/product.dart';
// // import '../../../../catalogue_module/domain/models/product_status.dart';
// // import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_bloc.dart';
// // import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_event.dart';
// // import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_state.dart';
// // import '../../../../new_cart_module/domain/new_cart_model.dart';
// // import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
// // import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_event.dart';
// // import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_state.dart';
// // import '../../../../user_module/domain/user_data.dart';
// // import '../../../components/home_product_card.dart';

// // class SearchScreen extends StatefulWidget {
// //   final List<SubCategory> subCategoryList;
// //   final bool isSearchEnabled;
// //   final String? selectedSubCategoryId;
// //   final String? categoryId;
// //   const SearchScreen({Key? key, required this.subCategoryList, required this.isSearchEnabled, this.selectedSubCategoryId, this.categoryId}) : super(key: key);

// //   @override
// //   State<SearchScreen> createState() => _SearchScreenState();
// // }

// // class _SearchScreenState extends State<SearchScreen> {
// //   final TextEditingController _search = TextEditingController();
// //   String _selectedSubcategoryId = '';

// //  List<String> _itemSortBy = [
// //     "All ",
// //     "Price : Low to high",
// //     "Price : High to low",
// //   ];
// //   List<String> _itemsBrand = [
// //     "All ",
// //     "Pepsico",
// //     "Coca Cola",
// //     "King fisher",
// //   ];
// //   int _selectedIndex = 0;
// //   int _selectedIndexSort = 0;
// //   int _selectedIndexBrand = 0;
// //   String _selectedBrandId = '';
// //   int _selectedSubCategoryIndex = 0;
// //   List<Product> _productList = [];

// //   List<Cart> _cartList = [];
// //   bool _enableSearch = false;
// //   final _searchController = TextEditingController();
// //   final _scrollController = ScrollController();
// //   final _scrollControllerForCategoryList = ScrollController();
// //   final _refreshController = EasyRefreshController(
// //     controlFinishRefresh: true,
// //     controlFinishLoad: true,
// //   );
// //   SortType? selectedSortBy;

// //    @override
// //   void initState() {
// //     super.initState();
// //     _getCurrentIndex();

// //   //  _subCategoryList.addAll(widget.subCategoryList);
// //     BlocProvider.of<NewCartBloc>(context).add(
// //       FetchCartItems(pincode: userData.pinCode),
// //     );

// //     _fetchData(isFromSubCategory: false);
// //   }

// //   @override
// //   void dispose() {
// //     _scrollController.dispose();
// //     _refreshController.dispose();
// //     _searchController.dispose();
// //     super.dispose();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColorScheme.surfaceColorLight,
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           child: BlocListener<NewCartBloc, NewCartState>(
// //             listener: (context, state) {
// //               if (state is CartLoaded) {
// //                 setState(() {
// //                   _cartList = state.cartList ?? [];
// //                 });
// //               }
// //             },
// //             child: Container(
// //               // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   _appBar(),
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //                   _tabItems(),
// //                   SizedBox(
// //                     height: 10,
// //                   ),
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: AppConstants.defaultPadding / 2,
// //                         vertical: AppConstants.defaultPadding / 2),
// //                     child:

// //                         // BlocBuilder<NewCartBloc, NewCartState>(
// //                         //   builder: (context, state) {
// //                         //     List<Cart> cartList = [];

// //                         // return

// //                         BlocBuilder<SubcategoryItemsBloc,
// //                             SubcategoryItemsState>(
// //                       builder: (context, state) {
// //                         if (state is SubcategoryItemsLoading) {
// //                           // return _categoryScreen();
// //                           return Center(child: CircularProgressIndicator());

// //                           // SubCategoryScreen(isSearchEnabled: false,
// //                           // subCategoryList:widget.subCategoryList,
// //                           // selectedSubCategoryId:widget.selectedSubCategoryId
// //                           // );
// //                           // Expanded(
// //                           //   child: GridView.builder(
// //                           //     padding: EdgeInsets.all(8.0),
// //                           //     shrinkWrap: true,
// //                           //     //physics: NeverScrollableScrollPhysics(),
// //                           //     gridDelegate:
// //                           //         SliverGridDelegateWithMaxCrossAxisExtent(
// //                           //       maxCrossAxisExtent: 240,
// //                           //       // childAspectRatio: 160 / 240,
// //                           //       childAspectRatio: 136 / 240,
// //                           //       crossAxisSpacing: 8.0,
// //                           //       mainAxisSpacing: 8.0,
// //                           //     ),
// //                           //     itemCount: 10,
// //                           //     itemBuilder: (context, index) {
// //                           //       return Container(
// //                           //         decoration: BoxDecoration(
// //                           //           borderRadius: BorderRadius.circular(11.0),
// //                           //         ),
// //                           //         child: ClipRRect(
// //                           //           borderRadius: BorderRadius.circular(11.0),
// //                           //           child: Shimmer.fromColors(
// //                           //             baseColor: Colors.grey.shade300,
// //                           //             highlightColor:
// //                           //                 AppColorScheme.onPrimaryLight.withOpacity(0.6),
// //                           //             period: Duration(seconds: 5),
// //                           //             child: Container(
// //                           //               color: Colors.yellow,
// //                           //             ),
// //                           //           ),
// //                           //         ),
// //                           //       );
// //                           //     },
// //                           //   ),
// //                           // );
// //                         } else if (state is SubcategoryItemsLoaded) {
// //                           final products = state.products;
// //                           _productList.clear();
// //                          // _productList.addAll(products);

// //                           return
// //                               // Expanded(
// //                               // child:
// //                               ListView(
// //                             shrinkWrap: true,
// //                             padding: EdgeInsets.all(8.0),
// //                             children: [
// //                               Container(
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(12.0),
// //                                 ),
// //                               ),
// //                               GridView.builder(
// //                                 shrinkWrap: true,
// //                                 physics: NeverScrollableScrollPhysics(),
// //                                 gridDelegate:
// //                                     SliverGridDelegateWithMaxCrossAxisExtent(
// //                                         maxCrossAxisExtent: 240,
// //                                         crossAxisSpacing: 8.0,
// //                                         mainAxisSpacing: 8.0,
// //                                         mainAxisExtent: 272
// //                                         //258
// //                                         ),
// //                                 itemCount: state.products.length,
// //                                 itemBuilder: (context, index) {
// //                                   final product = state.products[index];
// //                                   int itemQuantity = 1;
// //                                   bool isInCart = false;
// //                                   bool isInStock = false;
// //                                   product.variants?.forEach((element) {
// //                                     if (element.status ==
// //                                         ProductStatus.IN_STOCK.name) {
// //                                       isInStock = true;
// //                                     } else {
// //                                       // isInStock = false;
// //                                     }
// //                                   });

// //                                   final cartItem = _cartList.firstWhere(
// //                                     (element) =>
// //                                         element.product?.id == product.id,
// //                                     orElse: () => Cart(),
// //                                   );

// //                                   if (cartItem.id != null) {
// //                                     isInCart = true;
// //                                     itemQuantity = cartItem.quantity ?? 1;
// //                                   }
// //                                   return HomeProductCard(
// //                                     product: product,
// //                                     isInStock: isInStock,
// //                                     isInCart: isInCart,
// //                                     cartItem: cartItem,
// //                                     itemQuantity: itemQuantity,
// //                                   );
// //                                 },
// //                               )
// //                             ],
// //                           );
// //                           // );
// //                         } else {
// //                           return Container(
// //                             height: 150,
// //                             child: Align(
// //                               alignment: Alignment.center,
// //                               child: Text(
// //                                  "No results found for “${_search.text}”",
// //                                 style: TextStyle(
// //                                     fontSize: 14,
// //                                     fontFamily: 'Poppins',
// //                                     fontWeight: FontWeight.w500,
// //                                     color: Color(0xFF1D1A20).withOpacity(0.50)),
// //                               ),
// //                             ),
// //                           );
// //                         }
// //                       },
// //                     ),

// //                     // },
// //                     // ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _searchBar() {
// //     return Container(
// //       width: 254,
// //       height: 36,
// //       decoration: BoxDecoration(boxShadow: [
// //         BoxShadow(
// //           offset: const Offset(12, 26),
// //           blurRadius: 50,
// //           spreadRadius: 0,
// //           color: Colors.grey.withOpacity(.1),
// //         ),
// //       ]),
// //       child: TextField(
// //         controller: _search,
// //         onChanged: (value) {
// //           if (_selectedSubCategoryIndex == 0) {
// //             _fetchData(isFromSubCategory: false);
// //           } else {
// //             _fetchData(isFromSubCategory: true);
// //           }
// //         },
// //         // _searchHelper.search,
// //         decoration: InputDecoration(
// //           prefixIcon: const Icon(
// //             Icons.search,
// //             color: Color.fromARGB(255, 151, 150, 151),
// //           ),
// //           filled: true,
// //           fillColor: Color(0xFFF7EDFF),
// //           hintText: 'Search',
// //           hintStyle: const TextStyle(color: Colors.grey),
// //           contentPadding:
// //               const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
// //           border: const OutlineInputBorder(
// //             borderRadius: BorderRadius.all(Radius.circular(15.0)),
// //           ),
// //           enabledBorder: const OutlineInputBorder(
// //             borderSide: BorderSide(color: Color(0xFFF7EDFF), width: 1.0),
// //             borderRadius: BorderRadius.all(Radius.circular(15.0)),
// //           ),
// //           focusedBorder: const OutlineInputBorder(
// //             borderSide: BorderSide(color: Color(0xFFF7EDFF), width: 2.0),
// //             borderRadius: BorderRadius.all(Radius.circular(15.0)),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _appBar() {
// //     return SizedBox(
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           InkWell(
// //             onTap: () {
// //               Navigator.pop(context);
// //             },
// //             child: Container(
// //               width: 36,
// //               height: 36,
// //               decoration: ShapeDecoration(
// //                 color: Color(0xFFF7EDFF),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(10),
// //                 ),
// //               ),
// //               child: Icon(Iconsax.arrow_left, color: AppColorScheme.onBlack),
// //             ),
// //           ),
// //           _searchBar(),
// //           Container(
// //             width: 36,
// //             height: 36,
// //             decoration: ShapeDecoration(
// //               color: Color(0xFFF7EDFF),
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //             ),
// //             child: InkWell(
// //                 onTap: () {
// //                   _showFilterProducts();
// //                 },
// //                 child: Icon(Iconsax.candle_2, size: 18)),
// //           )
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _tabItems() {
// //       List<SubCategory> subCategoryListWithAll = [SubCategory(nameEn: 'All')] + widget.subCategoryList;

// //     return SizedBox(
// //       height: 38,
// //       child: ListView.builder(
// //         controller: _scrollControllerForCategoryList,
// //         shrinkWrap: true,
// //         scrollDirection: Axis.horizontal,
// //         physics: BouncingScrollPhysics(),
// //         itemCount: subCategoryListWithAll.length,
// //         //widget.subCategoryList.length,
// //         //_items.length,
// //         itemBuilder: (context, index) {
// //           return Padding(
// //             padding: const EdgeInsets.only(left: 8),
// //             child: InkWell(
// //               onTap: () {
// //                 setState(() {
// //                   //selectedIndex = index;
// //                   _selectedSubCategoryIndex = index;
// //                 });
// //                 _fetchData(isFromSubCategory: false);
// //               },
// //               child: Container(
// //                 //width: 91,
// //                 height: 28,
// //                 padding:
// //                     const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
// //                 decoration: ShapeDecoration(
// //                   color: _selectedSubCategoryIndex == index
// //                       ? AppColorScheme.primaryColor
// //                       : Color(0xFFF7EDFF),
// //                   shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(6)),
// //                 ),
// //                 child: Center(
// //                   child: Text(
// //                     subCategoryListWithAll[index].nameEn!,
// //                    // widget.subCategoryList[index].nameEn!,
// //                     //_items[index],
// //                     style: TextStyle(
// //                       color: _selectedSubCategoryIndex == index
// //                           ? AppColorScheme.onPrimaryLight
// //                           : Color(0xFF1D1A20),
// //                       fontSize: 12,
// //                       fontFamily: 'Poppins',
// //                       fontWeight: FontWeight.w500,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   void _showFilterProducts() {
// //     showModalBottomSheet(
// //         context: context,
// //         shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.vertical(
// //               top: Radius.circular(AppConstants.cornerRadius)),
// //         ),
// //         builder: (
// //           context,
// //         ) {
// //           return
// //               //  BottomSheetFilter(
// //               //   controller: _scrollControllerForCategoryList,
// //               //   items: widget.subCategoryList.length,
// //               //   selectedIndex: _selectedSubCategoryIndex,
// //               //   subCategory: widget.subCategoryList,
// //               //   fetchdata:(){ _fetchData();}
// //               // );

// //               StatefulBuilder(
// //                   builder: (BuildContext context, StateSetter setState) {
// //             return Container(
// //               padding: EdgeInsets.all(20),
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     children: [
// //                       IconButton(
// //                           onPressed: () {
// //                             Navigator.pop(context);
// //                           },
// //                           icon: Icon(
// //                             Iconsax.arrow_left,
// //                             size: 18,
// //                           )),
// //                       Text(
// //                         'Filter products',
// //                         style: TextStyle(
// //                           color: Color(0xFF1D1B1E),
// //                           fontSize: 16,
// //                           fontFamily: 'Poppins',
// //                           fontWeight: FontWeight.w600,
// //                         ),
// //                       )
// //                     ],
// //                   ),
// //                   Divider(
// //                     // height: 0.50,
// //                     thickness: 1,
// //                   ),
// //                   Text(
// //                     'Sub category',
// //                     style: TextStyle(
// //                       color: Color(0xFF1D1A20),
// //                       fontSize: 16,
// //                       fontFamily: 'Poppins',
// //                       fontWeight: FontWeight.w500,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 38,
// //                     child: ListView.builder(
// //                       controller:
// //                           //widget.scrollControllerForCategoryList,
// //                           _scrollControllerForCategoryList,
// //                       shrinkWrap: true,
// //                       scrollDirection: Axis.horizontal,
// //                       physics: BouncingScrollPhysics(),
// //                       itemCount: widget.subCategoryList.length,
// //                       itemBuilder: (context, index) {
// //                         return Padding(
// //                           padding: const EdgeInsets.only(left: 8),
// //                           child: InkWell(
// //                             onTap: () {
// //                               setState(() {
// //                                 _selectedSubCategoryIndex = index;
// //                               });
// //                             },
// //                             child: Container(
// //                               // width: 91,
// //                               height: 28,
// //                               padding: const EdgeInsets.symmetric(
// //                                   horizontal: 12, vertical: 10),
// //                               decoration: ShapeDecoration(
// //                                 color: _selectedSubCategoryIndex == index
// //                                     ? AppColorScheme.primaryColor
// //                                     : Color(0xFFF7EDFF),
// //                                 shape: RoundedRectangleBorder(
// //                                     borderRadius: BorderRadius.circular(6)),
// //                               ),
// //                               child: Center(
// //                                 child: Text(
// //                                   widget.subCategoryList[index].nameEn!,
// //                                   //_items[index],
// //                                   style: TextStyle(
// //                                     color: _selectedSubCategoryIndex == index
// //                                         ? AppColorScheme.onPrimaryLight
// //                                         : Color(0xFF1D1A20),
// //                                     fontSize: 12,
// //                                     fontFamily: 'Poppins',
// //                                     fontWeight: FontWeight.w500,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 5,
// //                   ),
// //                   Text(
// //                     'Sort by',
// //                     style: TextStyle(
// //                       color: Color(0xFF1D1A20),
// //                       fontSize: 16,
// //                       fontFamily: 'Poppins',
// //                       fontWeight: FontWeight.w500,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 38,
// //                     child: ListView.builder(
// //                       shrinkWrap: true,
// //                       scrollDirection: Axis.horizontal,
// //                       physics: BouncingScrollPhysics(),
// //                       itemCount: _itemSortBy.length,
// //                       itemBuilder: (context, index) {
// //                         return Padding(
// //                           padding: const EdgeInsets.only(left: 8),
// //                           child: InkWell(
// //                             onTap: () {
// //                               setState(() {
// //                                _selectedIndexSort = index;
// //                               });

// //                               switch (index) {
// //                                 case 1:
// //                                   selectedSortBy = SortType.Asc;
// //                                   break;
// //                                 case 2:
// //                                   selectedSortBy = SortType.Desc;
// //                                   break;

// //                                 // default:
// //                                 //   selectedSortBy = SortType.Asc;
// //                               }

// //                               print('Selected Sort By: $selectedSortBy');
// //                             },
// //                             child: Container(
// //                               // width: 91,
// //                               height: 28,
// //                               padding: const EdgeInsets.symmetric(
// //                                   horizontal: 12, vertical: 10),
// //                               decoration: ShapeDecoration(
// //                                 color: _selectedIndexSort == index
// //                                     ? AppColorScheme.primaryColor
// //                                     : Color(0xFFF7EDFF),
// //                                 shape: RoundedRectangleBorder(
// //                                     borderRadius: BorderRadius.circular(6)),
// //                               ),
// //                               child: Center(
// //                                 child: Text(
// //                                   _itemSortBy[index],
// //                                   style: TextStyle(
// //                                     color: _selectedIndexSort == index
// //                                         ? AppColorScheme.onPrimaryLight
// //                                         : Color(0xFF1D1A20),
// //                                     fontSize: 12,
// //                                     fontFamily: 'Poppins',
// //                                     fontWeight: FontWeight.w500,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                   Text(
// //                     'Brand',
// //                     style: TextStyle(
// //                       color: Color(0xFF1D1A20),
// //                       fontSize: 16,
// //                       fontFamily: 'Poppins',
// //                       fontWeight: FontWeight.w500,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 38,
// //                     child: ListView.builder(
// //                       shrinkWrap: true,
// //                       scrollDirection: Axis.horizontal,
// //                       physics: BouncingScrollPhysics(),
// //                       itemCount: _itemsBrand.length,
// //                       itemBuilder: (context, index) {
// //                         return Padding(
// //                           padding: const EdgeInsets.only(left: 8),
// //                           child: InkWell(
// //                             onTap: () {
// //                               setState(() {
// //                                 _selectedIndexBrand = index;
// //                               });
// //                             },
// //                             child: Container(
// //                               // width: 91,
// //                               height: 28,
// //                               padding: const EdgeInsets.symmetric(
// //                                   horizontal: 12, vertical: 10),
// //                               decoration: ShapeDecoration(
// //                                 color: _selectedIndexBrand == index
// //                                     ? AppColorScheme.primaryColor
// //                                     : Color(0xFFF7EDFF),
// //                                 shape: RoundedRectangleBorder(
// //                                     borderRadius: BorderRadius.circular(6)),
// //                               ),
// //                               child: Center(
// //                                 child: Text(
// //                                   _itemsBrand[index],
// //                                   style: TextStyle(
// //                                     color: _selectedIndexBrand == index
// //                                         ? AppColorScheme.onPrimaryLight
// //                                         : Color(0xFF1D1A20),
// //                                     fontSize: 12,
// //                                     fontFamily: 'Poppins',
// //                                     fontWeight: FontWeight.w500,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                   Divider(
// //                     thickness: 1,
// //                   ),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                     children: [
// //                       ElevatedButton(
// //                         onPressed: () {},
// //                         child: Text(
// //                           "Reset Filter",
// //                           style: TextStyle(
// //                             color: AppColorScheme.primaryColor,
// //                             fontSize: 16,
// //                             fontFamily: 'Poppins',
// //                             fontWeight: FontWeight.w500,
// //                           ),
// //                         ),
// //                         style: Theme.of(context)
// //                             .elevatedButtonTheme
// //                             .style
// //                             ?.copyWith(
// //                               padding: MaterialStateProperty.all(
// //                                 const EdgeInsets.symmetric(
// //                                     horizontal: 25, vertical: 15),
// //                               ),
// //                               backgroundColor: MaterialStateProperty.all(
// //                                 Color(0xFFF7F2FA),
// //                               ),
// //                             ),
// //                       ),
// //                       OutlinedButton(
// //                         onPressed: () {
// //                           _fetchData(isFromSubCategory: false);
// //                           setState(() {});
// //                           Navigator.pop(context);
// //                         },
// //                         child: Text(
// //                           "Apply Filter",
// //                           style: TextStyle(
// //                             color: AppColorScheme.onPrimaryLight,
// //                             fontSize: 16,
// //                             fontFamily: 'Poppins',
// //                             fontWeight: FontWeight.w500,
// //                           ),
// //                         ),
// //                         style: Theme.of(context)
// //                             .elevatedButtonTheme
// //                             .style
// //                             ?.copyWith(
// //                               padding: MaterialStateProperty.all(
// //                                 const EdgeInsets.symmetric(
// //                                     horizontal: 25, vertical: 15),
// //                               ),
// //                               side: MaterialStateProperty.all(
// //                                 BorderSide(
// //                                   color: AppColorScheme.primaryColor,
// //                                 ),
// //                               ),
// //                             ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             );
// //           });
// //         });
// //   }

// //   // void _fetchData() {
// //   //   BlocProvider.of<SubcategoryItemsBloc>(context).add(
// //   //     FetchProductsBySubcategory(
// //   //       searchKey: _search.text,
// //   //       subcategoryId: _selectedSubcategoryId,
// //   //       categoryId: widget.categoryId,
// //   //       pincode: userData.pinCode,
// //   //       SortByPrice: selectedSortBy.toString()

// //   //     ),
// //   //   );
// //   // }

// // //   void _fetchData() {

// // //     BlocProvider.of<SubcategoryItemsBloc>(context).add(FetchProductsBySubcategory(
// // //       searchKey: _search.text,
// // //       subcategoryId: _selectedSubcategoryId,
// // //       categoryId: widget.categoryId,
// // //       pincode: userData.pinCode,
// // //       SortByPrice: selectedSortBy.toString(),
// // //     ));
// // //   }
// // // }

// // void _fetchData({required bool isFromSubCategory}) {
// //     BlocProvider.of<SubcategoryItemsBloc>(context).add(
// //       FetchProductsBySubcategory(
// //           searchKey: _search.text,
// //           subcategoryId: _selectedSubcategoryId,
// //           pincode: userData.pinCode,
// //           isFromSubCategory: isFromSubCategory,
// //           categoryId: widget.categoryId),
// //     );
// //   }

// //   void _filterData({required bool isFromSubCategory}) {
// //     BlocProvider.of<SubcategoryItemsBloc>(context).add(
// //       FetchProductsBySubcategory(
// //         isFilter: true,
// //         SortByPrice: selectedSortBy.toString(),
// //         searchKey: _search.text,
// //         subcategoryId: _selectedSubcategoryId,
// //         pincode: userData.pinCode,
// //         isFromSubCategory: isFromSubCategory,
// //         categoryId: widget.categoryId,
// //       ),
// //     );
// //   }

// //   bool _changeSubCategory([bool reverse = true]) {
// //     int index = _selectedSubCategoryIndex;
// //     bool canFetch = false;

// //     if (reverse) {
// //       if (index + 1 < widget.subCategoryList.length) {
// //         index += 1;
// //         canFetch = true;
// //       }
// //     } else {
// //       if (index - 1 >= 0) {
// //         index -= 1;
// //         canFetch = true;
// //       }
// //     }

// //     if (canFetch) {
// //       setState(() {
// //         _selectedSubCategoryIndex = index;
// //       });

// //       _fetchData(isFromSubCategory: false);
// //       return true;
// //     }

// //     return false;
// //   }

// //   void _onScroll() {
// //     if (_scrollController.position.userScrollDirection ==
// //         ScrollDirection.reverse) {
// //       if (_scrollController.position.pixels ==
// //           _scrollController.position.maxScrollExtent) {
// //         // _changeSubCategory();
// //       }
// //     } else if (_scrollController.position.userScrollDirection ==
// //         ScrollDirection.forward) {
// //       if (_scrollController.position.pixels ==
// //           _scrollController.position.maxScrollExtent) {
// //         // _changeSubCategory(false);
// //       }
// //     }
// //   }

// //   void _onRefresh() async {
// //     final shouldIndicate = _changeSubCategory(false);
// //     await Future.delayed(Duration(milliseconds: 500));
// //     _refreshController.finishRefresh();
// //     _refreshController.closeHeaderSecondary();
// //     _refreshController.resetHeader();
// //   }

// //   void _onLoad() async {
// //     final shouldIndicate = _changeSubCategory();
// //     await Future.delayed(Duration(milliseconds: 500));
// //     _refreshController.finishLoad();
// //     _refreshController.closeFooterSecondary();
// //     _refreshController.resetFooter();
// //   }

// //   void _getCurrentIndex() {
// //     for (int i = 0; i < widget.subCategoryList.length; i++) {
// //       if (widget.subCategoryList[i].id == widget.selectedSubCategoryId) {
// //         setState(() {
// //           _selectedSubCategoryIndex = i;
// //         });

// //         WidgetsBinding.instance.addPostFrameCallback((_) {
// //           _scrollToIndex(_selectedSubCategoryIndex);
// //         });
// //       }
// //     }
// //   }

// //   void _scrollToIndex(int index) {
// //     // _scrollControllerForCategoryList.jumpTo(index*1); // Adjust as per your item size
// //     // Or, if you want to animate to the position
// //     _scrollControllerForCategoryList.animateTo(
// //       index * 80,
// //       duration: Duration(seconds: 1),
// //       curve: Curves.easeInOut,
// //     );
// //   }

// //   void _scrollToFirst() {
// //     _scrollController.jumpTo(0);
// //   }

// //   // Widget _indicator(SubCategory _subCategory, {bool header = false}) {
// //   //   final title = [
// //   //     // SizedBox(height: 4),
// //   //     Text(
// //   //       _subCategory.nameEn ?? "-",
// //   //       style: Theme.of(context).textTheme.caption?.copyWith(
// //   //             fontSize: 10,
// //   //             fontWeight: FontWeight.w600,
// //   //             color: Theme.of(context).colorScheme.onBackground,
// //   //           ),
// //   //       maxLines: 2,
// //   //       overflow: TextOverflow.fade,
// //   //       textAlign: TextAlign.center,
// //   //     ),
// //   //     // SizedBox(height: 4),
// //   //   ];

// //   //   return Column(
// //   //     mainAxisSize: MainAxisSize.min,
// //   //     children: [
// //   //       if (!header) ...[
// //   //         Icon(
// //   //           Icons.keyboard_double_arrow_up_rounded,
// //   //           color: Theme.of(context).colorScheme.onBackground,
// //   //         ),
// //   //         ...title,
// //   //       ],
// //   //       CircleAvatar(
// //   //         backgroundColor: Color(0xFFF5F5F5),
// //   //         // radius: 24,
// //   //         radius: 14,
// //   //         child: CustomNetworkImage(
// //   //           urlList: [StringModifiers.toUrl(_subCategory.thumbnail ?? "")],
// //   //           fit: BoxFit.contain,
// //   //           rounded: true,
// //   //           imageAsset: ThemeAssets.logo,
// //   //           opacity: 0.5,
// //   //           placeHolderFit: BoxFit.contain,
// //   //           placeHolderPadding: const EdgeInsets.all(4.0),
// //   //         ),
// //   //       ),
// //   //       if (header) ...[
// //   //         ...title,
// //   //       ],
// //   //     ],
// //   //   );
// //  // }
// // }

// import 'package:easy_refresh/easy_refresh.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../../../base_module/data/entity/models/sort_input.dart';
// import '../../../../base_module/domain/entity/color_scheme.dart';
// import '../../../../base_module/presentation/core/values/app_constants.dart';
// import '../../../../catalogue_module/domain/models/category_model.dart';
// import '../../../../catalogue_module/domain/models/product_status.dart';

// import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_bloc.dart';
// import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_event.dart';
// import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_state.dart';
// import '../../../../new_cart_module/domain/new_cart_model.dart';
// import '../../../components/home_product_card.dart';
// import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
// import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_event.dart';
// import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_state.dart';
// import '../../../../user_module/domain/user_data.dart';

// import '../../../../../base_module/domain/entity/translation.dart';
// import '../../../../catalogue_module/domain/models/item_sort.dart';

// class SearchPage extends StatefulWidget {
//   final List<SubCategory> subCategoryList;
//   final bool isSearchEnabled;
//   final String? selectedSubCategoryId;
//   final String? categoryId;

//   const SearchPage({
//     Key? key,
//     required this.subCategoryList,
//     required this.isSearchEnabled,
//     this.selectedSubCategoryId,
//     this.categoryId,
//   });

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _search = TextEditingController();
//   String _selectedSubcategoryId = '';

//   // final SearchHelper _searchHelper = SearchHelper();
//   List<SubCategory> _subCategoryList = [
//     SubCategory(id: "all", nameEn: "all",)
//   ];
//   int _selectedIndex = 0;
//   int _selectedIndexSort = 0;
//   int _selectedIndexBrand = 0;
//   String _selectedBrandId = '';
//   int _selectedSubCategoryIndex = 0;
//   // List<Product> _productList = [];
//   // List<Brand> _brand = [
//   //   Brand(
//   //     id: "",
//   //     name: "all",
     
//   //   )
//   // ];

//  // List<Brand> _brandItems = [];

//   List<ItemSort> _itemSort = [
//     ItemSort(id: "all", nameEn: "all",),
//     ItemSort(
//         id: "Asc",
//         nameEn: "Price : Low to high",
//         ),
//     ItemSort(
//         id: "Desc",
//         nameEn: "Price : Low to high",
//         ),
//   ];

//   // List<String> _itemsBrand = [
//   //   "All ",
//   //   "Pepsico",
//   //   "Coca Cola",
//   //   "King fisher",
//   // ];

//   List<Cart> _cartList = [];
//   bool _enableSearch = false;
//   final _searchController = TextEditingController();
//   final _scrollController = ScrollController();
//   final _scrollControllerForCategoryList = ScrollController();
//   final _refreshController = EasyRefreshController(
//     controlFinishRefresh: true,
//     controlFinishLoad: true,
//   );
//   SortType? sortType;

//   //
//   // SubCategory? get _selectedSubcategory {
//   //   if (_selectedSubCategoryIndex >= 0 &&
//   //       _selectedSubCategoryIndex < widget.subCategoryList.length) {
//   //     return widget.subCategoryList[_selectedSubCategoryIndex];
//   //   }
//   //
//   //   return null;
//   // }

//   // String get _selectedSubcategoryId => _selectedSubcategory?.id ?? "";
//   //
//   // SubCategory? get _nextSubcategory {
//   //   final index = _selectedSubCategoryIndex + 1;
//   //   if (index < widget.subCategoryList.length) {
//   //     return widget.subCategoryList[index];
//   //   }
//   //
//   //   return null;
//   // }
//   //
//   // SubCategory? get _previousSubcategory {
//   //   final index = _selectedSubCategoryIndex - 1;
//   //   if (index >= 0) {
//   //     return widget.subCategoryList[index];
//   //   }
//   //
//   //   return null;
//   // }

//   // bool get _canRefresh => _previousSubcategory != null;
//   //
//   // bool get _canLoad => _nextSubcategory != null;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentIndex();

//     _subCategoryList.addAll(widget.subCategoryList);
//     BlocProvider.of<NewCartBloc>(context).add(
//       FetchCartItems(pincode: userData.pinCode),
//     );

//     _fetchData(isFromSubCategory: false);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _refreshController.dispose();
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColorScheme.surfaceColorLight,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: BlocListener<NewCartBloc, NewCartState>(
//             listener: (context, state) {
//               if (state is CartLoaded) {
//                 setState(() {
//                   _cartList = state.cartList ?? [];
//                 });
//               }
//             },
//             child: Container(
//               // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _appBar(),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   _tabItems(),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: AppConstants.defaultPadding / 2,
//                         vertical: AppConstants.defaultPadding / 2),
//                     child:

//                         // BlocBuilder<NewCartBloc, NewCartState>(
//                         //   builder: (context, state) {
//                         //     List<Cart> cartList = [];

//                         // return

//                         BlocBuilder<SubcategoryItemsBloc,
//                             SubcategoryItemsState>(
//                       builder: (context, state) {
//                         if (state is SubcategoryItemsLoading) {
//                           // return _categoryScreen();
//                           return Center(child: CircularProgressIndicator());

//                           // SubCategoryScreen(isSearchEnabled: false,
//                           // subCategoryList:widget.subCategoryList,
//                           // selectedSubCategoryId:widget.selectedSubCategoryId
//                           // );
//                           // Expanded(
//                           //   child: GridView.builder(
//                           //     padding: EdgeInsets.all(8.0),
//                           //     shrinkWrap: true,
//                           //     //physics: NeverScrollableScrollPhysics(),
//                           //     gridDelegate:
//                           //         SliverGridDelegateWithMaxCrossAxisExtent(
//                           //       maxCrossAxisExtent: 240,
//                           //       // childAspectRatio: 160 / 240,
//                           //       childAspectRatio: 136 / 240,
//                           //       crossAxisSpacing: 8.0,
//                           //       mainAxisSpacing: 8.0,
//                           //     ),
//                           //     itemCount: 10,
//                           //     itemBuilder: (context, index) {
//                           //       return Container(
//                           //         decoration: BoxDecoration(
//                           //           borderRadius: BorderRadius.circular(11.0),
//                           //         ),
//                           //         child: ClipRRect(
//                           //           borderRadius: BorderRadius.circular(11.0),
//                           //           child: Shimmer.fromColors(
//                           //             baseColor: Colors.grey.shade300,
//                           //             highlightColor:
//                           //                 AppColorScheme.onPrimaryLight.withOpacity(0.6),
//                           //             period: Duration(seconds: 5),
//                           //             child: Container(
//                           //               color: Colors.yellow,
//                           //             ),
//                           //           ),
//                           //         ),
//                           //       );
//                           //     },
//                           //   ),
//                           // );
//                         } else if (state is SubcategoryItemsLoaded) {
//                           final products = state.products;
//                           // _productList.clear();
//                           // _productList.addAll(products);
//                           // _brandItems.clear();
//                           // for (int p = 0; p < _productList.length; p++) {
//                           //   _brandItems.forEach((element) {
//                           //     if (element.id != _productList[p].brand?.id) {
//                           //       Future.delayed(
//                           //         Duration(microseconds: 50),
//                           //         () {
//                           //           _brandItems.add(_productList[p].brand!);
//                           //         },
//                           //       );
//                           //     }
//                           //   });
//                           // }
//                           // _brand.addAll(_brandItems);



//                           // for (int p = 0; p < products.length; p++) {
//                           //   _brand.forEach((element) {
//                           //     if (element.id != state.products[p].brand?.id) {
//                           //       _brand.add(products[p].brand!);
//                           //     }
//                           //   });
//                           // }

//                           return
//                               // Expanded(
//                               // child:
//                               ListView(
//                             shrinkWrap: true,
//                             padding: EdgeInsets.all(8.0),
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12.0),
//                                 ),
//                               ),
//                               GridView.builder(
//                                 shrinkWrap: true,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 gridDelegate:
//                                     SliverGridDelegateWithMaxCrossAxisExtent(
//                                         maxCrossAxisExtent: 240,
//                                         crossAxisSpacing: 8.0,
//                                         mainAxisSpacing: 8.0,
//                                         mainAxisExtent: 272
//                                         //258
//                                         ),
//                                 itemCount: state.products.length,
//                                 itemBuilder: (context, index) {
//                                   final product = state.products[index];
//                                   int itemQuantity = 1;
//                                   bool isInCart = false;
//                                   bool isInStock = false;
//                                   product.variants?.forEach((element) {
//                                     if (element.status ==
//                                         ProductStatus.IN_STOCK.name) {
//                                       isInStock = true;
//                                     } else {
//                                       // isInStock = false;
//                                     }
//                                   });

//                                   final cartItem = _cartList.firstWhere(
//                                     (element) =>
//                                         element.product?.id == product.id,
//                                     orElse: () => Cart(),
//                                   );

//                                   if (cartItem.id != null) {
//                                     isInCart = true;
//                                     itemQuantity = cartItem.quantity ?? 1;
//                                   }
//                                   return HomeProductCard(
//                                     product: product,
//                                     isInStock: isInStock,
//                                     isInCart: isInCart,
//                                     cartItem: cartItem,
//                                     itemQuantity: itemQuantity,
//                                   );
//                                 },
//                               )
//                             ],
//                           );
//                           // );
//                         } else {
//                           return Container(
//                             height: 150,
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 translation
//                                     .of("product_category.product_is_empty"),
//                                 // "No results found for “${_search.text}”",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w500,
//                                     color: Color(0xFF1D1A20).withOpacity(0.50)),
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                     ),

//                     // },
//                     // ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _appBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//           vertical: AppConstants.defaultPadding / 2,
//           horizontal: AppConstants.defaultPadding / 1.5),
//       child: SizedBox(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 width: 36,
//                 height: 36,
//                 decoration: ShapeDecoration(
//                   color: Color(0xFFF7EDFF),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Icon(Iconsax.arrow_left, color: AppColorScheme.onBlack),
//               ),
//             ),
//             _searchBar(),
//             Container(
//               width: 36,
//               height: 36,
//               decoration: ShapeDecoration(
//                 color: Color(0xFFF7EDFF),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: InkWell(
//                   onTap: () {
//                     _showFilterProducts();
//                   },
//                   child: Icon(Iconsax.candle_2, size: 18)),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _tabItems() {
//     return SizedBox(
//       height: 38,
//       child: ListView.builder(
//         padding:
//             EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding / 2),
//         controller: _scrollControllerForCategoryList,
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         // physics: BouncingScrollPhysics(),
//         itemCount: _subCategoryList.length,
//         // itemCount: widget.subCategoryList.length,
//         //_items.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(left: 8),
//             child: InkWell(
//               onTap: () {
//                 setState(() {
//                   //selectedIndex = index;
//                   _selectedSubcategoryId = _subCategoryList[index].id!;
//                   _selectedSubCategoryIndex = index;
//                 });
//                 if (index == 0) {
//                   _fetchData(isFromSubCategory: false);
//                 } else {
//                   _fetchData(isFromSubCategory: true);
//                 }
//               },
//               child: Container(
//                 width: 91,
//                 height: 28,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                 decoration: ShapeDecoration(
//                   color: _selectedSubCategoryIndex == index
//                       ? AppColorScheme.primaryColor
//                       : Color(0xFFF7EDFF),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6)),
//                 ),
//                 child: Center(
//                   child: Text(
                   
//  '${_subCategoryList[index].nameEn ?? ""}',
//                     style: TextStyle(
//                       color: _selectedSubCategoryIndex == index
//                           ? AppColorScheme.onPrimaryLight
//                           : Color(0xFF1D1A20),
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // Future<void> _reFetchContent() async {
//   //   await _searchHelper._reFetchContent(_search.text);
//   // }

//   void _showFilterProducts() {
//     showModalBottomSheet(
//         context: context,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//               top: Radius.circular(AppConstants.cornerRadius)),
//         ),
//         builder: (
//           context,
//         ) {
//           return StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState1) {
//             // _brandItems.clear();
//             // for (int p = 0; p < _productList.length; p++) {
//             //   _brandItems.forEach((element) {
//             //     if (element.id != _productList[p].brand?.id) {
//             //       Future.delayed(
//             //         Duration(microseconds: 50),
//             //         () {
//             //           _brandItems.add(_productList[p].brand!);
//             //         },
//             //       );
//             //     }
//             //   });
//             // }
//           //  _brand.addAll(_brandItems);
//             return Container(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: Icon(
//                             Iconsax.arrow_left,
//                             size: 18,
//                           )),
//                       Text(
//                         translation.of('product_category.filter_products'),
//                         style: TextStyle(
//                           color: Color(0xFF1D1B1E),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       )
//                     ],
//                   ),
//                   Divider(
//                     thickness: 1,
//                   ),
//                   Text(
//                     translation.of('product_category.sub_category'),
//                     style: TextStyle(
//                       color: Color(0xFF1D1A20),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 38,
//                     child: ListView.builder(
//                       // controller:
//                       // _scrollControllerForCategoryList,
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       // physics: BouncingScrollPhysics(),
//                       // itemCount: widget.subCategoryList.length,
//                       itemCount: _subCategoryList.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(left: 8),
//                           child: InkWell(
//                             onTap: () {
//                               setState1(() {
//                                 _selectedSubCategoryIndex = index;
//                               });
//                               setState(() {});
//                             },
//                             child: Container(
//                               // width: 91,
//                               height: 28,
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 12, vertical: 10),
//                               decoration: ShapeDecoration(
//                                 color: _selectedSubCategoryIndex == index
//                                     ? AppColorScheme.primaryColor
//                                     : Color(0xFFF7EDFF),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(6)),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                    '${_subCategoryList[index].nameEn}',
//                                   // _subCategoryList[index].nameEn ?? "",
//                                   // widget.subCategoryList[index].nameEn!,
//                                   //_items[index],
//                                   style: TextStyle(
//                                     color: _selectedSubCategoryIndex == index
//                                         ? AppColorScheme.onPrimaryLight
//                                         : Color(0xFF1D1A20),
//                                     fontSize: 12,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     translation.of('product_category.sort_by'),
//                     style: TextStyle(
//                       color: Color(0xFF1D1A20),
//                       fontSize: 16,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 38,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       physics: BouncingScrollPhysics(),
//                       itemCount: _itemSort.length,
//                       itemBuilder: (context, index) {
//                         String? sortName = _itemSort[index].nameEn ?? "";
//                         return Padding(
//                           padding: const EdgeInsets.only(left: 8),
//                           child: InkWell(
//                             onTap: () {
//                               setState1(() {
//                                 _selectedIndexSort = index;
//                               });
//                               if (_selectedIndexSort == 1) {
//                                 setState1(() {
//                                   sortType = SortType.Asc;
//                                 });
//                               } else if (_selectedIndexSort == 2) {
//                                 setState1(() {
//                                   sortType = SortType.Desc;
//                                 });
//                               } else {
//                                 setState1(() {
//                                   sortType = null;
//                                 });
//                               }
//                             },
//                             child: Container(
//                               // width: 91,
//                               height: 28,
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 12, vertical: 10),
//                               decoration: ShapeDecoration(
//                                 color: _selectedIndexSort == index
//                                     ? AppColorScheme.primaryColor
//                                     : Color(0xFFF7EDFF),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(6)),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   sortName ?? '',
//                                   // _itemSortBy[index],
//                                   style: TextStyle(
//                                     color: _selectedIndexSort == index
//                                         ? AppColorScheme.onPrimaryLight
//                                         : Color(0xFF1D1A20),
//                                     fontSize: 12,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Text(
//                     translation.of('product_category.brand'),
//                     style: TextStyle(
//                       color: Color(0xFF1D1A20),
//                       fontSize: 16,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 38,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       physics: BouncingScrollPhysics(),
//                       // itemCount: _itemsBrand.length,
//                       itemCount: 1,
//                       //_brand.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(left: 8),
//                           child: InkWell(
//                             onTap: () {
//                               setState1(() {
//                                 _selectedIndexBrand = index;
//                                 //_selectedBrandId = _brand[index].id ?? '';
//                               });
//                             },
//                             child: Container(
//                               // width: 91,
//                               height: 28,
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 12, vertical: 10),
//                               decoration: ShapeDecoration(
//                                 color: _selectedIndexBrand == index
//                                     ? AppColorScheme.primaryColor
//                                     : Color(0xFFF7EDFF),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(6)),
//                               ),
//                               child: Center(
//                                 child: Text("",
//                                  // _brand[index].name ?? "",
//                                   // _itemsBrand[index],
//                                   style: TextStyle(
//                                     color: _selectedIndexBrand == index
//                                         ? AppColorScheme.onPrimaryLight
//                                         : Color(0xFF1D1A20),
//                                     fontSize: 12,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Divider(
//                     thickness: 1,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           _fetchData(isFromSubCategory: false);
//                         },
//                         child: Text(
//                           translation.of('product_category.reset_filter'),
//                           style: TextStyle(
//                             color: AppColorScheme.primaryColor,
//                             fontSize:  12 ,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         style: Theme.of(context)
//                             .elevatedButtonTheme
//                             .style
//                             ?.copyWith(
//                               padding: MaterialStateProperty.all(
//                                 const EdgeInsets.symmetric(
//                                     horizontal: 25, vertical: 15),
//                               ),
//                               backgroundColor: MaterialStateProperty.all(
//                                 Color(0xFFF7F2FA),
//                               ),
//                             ),
//                       ),
//                       OutlinedButton(
//                         onPressed: () {
//                           _filterData(isFromSubCategory: false);
//                           setState1(() {});
//                           Navigator.pop(context);
//                         },
//                         child: Text(
//                           translation.of('product_category.apply_filter'),
//                           style: TextStyle(
//                             color: AppColorScheme.onPrimaryLight,
//                             fontSize: 12 ,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         style: Theme.of(context)
//                             .elevatedButtonTheme
//                             .style
//                             ?.copyWith(
//                               padding: MaterialStateProperty.all(
//                                 const EdgeInsets.symmetric(
//                                     horizontal: 25, vertical: 15),
//                               ),
//                               side: MaterialStateProperty.all(
//                                 BorderSide(
//                                   color: AppColorScheme.primaryColor,
//                                 ),
//                               ),
//                             ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );

//             // return FilterBottomSheet(
//             //   searchText: _search.text,
//             //   sortType: sortType,
//             //   brand: _brand,
//             //   itemSort: _itemSort,
//             //   selectedBrandId: _selectedBrandId,
//             //   selectedIndexBrand: _selectedIndexBrand,
//             //   selectedIndexSort: _selectedIndexSort,
//             //   selectedSubCategoryIndex: _selectedSubCategoryIndex,
//             //   subCategoryList: _subCategoryList,
//           });

//           // });
//         });
//   }

//   Widget _searchBar() {
//     return Container(
//       width: 254,
//       height: 36,
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//           offset: const Offset(12, 26),
//           blurRadius: 50,
//           spreadRadius: 0,
//           color: Colors.grey.withOpacity(.1),
//         ),
//       ]),
//       child: TextField(
//         controller: _search,
//         onChanged: (val) {
//           if (_selectedSubCategoryIndex == 0) {
//             _fetchData(isFromSubCategory: false);
//           } else {
//             _fetchData(isFromSubCategory: true);
//           }
//         },
//         // onChanged: _searchHelper.search,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.search,
//             color: Color.fromARGB(255, 151, 150, 151),
//           ),
//           filled: true,
//           fillColor: Color(0xFFF7EDFF),
//           hintText: translation.of('product_category.search'),
//           hintStyle: const TextStyle(color: Colors.grey),
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//           border: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(15.0)),
//           ),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFFF7EDFF), width: 1.0),
//             borderRadius: BorderRadius.all(Radius.circular(15.0)),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFFF7EDFF), width: 2.0),
//             borderRadius: BorderRadius.all(Radius.circular(15.0)),
//           ),
//         ),
//       ),
//     );
//   }

//   void _fetchData({required bool isFromSubCategory}) {
//     BlocProvider.of<SubcategoryItemsBloc>(context).add(
//       FetchProductsBySubcategory(
//           searchKey: _search.text,
//           subcategoryId: _selectedSubcategoryId,
//           pincode: userData.pinCode,
//           isFromSubCategory: isFromSubCategory,
//           categoryId: widget.categoryId),
//     );
//   }

//   void _filterData({required bool isFromSubCategory}) {
//     BlocProvider.of<SubcategoryItemsBloc>(context).add(
//       FetchProductsBySubcategory(
//         isFilter: true,
//         brand: _selectedBrandId,
//         sortType: sortType,
//         searchKey: _search.text,
//         subcategoryId: _selectedSubcategoryId,
//         pincode: userData.pinCode,
//         isFromSubCategory: isFromSubCategory,
//         categoryId: widget.categoryId,
//       ),
//     );
//   }

//   bool _changeSubCategory([bool reverse = true]) {
//     int index = _selectedSubCategoryIndex;
//     bool canFetch = false;

//     if (reverse) {
//       if (index + 1 < widget.subCategoryList.length) {
//         index += 1;
//         canFetch = true;
//       }
//     } else {
//       if (index - 1 >= 0) {
//         index -= 1;
//         canFetch = true;
//       }
//     }

//     if (canFetch) {
//       setState(() {
//         _selectedSubCategoryIndex = index;
//       });

//       _fetchData(isFromSubCategory: false);
//       return true;
//     }

//     return false;
//   }

//   void _getCurrentIndex() {
//     for (int i = 0; i < widget.subCategoryList.length; i++) {
//       if (widget.subCategoryList[i].id == widget.selectedSubCategoryId) {
//         setState(() {
//           _selectedSubCategoryIndex = i;
//         });

//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           _scrollToIndex(_selectedSubCategoryIndex);
//         });
//       }
//     }
//   }

//   void _scrollToIndex(int index) {
//     // _scrollControllerForCategoryList.jumpTo(index*1); // Adjust as per your item size
//     // Or, if you want to animate to the position
//     _scrollControllerForCategoryList.animateTo(
//       index * 80,
//       duration: Duration(seconds: 1),
//       curve: Curves.easeInOut,
//     );
//   }

//   void _scrollToFirst() {
//     _scrollController.jumpTo(0);
//   }
// }
