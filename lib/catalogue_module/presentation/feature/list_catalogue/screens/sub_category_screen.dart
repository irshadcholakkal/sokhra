// import 'package:easy_refresh/easy_refresh.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../../../../base_module/domain/entity/color_scheme.dart';
// import '../../../../../base_module/presentation/component/images/custom_network_image.dart';
// import '../../../../../base_module/presentation/core/values/app_assets.dart';
// import '../../../../../base_module/presentation/core/values/app_constants.dart';
// import '../../../../../base_module/presentation/util/string_modifiers.dart';
// import '../../../../../home/components/home_product_card.dart';
// import '../../../../../home/feature/home/screens/search_screen.dart';
// import '../../../../../new_cart_module/domain/new_cart_model.dart';
// import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
// import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_event.dart';
// import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_state.dart';
// import '../../../../../new_cart_module/presentation/widget/cart_bottom_bar.dart';
// import '../../../../../user_module/domain/user_data.dart';
// import '../../../../domain/models/category_model.dart';
// import '../../../../domain/models/product_status.dart';
// import '../blocs/subcategory_bloc/subcategory_bloc.dart';
// import '../blocs/subcategory_bloc/subcategory_event.dart';
// import '../blocs/subcategory_bloc/subcategory_state.dart';
// class SubCategoryScreen extends StatefulWidget {
//   final List<SubCategory> subCategoryList;
//   final bool isSearchEnabled;
//   final String? selectedSubCategoryId;
//   const SubCategoryScreen({
//     Key? key,
//     required this.subCategoryList,
//     required this.isSearchEnabled,
//     this.selectedSubCategoryId,
//   }) : super(key: key);
//   @override
//   State<SubCategoryScreen> createState() => _SubCategoryScreenState();
// }
// class _SubCategoryScreenState extends State<SubCategoryScreen> {
//   int _selectedSubCategoryIndex = 0;
//   List<Cart> _cartList = [];
//   bool _enableSearch = false;
//   final _searchController = TextEditingController();
//   final _scrollController = ScrollController();
//   final _scrollControllerForCategoryList = ScrollController();
//   final _refreshController = EasyRefreshController(
//     controlFinishRefresh: true,
//     controlFinishLoad: true,
//   );
//   SubCategory? get _selectedSubcategory {
//     if (_selectedSubCategoryIndex >= 0 &&
//         _selectedSubCategoryIndex < widget.subCategoryList.length) {
//       return widget.subCategoryList[_selectedSubCategoryIndex];
//     }
//     return null;
//   }
//   String get _selectedSubcategoryId => _selectedSubcategory?.id ?? "";
//   SubCategory? get _nextSubcategory {
//     final index = _selectedSubCategoryIndex + 1;
//     if (index < widget.subCategoryList.length) {
//       return widget.subCategoryList[index];
//     }
//     return null;
//   }
//   SubCategory? get _previousSubcategory {
//     final index = _selectedSubCategoryIndex - 1;
//     if (index >= 0) {
//       return widget.subCategoryList[index];
//     }
//     return null;
//   }
//   bool get _canRefresh => _previousSubcategory != null;
//   bool get _canLoad => _nextSubcategory != null;
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentIndex();
//     // _scrollController.addListener(_onScroll);
//     // enableSearch = widget.isSearchEnabled;
//     // if (widget.subCategoryList.isNotEmpty) {
//     //   _selectedSubcategory = widget.subCategoryList.first;
//     //   _selectedSubcategoryId = widget.subCategoryList.first.id!;
//     // }
//     BlocProvider.of<NewCartBloc>(context).add(
//       FetchCartItems(pincode: userData.pinCode),
//     );
//     _fetchData();
//   }
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _refreshController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return
//     BlocListener<NewCartBloc, NewCartState>(
//       listener: (context, state) {
//         if (state is CartLoaded) {
//           setState(() {
//             _cartList = state.cartList ?? [];
//           });
//         }
//       },
//       child: Scaffold(
//         // appBar: AppBar(
//         //   elevation: 2,
//         //   backgroundColor: AppColorScheme.onPrimaryLight,
//         //   leading: InkWell(
//         //     onTap: () {
//         //       Navigator.pop(context);
//         //     },
//         //     child: Icon(
//         //       Icons.arrow_back_ios_new_outlined,
//         //       color: Theme.of(context).colorScheme.onBackground,
//         //     ),
//         //   ),
//         //   // title: _enableSearch
//         //   //     ? Container(
//         //   //         height: 45,
//         //   //         child: TextFormField(
//         //   //           controller: _searchController,
//         //   //           autofocus: _enableSearch,
//         //   //           onChanged: (val) {
//         //   //             if (val.length > 2) {
//         //   //               Future.delayed(
//         //   //                 Duration(seconds: 2),
//         //   //                 () {
//         //   //                   BlocProvider.of<SubcategoryItemsBloc>(context).add(
//         //   //                     FetchProductsBySubcategory(
//         //   //                       searchKey: _searchController.text,
//         //   //                       subcategoryId: _selectedSubcategoryId,
//         //   //                       pincode: "560038",
//         //   //                     ),
//         //   //                   );
//         //   //                 },
//         //   //               );
//         //   //             }
//         //   //           },
//         //   //           decoration: InputDecoration(
//         //   //               hintText: "Search",
//         //   //               hintStyle: TextStyle(
//         //   //                 color: AppColorScheme.onBackgroundLight,
//         //   //               ),
//         //   //               border: OutlineInputBorder(
//         //   //                   borderRadius: BorderRadius.circular(
//         //   //                     5.0,
//         //   //                   ),
//         //   //                   borderSide: BorderSide.none),
//         //   //               enabledBorder: OutlineInputBorder(
//         //   //                   borderRadius: BorderRadius.circular(
//         //   //                     5.0,
//         //   //                   ),
//         //   //                   borderSide: BorderSide.none),
//         //   //               disabledBorder: OutlineInputBorder(
//         //   //                   borderRadius: BorderRadius.circular(
//         //   //                     5.0,
//         //   //                   ),
//         //   //                   borderSide: BorderSide.none),
//         //   //               errorBorder: OutlineInputBorder(
//         //   //                   borderRadius: BorderRadius.circular(
//         //   //                     5.0,
//         //   //                   ),
//         //   //                   borderSide: BorderSide.none),
//         //   //               focusedBorder: OutlineInputBorder(
//         //   //                   borderRadius: BorderRadius.circular(
//         //   //                     5.0,
//         //   //                   ),
//         //   //                   borderSide: BorderSide.none),
//         //   //               fillColor: AppColorScheme.backgroundColorLight,
//         //   //               suffixIcon: IconButton(
//         //   //                 icon: Icon(Icons.close),
//         //   //                 onPressed: () {
//         //   //                   if (_searchController.text.isNotEmpty)
//         //   //                     BlocProvider.of<SubcategoryItemsBloc>(context)
//         //   //                         .add(
//         //   //                       FetchProductsBySubcategory(
//         //   //                         searchKey: "",
//         //   //                         subcategoryId: _selectedSubcategoryId,
//         //   //                         pincode: "560038",
//         //   //                       ),
//         //   //                     );
//         //   //                   setState(() {
//         //   //                     _searchController.clear();
//         //   //                     _enableSearch = false;
//         //   //                   });
//         //   //                 },
//         //   //               )),
//         //   //         ),
//         //   //       )
//         //   //     : Container(),
//         //   actions: [
//         //     _enableSearch
//         //         ? Container()
//         //         : IconButton(
//         //             onPressed: () {
//         //               // showSearch(
//         //               //   context: context,
//         //               //   delegate: ProductSearchScreen(
//         //               //     category: _selectedSubcategory,
//         //               //   ),
//         //               // );
//         //               // setState(() {
//         //               //   _enableSearch = true;
//         //               // });
//         //             },
//         //             icon: Icon(
//         //               Icons.search,
//         //               color: Theme.of(context).colorScheme.onBackground,
//         //             ),
//         //           )
//         //   ],
//         // ),
//         // // bottomNavigationBar: CartBottomBar(
//         // //   //cartList: _cartList
//         // //   ),
//         body:
//         Container(
//           height: double.infinity,
//           width: double.infinity,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 76,
//                 decoration: BoxDecoration(
//                   color: AppColorScheme.onPrimaryLight,
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColorScheme.onBlack.withOpacity(0.2),
//                       blurRadius: 4,
//                     ),
//                   ],
//                 ),
//                 child:
//                 ListView(
//                   controller: _scrollControllerForCategoryList,
//                   shrinkWrap: false,
//                   children: List.generate(
//                     widget.subCategoryList.length,
//                     (index) => InkWell(
//                       onTap: () {
//                         setState(() {
//                           _selectedSubCategoryIndex = index;
//                           // _selectedSubcategory = widget.subCategoryList[index];
//                           // _selectedSubcategoryId =
//                           //     widget.subCategoryList[index].id!;
//                         });
//                         // itemScrollController.jumpTo(index: index);
//                         _fetchData();
//                       },
//                       child: Container(
//                         height: 80,
//                        // color: Colors.red,
//                         margin: EdgeInsets.symmetric(vertical: 4.0),
//                         child: Center(
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     CircleAvatar(
//                                       backgroundColor: _selectedSubcategoryId ==
//                                               widget.subCategoryList[index].id
//                                           ? Color(0xFFD1FDD9)
//                                           :AppColorScheme.onBackgroundLight,
//                                       radius: 24,
//                                       child: CustomNetworkImage(
//                                         urlList: [
//                                           StringModifiers.toUrl(widget
//                                                   .subCategoryList[index]
//                                                   .thumbnail ??
//                                               "")
//                                         ],
//                                         fit: BoxFit.contain,
//                                         rounded: true,
//                                         imageAsset:
//                                             ThemeAssets.textAndIconForCategory,
//                                         opacity: 0.5,
//                                         placeHolderFit: BoxFit.contain,
//                                         placeHolderPadding:
//                                             // const EdgeInsets.all(10.0),
//                                             const EdgeInsets.all(5.0),
//                                       ),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 8.0,
//                                       ),
//                                       child: Text(
//                                         widget.subCategoryList[index].nameEn!,
//                                         maxLines: 2,
//                                         overflow: TextOverflow.fade,
//                                         textAlign: TextAlign.center,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .caption
//                                             ?.copyWith(
//                                               fontSize: 10,
//                                               fontWeight: FontWeight.w600,
//                                               color: Theme.of(context)
//                                                   .colorScheme
//                                                   .onBackground,
//                                             ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               _selectedSubcategoryId ==
//                                       widget.subCategoryList[index].id
//                                   ? Container(
//                                       // width: 3.5,
//                                       width: 3.5,
//                                       margin:
//                                           EdgeInsets.symmetric(vertical: 6.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(20.0),
//                                           topLeft: Radius.circular(20.0),
//                                         ),
//                                         color: AppColorScheme.primaryColor,
//                                       ),
//                                     )
//                                   : Container()
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 // flex: 4,
//                 child:
//                 EasyRefresh(
//                   controller: _refreshController,
//                   onRefresh: () {
//                     if (_canRefresh) _onRefresh();
//                   },
//                   onLoad: () {
//                     if (_canLoad) _onLoad();
//                   },
//                   canLoadAfterNoMore: _canRefresh,
//                   canRefreshAfterNoMore: _canLoad,
//                   refreshOnStart: false,
//                   header: ClassicHeader(
//                     showText: false,
//                     triggerWhenRelease: false,
//                     triggerWhenReach: false,
//                     triggerOffset: _canLoad ? 42 : 0,
//                     // triggerOffset: _canLoad?120:0,
//                     iconDimension: MediaQuery.of(context).size.width / 2,
//                     pullIconBuilder: (context, state, animation) {
//                       if (_canRefresh &&
//                           _previousSubcategory != null &&
//                           ![
//                             IndicatorMode.inactive,
//                             IndicatorMode.done,
//                             IndicatorMode.processed,
//                             IndicatorMode.processing,
//                           ].contains(state.mode)) {
//                         return _indicator(_previousSubcategory!, header: true);
//                       }
//                       return SizedBox();
//                     },
//                   ),
//                   footer: ClassicFooter(
//                     showText: false,
//                     // triggerOffset: _canLoad ? 120 : 0,
//                     triggerOffset: _canLoad ? 42 : 0,
//                     iconDimension: MediaQuery.of(context).size.width / 2,
//                     infiniteOffset: 42,
//                     // infiniteOffset: 0,
//                     pullIconBuilder: (context, state, animation) {
//                       if (_canLoad &&
//                           _nextSubcategory != null &&
//                           ![
//                             IndicatorMode.inactive,
//                             IndicatorMode.done,
//                             IndicatorMode.processed,
//                             IndicatorMode.processing,
//                           ].contains(state.mode)) {
//                         return _indicator(_nextSubcategory!);
//                       }
//                       return SizedBox();
//                     },
//                   ),
//                   child: SingleChildScrollView(
//                     controller: _scrollController,
//                     physics: AlwaysScrollableScrollPhysics(),
//                     padding: EdgeInsets.all(8.0),
//                     child: BlocConsumer<SubcategoryItemsBloc,
//                         SubcategoryItemsState>(
//                       listener: (context, state) {
//                         if (state is SubcategoryItemsLoaded) {
//                           _scrollToFirst();
//                         }
//                       },
//                       builder: (context, state) {
//                         if (state is SubcategoryItemsLoading) {
//                           return GridView.builder(
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//                             padding: EdgeInsets.all(8.0),
//                             gridDelegate:
//                                 SliverGridDelegateWithMaxCrossAxisExtent(
//                               maxCrossAxisExtent: 240,
//                               childAspectRatio: 136 / 240,
//                               crossAxisSpacing: 8.0,
//                               mainAxisSpacing: 8.0,
//                             ),
//                             itemCount: 10,
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(11.0),
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(11.0),
//                                   child: Shimmer.fromColors(
//                                     baseColor: Colors.grey.shade300,
//                                     highlightColor:
//                                         AppColorScheme.onPrimaryLight.withOpacity(0.6),
//                                     period: Duration(seconds: 5),
//                                     child:
//                                         Container(color: Colors.grey.shade300),
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         } else if (state is SubcategoryItemsLoaded) {
//                           return Container(
//                             constraints: BoxConstraints(
//                               minHeight:
//                                   MediaQuery.of(context).size.height - 110,
//                             ),
//                             child: Column(
//                               children: [
//                                 if (_selectedSubcategory?.avatar?.isNotEmpty ==
//                                     true) ...[
//                                   CustomNetworkImage(
//                                     height: 174,
//                                     width: double.infinity,
//                                     urlList: [
//                                       StringModifiers.toUrl(
//                                         _selectedSubcategory?.avatar ?? "",
//                                       )
//                                     ],
//                                     border: Border.all(
//                                       color:
//                                           AppColorScheme.productCardBorderColor,
//                                     ),
//                                     // fit: BoxFit.contain,
//                                     borderRadius: AppConstants.cornerRadius,
//                                     imageAsset: ThemeAssets.dummy_image_wider,
//                                     placeHolderFit: BoxFit.contain,
//                                     placeHolderPadding: EdgeInsets.all(12),
//                                     opacity: 0.5,
//                                   ),
//                                   SizedBox(height: 8),
//                                 ],
//                                 GridView.builder(
//                                   shrinkWrap: true,
//                                   physics: NeverScrollableScrollPhysics(),
//                                   gridDelegate:
//                                       SliverGridDelegateWithMaxCrossAxisExtent(
//                                     maxCrossAxisExtent: 240,
//                                     childAspectRatio: 136 / 240,
//                                     crossAxisSpacing: 8.0,
//                                     mainAxisSpacing: 8.0,
//                                     mainAxisExtent: 227,
//                                     //227,
//                                   ),
//                                   itemCount: state.products.length,
//                                   itemBuilder: (context, index) {
//                                     final product = state.products[index];
//                                     int itemQuantity = 1;
//                                     bool isInCart = false;
//                                     final isInStock = product.status ==
//                                         ProductStatus.IN_STOCK.name;
//                                     final cartItem = _cartList.firstWhere(
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
//                                 ),
//                               ],
//                             ),
//                           );
//                         } else {
//                           return Container(
//                             margin: EdgeInsets.symmetric(
//                               vertical: MediaQuery.of(context).size.height / 2,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "No data",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .subtitle2!
//                                     .copyWith(
//                                       fontWeight: FontWeight.w400,
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .onBackground,
//                                     ),
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _indicator(SubCategory _subCategory, {bool header = false}) {
//     final title = [
//       // SizedBox(height: 4),
//       Text(
//         _subCategory.nameEn ?? "-",
//         style: Theme.of(context).textTheme.caption?.copyWith(
//               fontSize: 10,
//               fontWeight: FontWeight.w600,
//               color: Theme.of(context).colorScheme.onBackground,
//             ),
//         maxLines: 2,
//         overflow: TextOverflow.fade,
//         textAlign: TextAlign.center,
//       ),
//       // SizedBox(height: 4),
//     ];
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (!header) ...[
//           Icon(
//             Icons.keyboard_double_arrow_up_rounded,
//             color: Theme.of(context).colorScheme.onBackground,
//           ),
//           ...title,
//         ],
//         CircleAvatar(
//           backgroundColor:AppColorScheme.onBackgroundLight,
//           // radius: 24,
//           radius: 14,
//           child: CustomNetworkImage(
//             urlList: [StringModifiers.toUrl(_subCategory.thumbnail ?? "")],
//             fit: BoxFit.contain,
//             rounded: true,
//             imageAsset: ThemeAssets.logo,
//             opacity: 0.5,
//             placeHolderFit: BoxFit.contain,
//             placeHolderPadding: const EdgeInsets.all(4.0),
//           ),
//         ),
//         if (header) ...[
//           ...title,
//           // Icon(
//           //   Icons.keyboard_double_arrow_down_rounded,
//           //   color: Theme.of(context).colorScheme.onBackground,
//           // )
//         ],
//       ],
//     );
//   }
//   void _fetchData() {
//     BlocProvider.of<SubcategoryItemsBloc>(context).add(
//       FetchProductsBySubcategory(
//         searchKey: _searchController.text,
//         subcategoryId: _selectedSubcategoryId,
//         pincode: userData.pinCode,
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
//       _fetchData();
//       return true;
//     }
//     return false;
//   }
//   void _onScroll() {
//     if (_scrollController.position.userScrollDirection ==
//         ScrollDirection.reverse) {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         // _changeSubCategory();
//       }
//     } else if (_scrollController.position.userScrollDirection ==
//         ScrollDirection.forward) {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         // _changeSubCategory(false);
//       }
//     }
//   }
//   void _onRefresh() async {
//     final shouldIndicate = _changeSubCategory(false);
//     await Future.delayed(Duration(milliseconds: 500));
//     _refreshController.finishRefresh();
//     _refreshController.closeHeaderSecondary();
//     _refreshController.resetHeader();
//   }
//   void _onLoad() async {
//     final shouldIndicate = _changeSubCategory();
//     await Future.delayed(Duration(milliseconds: 500));
//     _refreshController.finishLoad();
//     _refreshController.closeFooterSecondary();
//     _refreshController.resetFooter();
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



import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/presentation/component/images/custom_network_image.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../base_module/presentation/util/string_modifiers.dart';
import '../../../../../home/components/home_product_card.dart';
import '../../../../../home/feature/home/screens/search_screen.dart';
import '../../../../../new_cart_module/domain/new_cart_model.dart';
import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_event.dart';
import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_state.dart';
import '../../../../../new_cart_module/presentation/widget/cart_bottom_bar.dart';
import '../../../../../user_module/domain/user_data.dart';
import '../../../../domain/models/category_model.dart';
import '../../../../domain/models/product_status.dart';
import '../blocs/subcategory_bloc/subcategory_bloc.dart';
import '../blocs/subcategory_bloc/subcategory_event.dart';
import '../blocs/subcategory_bloc/subcategory_state.dart';

class SubCategoryScreen extends StatefulWidget {
  final List<SubCategory> subCategoryList;
  final bool isSearchEnabled;
  final String? selectedSubCategoryId;

  const SubCategoryScreen({
    Key? key,
    required this.subCategoryList,
    required this.isSearchEnabled,
    this.selectedSubCategoryId,
  }) : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  int _selectedSubCategoryIndex = 0;

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
    return BlocListener<NewCartBloc, NewCartState>(
      listener: (context, state) {
        if (state is CartLoaded) {
          setState(() {
            _cartList = state.cartList ?? [];
          });
        }
      },
      child: 
       
         Container(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 76,
                decoration: BoxDecoration(
                  color: AppColorScheme.onPrimaryLight,
                  boxShadow: [
                    BoxShadow(
                      color: AppColorScheme.onBlack.withOpacity(0.2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: ListView(
                  controller: _scrollControllerForCategoryList,
                  shrinkWrap: false,
                  children: List.generate(
                    widget.subCategoryList.length,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          _selectedSubCategoryIndex = index;
                        });

                        _fetchData();
                      },
                      child: Container(
                        height: 80,
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: _selectedSubcategoryId ==
                                              widget.subCategoryList[index].id
                                          ? Color(0xFFD1FDD9)
                                          :AppColorScheme.onBackgroundLight,
                                      radius: 24,
                                      child: CustomNetworkImage(
                                        urlList: [
                                          StringModifiers.toUrl(widget
                                                  .subCategoryList[index]
                                                  .thumbnail ??
                                              "")
                                        ],
                                        fit: BoxFit.contain,
                                        rounded: true,
                                        imageAsset:
                                            ThemeAssets.textAndIconForCategory,
                                        opacity: 0.5,
                                        placeHolderFit: BoxFit.contain,
                                        placeHolderPadding:
                                            // const EdgeInsets.all(10.0),
                                            const EdgeInsets.all(5.0),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Text(
                                        widget.subCategoryList[index].nameEn!,
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            ?.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              _selectedSubcategoryId ==
                                      widget.subCategoryList[index].id
                                  ? Container(
                                      // width: 3.5,
                                      width: 3.5,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 6.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          topLeft: Radius.circular(20.0),
                                        ),
                                        color: AppColorScheme.primaryColor,
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              
              Expanded(
                // flex: 4,
                child: EasyRefresh(
                  controller: _refreshController,
                  onRefresh: () {
                    if (_canRefresh) _onRefresh();
                  },
                  onLoad: () {
                    if (_canLoad) _onLoad();
                  },
                  canLoadAfterNoMore: _canRefresh,
                  canRefreshAfterNoMore: _canLoad,
                  refreshOnStart: false,
                  header: ClassicHeader(
                    showText: false,
                    triggerWhenRelease: false,
                    triggerWhenReach: false,
                    triggerOffset: _canLoad ? 42 : 0,
                    // triggerOffset: _canLoad?120:0,
                    iconDimension: MediaQuery.of(context).size.width / 2,
                    pullIconBuilder: (context, state, animation) {
                      if (_canRefresh &&
                          _previousSubcategory != null &&
                          ![
                            IndicatorMode.inactive,
                            IndicatorMode.done,
                            IndicatorMode.processed,
                            IndicatorMode.processing,
                          ].contains(state.mode)) {
                        return _indicator(_previousSubcategory!, header: true);
                      }

                      return SizedBox();
                    },
                  ),
                  footer: ClassicFooter(
                    showText: false,
                    // triggerOffset: _canLoad ? 120 : 0,
                    triggerOffset: _canLoad ? 42 : 0,
                    iconDimension: MediaQuery.of(context).size.width / 2,
                    infiniteOffset: 42,
                    // infiniteOffset: 0,
                    pullIconBuilder: (context, state, animation) {
                      if (_canLoad &&
                          _nextSubcategory != null &&
                          ![
                            IndicatorMode.inactive,
                            IndicatorMode.done,
                            IndicatorMode.processed,
                            IndicatorMode.processing,
                          ].contains(state.mode)) {
                        return _indicator(_nextSubcategory!);
                      }

                      return SizedBox();
                    },
                  ),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.all(8.0),
                    child: BlocConsumer<SubcategoryItemsBloc,
                        SubcategoryItemsState>(
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
                            padding: EdgeInsets.all(8.0),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
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
                                    highlightColor:
                                        AppColorScheme.onPrimaryLight.withOpacity(0.6),
                                    period: Duration(seconds: 5),
                                    child:
                                        Container(color: Colors.grey.shade300),
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (state is SubcategoryItemsLoaded) {
                          return Container(
                            constraints: BoxConstraints(
                              minHeight:
                                  MediaQuery.of(context).size.height - 110,
                            ),
                            child: Column(
                              children: [
                                if (_selectedSubcategory?.avatar?.isNotEmpty ==
                                    true) ...[
                                  CustomNetworkImage(
                                    height: 174,
                                    width: double.infinity,
                                    urlList: [
                                      StringModifiers.toUrl(
                                        _selectedSubcategory?.avatar ?? "",
                                      )
                                    ],
                                    border: Border.all(
                                      color:
                                          AppColorScheme.productCardBorderColor,
                                    ),
                                    // fit: BoxFit.contain,
                                    borderRadius: AppConstants.cornerRadius,
                                    imageAsset: ThemeAssets.dummy_image_wider,
                                    placeHolderFit: BoxFit.contain,
                                    placeHolderPadding: EdgeInsets.all(12),
                                    opacity: 0.5,
                                  ),
                                  SizedBox(height: 8),
                                ],
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 240,
                                    childAspectRatio: 136 / 240,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    mainAxisExtent: 227,
                                    //227,
                                  ),
                                  itemCount: state.products.length,
                                  itemBuilder: (context, index) {
                                    final product = state.products[index];
                                    int itemQuantity = 1;
                                    bool isInCart = false;
                                    final isInStock = product.variants?[index].status ==
                                        ProductStatus.IN_STOCK.name;

                                    final cartItem = _cartList.firstWhere(
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
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            margin: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height / 2,
                            ),
                            child: Center(
                              child: Text(
                                "No data",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      
    );
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
          backgroundColor:AppColorScheme.onBackgroundLight,
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

  void _fetchData() {
    BlocProvider.of<SubcategoryItemsBloc>(context).add(
      FetchProductsBySubcategory(
        searchKey: _searchController.text,
        subcategoryId: _selectedSubcategoryId,
        pincode: userData.pinCode,
      ),
    );
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
}
