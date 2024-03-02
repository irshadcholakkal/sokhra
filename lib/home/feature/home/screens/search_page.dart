// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:lumiereorganics_app/user_module/domain/user_data.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../../../base_module/domain/entity/color_scheme.dart';
// import '../../../../base_module/presentation/core/values/app_constants.dart';
// import '../../../../catalogue_module/domain/models/product.dart';
// import '../../../../catalogue_module/domain/models/product_status.dart';
// import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_bloc.dart';
// import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_event.dart';
// import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_state.dart';
// import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
// import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_state.dart';
// import '../../../components/home_product_card.dart';
// import '../../../../base_module/domain/entity/translation.dart';
// import '../../../../catalogue_module/domain/models/category_model.dart';
// import '../../../../new_cart_module/domain/new_cart_model.dart';
// class SearchHelper {
//   final SubcategoryItemsBloc _subcategoryItemsBloc = SubcategoryItemsBloc();
//   Timer? _timer;
//   String _lastQuery = '';
//   void search(String query) {
//     if (query != _lastQuery) {
//       _lastQuery = query;
//       _subcategoryItemsBloc.add(ClearProductsBySubcategory());
//       _timer?.cancel();
//       _timer = Timer(const Duration(milliseconds: 350), () {
//         if (query.isNotEmpty) {
//           _reFetchContent(query);
//         }
//         _timer?.cancel();
//       });
//     }
//   }
//   Future<void> _reFetchContent(String query) async {
//     if (_subcategoryItemsBloc.state is! SubcategoryItemsLoading) {
//       _subcategoryItemsBloc.add(FetchProductsBySubcategory(
//         searchKey: query,
//         pincode: userData.pinCode,
//       ));
//     }
//     await Future.delayed(const Duration(milliseconds: 500));
//   }
// }
// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _search = TextEditingController();
//   final SearchHelper _searchHelper = SearchHelper();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColorScheme.surfaceColorLight,
//       body: SafeArea(
//         child: RefreshIndicator(
//           onRefresh: _reFetchContent,
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             child: Column(
//               children: [
//                 _appBar(),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 _tabItems(),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 BlocBuilder<NewCartBloc, NewCartState>(
//                   builder: (context, state) {
//                     List<Cart> cartList = [];
//                     return BlocBuilder<SubcategoryItemsBloc,
//                         SubcategoryItemsState>(
//                       bloc: _searchHelper._subcategoryItemsBloc,
//                       builder: (context, state) {
//                         if (state is SubcategoryItemsLoading) {
//                           return Expanded(
//                             child: GridView.builder(
//                               padding: EdgeInsets.all(8.0),
//                               shrinkWrap: true,
//                               //physics: NeverScrollableScrollPhysics(),
//                               gridDelegate:
//                                   SliverGridDelegateWithMaxCrossAxisExtent(
//                                 maxCrossAxisExtent: 240,
//                                 // childAspectRatio: 160 / 240,
//                                 childAspectRatio: 136 / 240,
//                                 crossAxisSpacing: 8.0,
//                                 mainAxisSpacing: 8.0,
//                               ),
//                               itemCount: 10,
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(11.0),
//                                   ),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(11.0),
//                                     child: Shimmer.fromColors(
//                                       baseColor: Colors.grey.shade300,
//                                       highlightColor:
//                                           AppColorScheme.onPrimaryLight.withOpacity(0.6),
//                                       period: Duration(seconds: 5),
//                                       child: Container(
//                                         color: Colors.yellow,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           );
//                         } else if (state is SubcategoryItemsLoaded) {
//                           return Expanded(
//                             child: ListView(
//                               shrinkWrap: true,
//                               padding: EdgeInsets.all(8.0),
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12.0),
//                                   ),
//                                 ),
//                                 GridView.builder(
//                                   shrinkWrap: true,
//                                   physics: NeverScrollableScrollPhysics(),
//                                   gridDelegate:
//                                        SliverGridDelegateWithMaxCrossAxisExtent(
//                                           maxCrossAxisExtent: 240,
//                                            crossAxisSpacing: 8.0,
//                                           mainAxisSpacing: 8.0,
//                                          mainAxisExtent:270
//                                           //258
//                                           ),
//                                   itemCount: state.products.length,
//                                   itemBuilder: (context, index) {
//                                     final product = state.products[index];
//                                     int itemQuantity = 1;
//                                     bool isInCart = false;
//                                     final isInStock = product.status ==
//                                         ProductStatus.IN_STOCK.name;
//                                     final cartItem = cartList.firstWhere(
//                                       (element) =>
//                                           element.product?.id == product.id,
//                                       orElse: () => Cart(),
//                                     );
//                                     if (cartItem.id != null) {
//                                       isInCart = true;
//                                       itemQuantity = cartItem.quantity ?? 1;
//                                     }
//                                     return HomeProductCard(
//                                       product: product,
//                                       isInStock: isInStock,
//                                       isInCart: isInCart,
//                                       cartItem: cartItem,
//                                       itemQuantity: itemQuantity,
//                                     );
//                                   },
//                                 )
//                               ],
//                             ),
//                           );
//                         } else {
//                           return Container(
//                             child: Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 "No results found for “${_search.text}”",
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
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
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
//         onChanged: _searchHelper.search,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.search,
//             color: Color.fromARGB(255, 151, 150, 151),
//           ),
//           filled: true,
//           fillColor: Color(0xFFF7EDFF),
//           hintText: 'Search',
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
//   Widget _appBar() {
//     return SizedBox(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               width: 36,
//               height: 36,
//               decoration: ShapeDecoration(
//                 color: Color(0xFFF7EDFF),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Icon(Iconsax.arrow_left, color: AppColorScheme.onBlack),
//             ),
//           ),
//           _searchBar(),
//           Container(
//             width: 36,
//             height: 36,
//             decoration: ShapeDecoration(
//               color: Color(0xFFF7EDFF),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: InkWell(
//                 onTap: () {
//                   _showFilterProducts();
//                 },
//                 child: Icon(Iconsax.candle_2, size: 18)),
//           )
//         ],
//       ),
//     );
//   }
//   Widget _tabItems() {
//     return SizedBox(
//       height: 38,
//       child: ListView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         physics: BouncingScrollPhysics(),
//         itemCount: _items.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(left: 8),
//             child: InkWell(
//               onTap: () {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//               },
//               child: Container(
//                 width: 91,
//                 height: 28,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                 decoration: ShapeDecoration(
//                   color: selectedIndex == index
//                       ? AppColorScheme.primaryColor
//                       : Color(0xFFF7EDFF),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6)),
//                 ),
//                 child: Center(
//                   child: Text(
//                     _items[index],
//                     style: TextStyle(
//                       color: selectedIndex == index
//                           ? AppColorScheme.onPrimaryLight
//                           : Color(0xFF1D1A20),
//                       fontSize: 12,
//                       fontFamily: 'Poppins',
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
//   Future<void> _reFetchContent() async {
//     await _searchHelper._reFetchContent(_search.text);
//   }
//   void _showFilterProducts() {
//     showModalBottomSheet(
//         context: context,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//               top: Radius.circular(AppConstants.cornerRadius)),
//         ),
//         builder: (context) {
//           return BottomSheetFilter();
//         });
//   }
// }
//    int selectedIndex = 0;
//   int selectedIndexSort = 0;
//   int selectedIndexBrand = 0;
// List<String> _items = [
//     "All drinks",
//     "Sugar free",
//     "Soft drinks",
//     "Cool drinks",
//     "Soft drinks",
//   ];
//   List<String> _itemSortBy = [
//     "All ",
//     "Price : Low to high",
//     "Price : High to low",
//   ];
//   List<String> _itemsBrand = [
//     "All ",
//     "Pepsico",
//     "Coca Cola",
//     "King fisher",
//   ];
// class BottomSheetFilter extends StatefulWidget {
//   const BottomSheetFilter({Key? key}) : super(key: key);
//   @override
//   State<BottomSheetFilter> createState() => _BottomSheetFilterState();
// }
// class _BottomSheetFilterState extends State<BottomSheetFilter> {
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: Icon(
//                           Iconsax.arrow_left,
//                           size: 18,
//                         )),
//                     Text(
//                       'Filter products',
//                       style: TextStyle(
//                         color: Color(0xFF1D1B1E),
//                         fontSize: 16,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                       ),
//                     )
//                   ],
//                 ),
//                 Divider(
//                   // height: 0.50,
//                   thickness: 1,
//                 ),
//                 Text(
//                   'Sub category',
//                   style: TextStyle(
//                     color: Color(0xFF1D1A20),
//                     fontSize: 16,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 38,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     physics: BouncingScrollPhysics(),
//                     itemCount: _items.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(left: 8),
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = index;
//                             });
//                           },
//                           child: Container(
//                             // width: 91,
//                             height: 28,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 12, vertical: 10),
//                             decoration: ShapeDecoration(
//                               color: selectedIndex == index
//                                   ? AppColorScheme.primaryColor
//                                   : Color(0xFFF7EDFF),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(6)),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 _items[index],
//                                 style: TextStyle(
//                                   color: selectedIndex == index
//                                       ? AppColorScheme.onPrimaryLight
//                                       : Color(0xFF1D1A20),
//                                   fontSize: 12,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   'Sort by',
//                   style: TextStyle(
//                     color: Color(0xFF1D1A20),
//                     fontSize: 16,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 38,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     physics: BouncingScrollPhysics(),
//                     itemCount: _itemSortBy.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(left: 8),
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               selectedIndexSort = index;
//                             });
//                           },
//                           child: Container(
//                             // width: 91,
//                             height: 28,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 12, vertical: 10),
//                             decoration: ShapeDecoration(
//                               color: selectedIndexSort == index
//                                   ? AppColorScheme.primaryColor
//                                   : Color(0xFFF7EDFF),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(6)),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 _itemSortBy[index],
//                                 style: TextStyle(
//                                   color: selectedIndexSort == index
//                                       ? AppColorScheme.onPrimaryLight
//                                       : Color(0xFF1D1A20),
//                                   fontSize: 12,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Text(
//                   'Brand',
//                   style: TextStyle(
//                     color: Color(0xFF1D1A20),
//                     fontSize: 16,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 38,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     physics: BouncingScrollPhysics(),
//                     itemCount: _itemsBrand.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(left: 8),
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               selectedIndexBrand = index;
//                             });
//                           },
//                           child: Container(
//                             // width: 91,
//                             height: 28,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 12, vertical: 10),
//                             decoration: ShapeDecoration(
//                               color: selectedIndexBrand == index
//                                   ? AppColorScheme.primaryColor
//                                   : Color(0xFFF7EDFF),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(6)),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 _itemsBrand[index],
//                                 style: TextStyle(
//                                   color: selectedIndexBrand == index
//                                       ? AppColorScheme.onPrimaryLight
//                                       : Color(0xFF1D1A20),
//                                   fontSize: 12,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Divider(
//                   thickness: 1,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: Text(
//                         "Reset Filter",
//                         style: TextStyle(
//                           color: AppColorScheme.primaryColor,
//                           fontSize: 16,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       style:
//                           Theme.of(context).elevatedButtonTheme.style?.copyWith(
//                                 padding: MaterialStateProperty.all(
//                                   const EdgeInsets.symmetric(
//                                       horizontal: 25, vertical: 15),
//                                 ),
//                                 backgroundColor: MaterialStateProperty.all(
//                                   Color(0xFFF7F2FA),
//                                 ),
//                               ),
//                     ),
//                     OutlinedButton(
//                       onPressed: () {},
//                       child: Text(
//                         "Apply Filter",
//                         style: TextStyle(
//                           color: AppColorScheme.onPrimaryLight,
//                           fontSize: 16,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       style:
//                           Theme.of(context).elevatedButtonTheme.style?.copyWith(
//                                 padding: MaterialStateProperty.all(
//                                   const EdgeInsets.symmetric(
//                                       horizontal: 25, vertical: 15),
//                                 ),
//                                 side: MaterialStateProperty.all(
//                                   BorderSide(
//                                     color: AppColorScheme.primaryColor,
//                                   ),
//                                 ),
//                               ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//   }
// }

import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/base_module/presentation/component/images/custom_network_image.dart';
import 'package:lumiereorganics_app/base_module/presentation/core/values/app_assets.dart';
import 'package:lumiereorganics_app/base_module/presentation/util/string_modifiers.dart';
import 'package:lumiereorganics_app/catalogue_module/presentation/feature/list_catalogue/screens/sub_category_screen.dart';
import 'package:lumiereorganics_app/home/feature/home/screens/search_page.dart';
import 'package:lumiereorganics_app/new_cart_module/presentation/blocs/new_cart_bloc/new_cart_event.dart';
import 'package:lumiereorganics_app/user_module/domain/user_data.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../base_module/data/entity/models/sort_input.dart';
import '../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../catalogue_module/domain/models/product.dart';
import '../../../../catalogue_module/domain/models/product_status.dart';
import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_bloc.dart';
import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_event.dart';
import '../../../../catalogue_module/presentation/feature/list_catalogue/blocs/subcategory_bloc/subcategory_state.dart';
import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
import '../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_state.dart';
import '../../../components/home_product_card.dart';
import '../../../../base_module/domain/entity/translation.dart';
import '../../../../catalogue_module/domain/models/category_model.dart';
import '../../../../new_cart_module/domain/new_cart_model.dart';

class SearchHelper {
  final SubcategoryItemsBloc _subcategoryItemsBloc = SubcategoryItemsBloc();
  Timer? _timer;
  String _lastQuery = '';
  int _selectedIndexSort = 0;
  int _selectedIndexBrand = 0;

  void search(String query) {
    if (query != _lastQuery) {
      _lastQuery = query;

      _subcategoryItemsBloc.add(ClearProductsBySubcategory());

      _timer?.cancel();

      _timer = Timer(const Duration(milliseconds: 350), () {
        if (query.isNotEmpty) {
          _reFetchContent(query);
        }

        _timer?.cancel();
      });
    }
  }

  void applyFilters(int selectedIndexSort, int selectedIndexBrand) {
    _selectedIndexSort = selectedIndexSort;
    _selectedIndexBrand = selectedIndexBrand;
    _reFetchContent(_lastQuery);
  }

  Future<void> _reFetchContent(String query) async {
    if (_subcategoryItemsBloc.state is! SubcategoryItemsLoading) {
      _subcategoryItemsBloc.add(FetchProductsBySubcategory(
        searchKey: query,
        subcategoryId: subCategoryitem.toString(),
        isFromSubCategory: false,

        // sortBy: _itemSortBy[_selectedIndexSort],
        // brand: _itemsBrand[_selectedIndexBrand],
        pincode: userData.pinCode,
      ));
    }

    await Future.delayed(const Duration(milliseconds: 500));
  }
}

List<SubCategory>? subCategoryitem;

class SearchPage extends StatefulWidget {
  final List<SubCategory> subCategoryList;
  final bool isSearchEnabled;
  final String? selectedSubCategoryId;
  final String? categoryId;

  const SearchPage({
    Key? key,
    required this.subCategoryList,
    required this.isSearchEnabled,
    this.selectedSubCategoryId,
    this.categoryId,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _search = TextEditingController();
  final SearchHelper _searchHelper = SearchHelper();

  int selectedIndex = 0;
  int selectedIndexSort = 0;
  int selectedIndexBrand = 0;
  int _selectedSubCategoryIndex = 0;

  List<String> _itemSortBy = [
    translation.of('search_page.all'),
    translation.of('search_page.low_high'),
    translation.of('search_page.high_low'),
  ];
  List<String> _itemsBrand = [
    "All ",
    "Pepsico",
    "Coca Cola",
    "King fisher",
  ];
  SortType? selectedSortBy;
  List<Cart> _cartList = [];
  bool _enableSearch = false;
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  final _scrollControllerForCategoryList = ScrollController();
  final _refreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  SubCategory? get _selectedSubcategory {
    if (_selectedSubCategoryIndex >= 0 &&
        _selectedSubCategoryIndex < widget.subCategoryList.length) {
      return widget.subCategoryList[_selectedSubCategoryIndex];
    }

    return null;
  }

  String get _selectedSubcategoryId => _selectedSubcategory?.id ?? "";

  SubCategory? get _nextSubcategory {
    final index = _selectedSubCategoryIndex + 1;
    if (index < widget.subCategoryList.length) {
      return widget.subCategoryList[index];
    }

    return null;
  }

  SubCategory? get _previousSubcategory {
    final index = _selectedSubCategoryIndex - 1;
    if (index >= 0) {
      return widget.subCategoryList[index];
    }

    return null;
  }

  bool get _canRefresh => _previousSubcategory != null;

  bool get _canLoad => _nextSubcategory != null;

  @override
  void initState() {
    super.initState();
    _getCurrentIndex();
    // _scrollController.addListener(_onScroll);
    // enableSearch = widget.isSearchEnabled;
    // if (widget.subCategoryList.isNotEmpty) {
    //   _selectedSubcategory = widget.subCategoryList.first;
    //   _selectedSubcategoryId = widget.subCategoryList.first.id!;
    // }

    BlocProvider.of<NewCartBloc>(context).add(
      FetchCartItems(pincode: userData.pinCode),
    );

    _fetchData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.surfaceColorLight,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _reFetchContent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                _appBar(),
                SizedBox(
                  height: AppConstants.defaultPadding,
                ),
                _tabItems(),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<NewCartBloc, NewCartState>(
                  builder: (context, state) {
                    List<Cart> cartList = [];

                    return BlocBuilder<SubcategoryItemsBloc,
                        SubcategoryItemsState>(
                      bloc: _searchHelper._subcategoryItemsBloc,
                      builder: (context, state) {
                        if (state is SubcategoryItemsLoading) {
                          return _categoryScreen();

                          // SubCategoryScreen(isSearchEnabled: false,
                          // subCategoryList:widget.subCategoryList,
                          // selectedSubCategoryId:widget.selectedSubCategoryId
                          // );
                          // Expanded(
                          //   child: GridView.builder(
                          //     padding: EdgeInsets.all(8.0),
                          //     shrinkWrap: true,
                          //     //physics: NeverScrollableScrollPhysics(),
                          //     gridDelegate:
                          //         SliverGridDelegateWithMaxCrossAxisExtent(
                          //       maxCrossAxisExtent: 240,
                          //       // childAspectRatio: 160 / 240,
                          //       childAspectRatio: 136 / 240,
                          //       crossAxisSpacing: 8.0,
                          //       mainAxisSpacing: 8.0,
                          //     ),
                          //     itemCount: 10,
                          //     itemBuilder: (context, index) {
                          //       return Container(
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(11.0),
                          //         ),
                          //         child: ClipRRect(
                          //           borderRadius: BorderRadius.circular(11.0),
                          //           child: Shimmer.fromColors(
                          //             baseColor: Colors.grey.shade300,
                          //             highlightColor:
                          //                 AppColorScheme.onPrimaryLight.withOpacity(0.6),
                          //             period: Duration(seconds: 5),
                          //             child: Container(
                          //               color: Colors.yellow,
                          //             ),
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // );
                        } else if (state is SubcategoryItemsLoaded) {
                          return Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.all(8.0),
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 240,
                                          crossAxisSpacing: 8.0,
                                          mainAxisSpacing: 8.0,
                                          mainAxisExtent: 270
                                          //258
                                          ),
                                  itemCount: state.products.length,
                                  itemBuilder: (context, index) {
                                    final product = state.products[index];
                                    int itemQuantity = 1;
                                    bool isInCart = false;
                                    final isInStock =
                                        product.variants?[index].status ==
                                            ProductStatus.IN_STOCK.name;

                                    final cartItem = cartList.firstWhere(
                                      (element) =>
                                          element.product?.id == product.id,
                                      orElse: () => Cart(),
                                    );

                                    if (cartItem.id != null) {
                                      isInCart = true;
                                      itemQuantity = cartItem.quantity ?? 1;
                                    }
                                    return HomeProductCard(
                                      product: product,
                                      isInStock: isInStock,
                                      isInCart: isInCart,
                                      cartItem: cartItem,
                                      itemQuantity: itemQuantity,
                                    );
                                  },
                                )
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "No results found for “${_search.text}”",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColorScheme.onBlack
                                            .withOpacity(0.50)),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryScreen() {
    return BlocListener<NewCartBloc, NewCartState>(
        listener: (context, state) {
          if (state is CartLoaded) {
            setState(() {
              _cartList = state.cartList ?? [];
            });
          }
        },
        child: Expanded(
          // flex: 4,
          child: EasyRefresh(
            controller: _refreshController,
            onRefresh: () {
              if (_canRefresh) _onRefresh();
            },
            // onLoad: () {
            //   if (_canLoad) _onLoad();
            // },
            // canLoadAfterNoMore: _canRefresh,
            // canRefreshAfterNoMore: _canLoad,
            // refreshOnStart: false,
            // header: ClassicHeader(
            //   showText: false,
            //   triggerWhenRelease: false,
            //   triggerWhenReach: false,
            //   triggerOffset: _canLoad ? 42 : 0,
            //   // triggerOffset: _canLoad?120:0,
            //   iconDimension: MediaQuery.of(context).size.width / 2,
            //   pullIconBuilder: (context, state, animation) {
            //     if (_canRefresh &&
            //         _previousSubcategory != null &&
            //         ![
            //           IndicatorMode.inactive,
            //           IndicatorMode.done,
            //           IndicatorMode.processed,
            //           IndicatorMode.processing,
            //         ].contains(state.mode)) {
            //       return _indicator(_previousSubcategory!, header: true);
            //     }

            //     return SizedBox();
            //   },
            // ),
            // footer: ClassicFooter(
            //   showText: false,
            //   // triggerOffset: _canLoad ? 120 : 0,
            //   triggerOffset: _canLoad ? 42 : 0,
            //   iconDimension: MediaQuery.of(context).size.width / 2,
            //   infiniteOffset: 42,
            //   // infiniteOffset: 0,
            //   pullIconBuilder: (context, state, animation) {
            //     if (_canLoad &&
            //         _nextSubcategory != null &&
            //         ![
            //           IndicatorMode.inactive,
            //           IndicatorMode.done,
            //           IndicatorMode.processed,
            //           IndicatorMode.processing,
            //         ].contains(state.mode)) {
            //       return _indicator(_nextSubcategory!);
            //     }

            //     return SizedBox();
            //   },
            // ),
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(AppConstants.defaultPadding * 0.4),
              child: BlocConsumer<SubcategoryItemsBloc, SubcategoryItemsState>(
                listener: (context, state) {
                  if (state is SubcategoryItemsLoaded) {
                    _scrollToFirst();
                  }
                },
                builder: (context, state) {
                  if (state is SubcategoryItemsLoading) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.all(AppConstants.defaultPadding * 0.4),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 240,
                        childAspectRatio: 136 / 240,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(11.0),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: AppColorScheme.onPrimaryLight
                                  .withOpacity(0.6),
                              period: Duration(seconds: 5),
                              child: Container(color: Colors.grey.shade300),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is SubcategoryItemsLoaded) {
                    return Container(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 110,
                      ),
                      child: Column(
                        children: [
                          //  if (_selectedSubcategory?.avatar?.isNotEmpty ==
                          //      true) ...[
                          //    CustomNetworkImage(
                          //      height: 174,
                          //      width: double.infinity,
                          //      urlList: [
                          //        StringModifiers.toUrl(
                          //          _selectedSubcategory?.avatar ?? "",
                          //        )
                          //      ],
                          //      border: Border.all(
                          //        color:
                          //            AppColorScheme.productCardBorderColor,
                          //      ),
                          //      // fit: BoxFit.contain,
                          //      borderRadius: AppConstants.cornerRadius,
                          //      imageAsset: ThemeAssets.dummy_image_wider,
                          //      placeHolderFit: BoxFit.contain,
                          //      placeHolderPadding: EdgeInsets.all(12),
                          //      opacity: 0.5,
                          //    ),
                          //    SizedBox(height: 8),
                          //  ],
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 240,
                              childAspectRatio: 136 / 240,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              mainAxisExtent: 245,
                              //227,
                            ),
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              final product = state.products[index];

                              int itemQuantity = 1;
                              bool isInCart = false;
                              final isInStock =
                                  product.variants?.first?.status ==
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
                                product: product,
                                isInStock: isInStock,
                                isInCart: isInCart,
                                cartItem: cartItem,
                                itemQuantity: itemQuantity,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "${translation.of('search_page.no_results_found')}“${_search.text}”",
                          //"No results found for “${_search.text}”",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1D1A20).withOpacity(0.50)),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ));
  }

  Widget _searchBar() {
    return Container(
      width: 254,
      height: 36,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(12, 26),
          blurRadius: 50,
          spreadRadius: 0,
          color: Colors.grey.withOpacity(.1),
        ),
      ]),
      child: TextField(
        controller: _search,
        onChanged: _searchHelper.search,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 151, 150, 151),
          ),
          filled: true,
          fillColor: Color(0xFFF7EDFF),
          hintText: translation.of('search_page.search'),
          //'Search',
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF7EDFF), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF7EDFF), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 36,
              height: 36,
              decoration: ShapeDecoration(
                color: Color(0xFFF7EDFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Icon(Iconsax.arrow_left, color: AppColorScheme.onBlack),
            ),
          ),
          _searchBar(),
          Container(
            width: 36,
            height: 36,
            decoration: ShapeDecoration(
              color: Color(0xFFF7EDFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: InkWell(
                onTap: () {
                  _showFilterProducts();
                },
                child: Icon(Iconsax.candle_2, size: 18)),
          )
        ],
      ),
    );
  }

  Widget _tabItems() {
    List<SubCategory> subCategoryListWithAll = [
          SubCategory(nameEn: 'All', nameAr: 'الجميع', nameFr: "toute")
        ] +
        widget.subCategoryList;

    return SizedBox(
      height: 38,
      child: ListView.builder(
        controller: _scrollControllerForCategoryList,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: subCategoryListWithAll.length,
        //widget.subCategoryList.length,
        //_items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
              onTap: () {
                setState(() {
                  //selectedIndex = index;
                  _selectedSubCategoryIndex = index;
                });
                _fetchData();
              },
              child: Container(
                //width: 91,
                height: 28,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: ShapeDecoration(
                  color: _selectedSubCategoryIndex == index
                      ? AppColorScheme.primaryColor
                      : Color(0xFFF7EDFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Center(
                  child: Text(
                    translation.isArabic
                        ? subCategoryListWithAll[index].nameAr ??
                            subCategoryListWithAll[index].nameEn!
                        : translation.isFrench
                            ? subCategoryListWithAll[index].nameFr ??
                                subCategoryListWithAll[index].nameEn!
                            : subCategoryListWithAll[index].nameEn!,
                    // widget.subCategoryList[index].nameEn!,
                    //_items[index],
                    style: TextStyle(
                      color: _selectedSubCategoryIndex == index
                          ? AppColorScheme.onPrimaryLight
                          : Color(0xFF1D1A20),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _reFetchContent() async {
    await _searchHelper._reFetchContent(_search.text);
  }

  void _showFilterProducts() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppConstants.cornerRadius)),
        ),
        builder: (
          context,
        ) {
          return
              //  BottomSheetFilter(
              //   controller: _scrollControllerForCategoryList,
              //   items: widget.subCategoryList.length,
              //   selectedIndex: _selectedSubCategoryIndex,
              //   subCategory: widget.subCategoryList,
              //   fetchdata:(){ _fetchData();}
              // );

              StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Iconsax.arrow_left,
                            size: 18,
                          )),
                      Text(
                        translation.of('search_page.filter_products'),
                        //'Filter products',
                        style: TextStyle(
                          color: Color(0xFF1D1B1E),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    // height: 0.50,
                    thickness: 1,
                  ),
                  Text(
                    translation.of('search_page.sub_category'),
                    // 'Sub category',
                    style: TextStyle(
                      color: Color(0xFF1D1A20),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 38,
                    child: ListView.builder(
                      controller:
                          //widget.scrollControllerForCategoryList,
                          _scrollControllerForCategoryList,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: widget.subCategoryList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedSubCategoryIndex = index;
                              });
                            },
                            child: Container(
                              // width: 91,
                              height: 28,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: ShapeDecoration(
                                color: _selectedSubCategoryIndex == index
                                    ? AppColorScheme.primaryColor
                                    : Color(0xFFF7EDFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              child: Center(
                                child: Text(
                                  translation.isArabic
                                      ? widget.subCategoryList[index].nameAr ??
                                          widget.subCategoryList[index].nameEn!
                                      : translation.isFrench
                                          ? widget.subCategoryList[index]
                                                  .nameFr ??
                                              widget.subCategoryList[index]
                                                  .nameEn!
                                          : widget
                                              .subCategoryList[index].nameEn!,
                                  //_items[index],
                                  style: TextStyle(
                                    color: _selectedSubCategoryIndex == index
                                        ? AppColorScheme.onPrimaryLight
                                        : Color(0xFF1D1A20),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    translation.of('search_page.sort_by'),
                    //'Sort by',
                    style: TextStyle(
                      color: Color(0xFF1D1A20),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 38,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: _itemSortBy.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndexSort = index;
                              });

                              switch (index) {
                                case 0:
                                  selectedSortBy = SortType.Asc;
                                  break;
                                case 1:
                                  selectedSortBy = SortType.Asc;
                                  break;
                                case 2:
                                  selectedSortBy = SortType.Desc;
                                  break;

                                // default:
                                //   selectedSortBy = SortType.Asc;
                              }

                              print('Selected Sort By: $selectedSortBy');
                            },
                            child: Container(
                              // width: 91,
                              height: 28,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: ShapeDecoration(
                                color: selectedIndexSort == index
                                    ? AppColorScheme.primaryColor
                                    : Color(0xFFF7EDFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              child: Center(
                                child: Text(
                                  _itemSortBy[index],
                                  style: TextStyle(
                                    color: selectedIndexSort == index
                                        ? AppColorScheme.onPrimaryLight
                                        : Color(0xFF1D1A20),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    translation.of('search_page.brand'),
                    // 'Brand',
                    style: TextStyle(
                      color: Color(0xFF1D1A20),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 38,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: _itemsBrand.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndexBrand = index;
                              });
                            },
                            child: Container(
                              // width: 91,
                              height: 28,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: ShapeDecoration(
                                color: selectedIndexBrand == index
                                    ? AppColorScheme.primaryColor
                                    : Color(0xFFF7EDFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              child: Center(
                                child: Text(
                                  _itemsBrand[index],
                                  style: TextStyle(
                                    color: selectedIndexBrand == index
                                        ? AppColorScheme.onPrimaryLight
                                        : Color(0xFF1D1A20),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          translation.of('search_page.reset_filter'),
                          //"Reset Filter",
                          style: TextStyle(
                            color: AppColorScheme.primaryColor,
                            fontSize: translation.isFrench ? 12 : 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 15),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                Color(0xFFF7F2FA),
                              ),
                            ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          _fetchData();
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: Text(
                          translation.of('search_page.apply_filter'),
                          //"Apply Filter",
                          style: TextStyle(
                            color: AppColorScheme.onPrimaryLight,
                            fontSize: translation.isFrench ? 12 : 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 15),
                              ),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: AppColorScheme.primaryColor,
                                ),
                              ),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
        });
  }

  // void _fetchData() {
  //   BlocProvider.of<SubcategoryItemsBloc>(context).add(
  //     FetchProductsBySubcategory(
  //       searchKey: _search.text,
  //       subcategoryId: _selectedSubcategoryId,
  //       categoryId: widget.categoryId,
  //       pincode: userData.pinCode,
  //       SortByPrice: selectedSortBy.toString()

  //     ),
  //   );
  // }

  void _fetchData() {
    BlocProvider.of<SubcategoryItemsBloc>(context)
        .add(FetchProductsBySubcategory(
      searchKey: _search.text,
      categoryId: widget.categoryId,
      pincode: userData.pinCode,
      SortByPrice: selectedSortBy.toString(),
    ));
  }

  bool _changeSubCategory([bool reverse = true]) {
    int index = _selectedSubCategoryIndex;
    bool canFetch = false;

    if (reverse) {
      if (index + 1 < widget.subCategoryList.length) {
        index += 1;
        canFetch = true;
      }
    } else {
      if (index - 1 >= 0) {
        index -= 1;
        canFetch = true;
      }
    }

    if (canFetch) {
      setState(() {
        _selectedSubCategoryIndex = index;
      });

      _fetchData();
      return true;
    }

    return false;
  }

  void _onScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _changeSubCategory();
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _changeSubCategory(false);
      }
    }
  }

  void _onRefresh() async {
    final shouldIndicate = _changeSubCategory(false);
    await Future.delayed(Duration(milliseconds: 500));
    _refreshController.finishRefresh();
    _refreshController.closeHeaderSecondary();
    _refreshController.resetHeader();
  }

  void _onLoad() async {
    final shouldIndicate = _changeSubCategory();
    await Future.delayed(Duration(milliseconds: 500));
    _refreshController.finishLoad();
    _refreshController.closeFooterSecondary();
    _refreshController.resetFooter();
  }

  void _getCurrentIndex() {
    for (int i = 0; i < widget.subCategoryList.length; i++) {
      if (widget.subCategoryList[i].id == widget.selectedSubCategoryId) {
        setState(() {
          _selectedSubCategoryIndex = i;
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToIndex(_selectedSubCategoryIndex);
        });
      }
    }
  }

  void _scrollToIndex(int index) {
    // _scrollControllerForCategoryList.jumpTo(index*1); // Adjust as per your item size
    // Or, if you want to animate to the position
    _scrollControllerForCategoryList.animateTo(
      index * 80,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToFirst() {
    _scrollController.jumpTo(0);
  }

  Widget _indicator(SubCategory _subCategory, {bool header = false}) {
    final title = [
      // SizedBox(height: 4),
      Text(
        _subCategory.nameEn ?? "-",
        style: Theme.of(context).textTheme.caption?.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onBackground,
            ),
        maxLines: 2,
        overflow: TextOverflow.fade,
        textAlign: TextAlign.center,
      ),
      // SizedBox(height: 4),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!header) ...[
          Icon(
            Icons.keyboard_double_arrow_up_rounded,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          ...title,
        ],
        CircleAvatar(
          backgroundColor: AppColorScheme.backgroundColorLight,
          // radius: 24,
          radius: 14,
          child: CustomNetworkImage(
            urlList: [StringModifiers.toUrl(_subCategory.thumbnail ?? "")],
            fit: BoxFit.contain,
            rounded: true,
            imageAsset: ThemeAssets.logo,
            opacity: 0.5,
            placeHolderFit: BoxFit.contain,
            placeHolderPadding: const EdgeInsets.all(4.0),
          ),
        ),
        if (header) ...[
          ...title,
        ],
      ],
    );
  }
}
