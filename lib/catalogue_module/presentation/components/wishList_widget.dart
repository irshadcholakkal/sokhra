//
// import 'package:armino_ecom/base_module/domain/entity/app.dart';
// import 'package:armino_ecom/cart_wishlist_module/data/entity/input_models/wish_list_input.dart';
// import 'package:armino_ecom/cart_wishlist_module/presentation/feature/cart/blocs/variant_cubit/variant_cubit.dart';
// import 'package:armino_ecom/catalogue_module/domain/models/variant.dart';
// import 'package:armino_ecom/user_module/domain/user_data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../cart_wishlist_module/domain/models/wish_list.dart';
// import '../../../cart_wishlist_module/presentation/feature/wishlist/blocs/test/tset_bloc.dart';
//
// class WishListWidget extends StatefulWidget {
//   final Variant? wishlistVariant;
//
//   final String ? productId;
//   const WishListWidget({Key? key, this.productId,this.wishlistVariant}) : super(key: key);
//
//   @override
//   State<WishListWidget> createState() => _WishListWidgetState();
// }
//
// class _WishListWidgetState extends State<WishListWidget> {
//   bool isWishListed = false;
//   String? wishlistId;
//   List<WishList>wishListData =[];
//
//   //
//   // wishListFn(BuildContext context) {
//   //   if (BlocProvider.of<CustomerWishlistBloc>(context).map.containsKey(widget.productId)) {
//   //     print("aaaaaaaab1");
//   //     Map<String, String> data = BlocProvider.of<CustomerWishlistBloc>(context)
//   //         .map[widget.productId!] ??
//   //         {};
//   //     if (data.containsKey(
//   //         BlocProvider.of<VariantCubit>(context).variant?.variantId)) {
//   //       print("aaaaaaaab2");
//   //       setState(() {
//   //         wishlistId =
//   //         data[BlocProvider
//   //             .of<VariantCubit>(context)
//   //             .variant
//   //             ?.variantId];
//   //         isWishListed = true;
//   //       });
//   //     } else {
//   //       print("aaaaaaaab3");
//   //       setState(() {
//   //         isWishListed = false;
//   //       });
//   //     }
//   //   } else {
//   //     print("aaaaaaaab4");
//   //     setState(() {
//   //       isWishListed = false;
//   //     });}
//   //
//   //
//   // }
//
//   fetchWishList(){
//     BlocProvider.of<TsetBloc>(context)
//         .add(TestFetchEvent(
//         reFetch: true,
//         lat: userData.lat,
//         lng:  userData.lng
//     ));
//   }
//
//   @override
//   void initState() {
// fetchWishList();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  BlocListener<TsetBloc, TsetState>(
//   listener: (context, state) {
//     if(state is TestInitial){
//
//
//     }else if(state is TestFetchSuccessState){
//       wishListData.clear();
//       print("aaaaaaaaaaaaaaaaaaaaa");
//       print(state.wishList);
//       print(state.wishList.length);
//       if(state.wishList.isNotEmpty|| state.wishList !=[]){
//         print("aaaa1");
//         print(widget.productId);
//
//
//           final wishListData = state.wishList.firstWhere(
//                 (element) => element.product?.productId == widget.productId,
//             orElse: () => WishList(),
//           );
//         print("aaaa2");
//         print(wishListData.product);
//           if(wishListData.product != null){
//             print("aaaa3");
//             setState((){
//               isWishListed = true;
//             });
//
//
//
//
//           }
//
//
//
//         // wishListData.addAll(state.wishList);
//       }
//
//
//       print(state.wishList);
//
//
//
//     }else if(state is TestMutationSuccessState){
// fetchWishList();
//
//     }
//
//     else if (state is TestFailedState){
//       print("aaaaaaaaaaa2");
//
//     }else{
//       fetchWishList();
//     }
//   },
//   child: Container(
//       width: 30,
//       height: 30,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Theme.of(context).colorScheme.onPrimary),
//       child: isWishListed
//           ? InkWell(
//           onTap: () {
//             print("aaaaaaa1");
//             print(isWishListed);
//             print(widget.wishlistVariant?.variantId);
//             // BlocProvider.of<TsetBloc>(context)
//             //     .add(TestRemoveEvent(wishListId: wishlistId));
//           },child: Icon(
//             Icons.favorite,
//             color: Colors.red,
//           ))
//           : InkWell(
//
//           onTap: (){
//             print("aaaaaa");
//
//             print(isWishListed);
//             //
//              BlocProvider.of<TsetBloc>(context).add(
//                 TestAddEvent(
//                     wishListInput: WishListInput(
//                         pinCode: userData.pinCode,
//                         deviceId: app.deviceId,
//                         product: widget.productId,
//                         variant: BlocProvider.of<VariantCubit>(context)
//                             .variant
//                             ?.variantId),
//                     lng: userData.lng,lat: userData.lat
//                 ));
//           },
//
//
//
//           child: Icon(
//             Icons.favorite_outline,
//             color: Theme.of(context).colorScheme.primary,
//           )),
//     ),
// );
//   }
// }
