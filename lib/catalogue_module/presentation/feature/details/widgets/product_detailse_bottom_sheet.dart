import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../base_module/domain/entity/app.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../../base_module/presentation/component/buttons/custom_close_button.dart';
import '../../../../../base_module/presentation/component/common_carousel/common_carousel.dart';
import '../../../../../base_module/presentation/component/images/custom_network_image.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../base_module/presentation/util/string_modifiers.dart';
import '../../../../../new_cart_module/domain/new_cart_model.dart';
import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_event.dart';
import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_state.dart';
import '../../../../../new_cart_module/presentation/widget/cart_bottom_bar.dart';
import '../../../../../new_cart_module/presentation/widget/increment_decrement_button.dart';
import '../../../../../new_cart_module/presentation/widget/new_add_to_cart_button.dart';
import '../../../../../new_cart_module/presentation/widget/out_of_stock_button.dart';
import '../../../../../user_module/domain/user_data.dart';
import '../../../../domain/models/product_status.dart';
import '../../../../domain/models/products_by_subcategory_model.dart';
import 'package:badges/badges.dart' as badges;

class ProductDetails extends StatefulWidget {
  final Product? productData;
  final bool? isInCart;
  final Cart? cartItem;
  final int? itemQuantity;

  ProductDetails({
    Key? key,
    this.productData,
    this.isInCart,
    this.cartItem,
    this.itemQuantity,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool _isInCart = false;
  final _carouselController = CarouselController();
  List<Cart> _cartList = [];
  int _itemQuantity = 1;

  Cart? _cartItem;
  int _currentPage = 0;
  num totalprice = 0;
  String totalPriceString = "";
  double totalPrice = 0.0;
  num itemPrice = 0;
  int selectedVarient = 0;
  @override
  void initState() {
    super.initState();

    _isInCart = widget.isInCart ?? false;
    _cartItem = widget.cartItem;
    _itemQuantity = widget.itemQuantity ?? 1;
    _totalPrice();
    BlocProvider.of<NewCartBloc>(context)
        .add(FetchCartItems(pincode: userData.pinCode));
  }

  void _totalPrice() {
    final variant = widget.productData?.variants?[selectedVarient];
    print("${variant}");

    if (variant != null) {
      final variantPrice = variant.price ?? 0.0;
      final reductionPrice = variant.reductionPrice ?? 0.0;

      final itemQuantity = _itemQuantity.toDouble();
      itemPrice = variantPrice - reductionPrice;

      print('Variant Price: $variantPrice');
      print('Reduction Price: $reductionPrice');
      print('Item Quantity: $itemQuantity');
      print('Item Price: $itemPrice');

      setState(() {
        totalPrice = itemQuantity * variantPrice;
        //itemPrice;
      });

      print('Total Price for a Single Product: $totalPrice');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final isInStock = widget.productData?.status == ProductStatus.IN_STOCK.name;
    bool isInStock = false;
    setState(() {
      isInStock = widget.productData?.variants?[selectedVarient].status ==
          ProductStatus.IN_STOCK.name;
      print(widget.productData?.variants?[selectedVarient].status);
    });

    return BlocListener<NewCartBloc, NewCartState>(
      listener: (context, state) {
        if (state is CartLoaded) {
          final cartList = state.cartList ?? [];
          _totalPrice();
          setState(() {
            final cartItem = cartList.firstWhere(
              (element) =>
                  element.variant?.id ==
                  widget.productData?.variants?[selectedVarient].id,
              // element.product!.id == widget.productData!.id,
              orElse: () => Cart(),
            );

            print("ProductDetilasCartItem${cartItem}");
            if (cartItem.id != null) {
              setState(() {
                _cartList = cartList;
                _isInCart = true;
                _itemQuantity = cartItem.quantity ?? 1;
                _cartItem = cartItem;
              });
            } else {
              setState(() {
                _cartList = cartList;
                _isInCart = false;
                _itemQuantity = 1;
                _cartItem = null;
              });
            }
          });

          // final cartItem = cartList.firstWhere(
          //   (element) => element.product?.variants?.firstOrNull?.id == widget.productData!.variants?.first.id,
          //   orElse: () => Cart(),
          // );
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        //  AppColorScheme.backgroundColorLight,
        appBar: AppBar(
          backgroundColor: AppColorScheme.scaffoldBackgroundColorLight,
          leading: IconButton(
            icon: Container(
              width: 36,
              height: 36,
              decoration: ShapeDecoration(
                color: AppColorScheme.secondaryColorLight,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.cornerRadiusMin),
                ),
              ),
              child: Icon(Iconsax.arrow_left, color: AppColorScheme.onBlack),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 18,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CustomCloseButton(),
              // AppPadding(multipliedBy: 0.6),
              Column(
                children: [
                  Container(
                    height: 310,
                    width: double.infinity,
                    color: AppColorScheme.scaffoldBackgroundColorLight,
                    // height: MediaQuery.of(context).size.height * 0.7,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 307.05,
                          height: 228.05,
                          child: PageView.builder(
                              itemCount:
                                  widget.productData?.avatar?.length ?? 0,
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentPage = page;
                                });
                              },
                              itemBuilder: ((context, index) {
                                var images = widget.productData?.avatar ?? [];
                                // images = images + images + images + images;
                                final imageMain = images[index];

                                return CustomNetworkImage(
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  //height: 220,
                                  urlList: [StringModifiers.toUrl(imageMain)],
                                  fit: BoxFit.contain,
                                  imageAsset: ThemeAssets.dummy_image_wider,
                                  placeHolderFit: BoxFit.contain,
                                  opacity: 0.5,
                                  // placeHolderPadding: EdgeInsets.symmetric(
                                  //   horizontal: 12,
                                  // ),
                                );
                              })),
                        ),

                        // CommonCarousel(
                        //   carouselController: _carouselController,
                        //   height: 320,
                        //   scrollDirection: Axis.horizontal,
                        //   physics: NeverScrollableScrollPhysics(),
                        //   itemBuilder: (context, index, id) {
                        //     var images = widget.productData?.avatar ?? [];
                        //      // images = images + images + images + images;
                        //     final imageMain = images[index];
                        //     return Container(
                        //       child: Column(
                        //         children: [
                        //           CustomNetworkImage(
                        //             width: double.maxFinite,
                        //             height: 220,
                        //             urlList: [StringModifiers.toUrl(imageMain)],
                        //             fit: BoxFit.contain,
                        //             imageAsset: ThemeAssets.dummy_image_wider,
                        //             placeHolderFit: BoxFit.contain,
                        //             opacity: 0.5,
                        //             placeHolderPadding: EdgeInsets.symmetric(
                        //               horizontal: 12,
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             height: AppConstants.defaultPadding / 2,
                        //           ),
                        //           Center(
                        //             child: SizedBox(
                        //               height: 50,
                        //               child: ListView.builder(
                        //                 itemCount: images.length,
                        //                 shrinkWrap: true,
                        //                 scrollDirection: Axis.horizontal,
                        //                 padding: EdgeInsets.zero,
                        //                 itemBuilder: (context, i) {
                        //                   final image = images[i];
                        //                   return Container(
                        //                     margin: const EdgeInsetsDirectional
                        //                         .only(start: 4),
                        //                     child: AspectRatio(
                        //                       aspectRatio: 1,
                        //                       child: Container(
                        //                          // padding: EdgeInsets.all(5),
                        //                         decoration: BoxDecoration(
                        //                           borderRadius:
                        //                               BorderRadius.circular(4),
                        //                           border: Border.all(
                        //                               color: i == id
                        //                                   ? Theme.of(context)
                        //                                       .colorScheme
                        //                                       .onBackground
                        //                                       .withOpacity(0.20)
                        //                                   : Theme.of(context)
                        //                                       .colorScheme
                        //                                       .onBackground
                        //                                       .withOpacity(
                        //                                           0.06),
                        //                               width: 1),
                        //                         ),
                        //                         child: InkWell(
                        //                           onTap: () {
                        //                             _carouselController
                        //                                 .jumpToPage(i);
                        //                           },
                        //                           child: CustomNetworkImage(
                        //                             width: 41,
                        //                             height: 41,
                        //                             urlList: [
                        //                               StringModifiers.toUrl(
                        //                                 image,
                        //                               )
                        //                             ],
                        //                             fit: BoxFit.contain,
                        //                             borderRadius: 4,
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   );
                        //                 },
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        //   itemCount: widget.productData?.avatar?.length ?? 0,
                        // ),
                        // AppPadding(multipliedBy: 0.6),
                        // Text(
                        //   "Description",
                        //   style:
                        //       Theme.of(context).textTheme.caption?.copyWith(
                        //             fontWeight: FontWeight.w600,
                        //             color: Theme.of(context)
                        //                 .colorScheme
                        //                 .onBackground,
                        //           ),
                        // ),
                        // SizedBox(height: 2),
                        // Text(
                        //   widget.productData?.descriptionEn ?? "_",
                        //   style:
                        //       Theme.of(context).textTheme.caption?.copyWith(
                        //             fontSize: 10,
                        //             fontWeight: FontWeight.w400,
                        //             color: Theme.of(context)
                        //                 .colorScheme
                        //                 .onBackground,
                        //           ),
                        // ),
                        // AppPadding(multipliedBy: 0.6),
                        // Text(
                        //   "Highlights",
                        //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        //         fontSize: 12,
                        //         fontWeight: FontWeight.w600,
                        //         color: Theme.of(context).colorScheme.inverseSurface,
                        //       ),
                        // ),
                        // AppPadding(multipliedBy: 0.6),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Container(
                        //       margin: const EdgeInsetsDirectional.fromSTEB(
                        //         0,
                        //         8,
                        //         10,
                        //         0,
                        //       ),
                        //       height: 5,
                        //       width: 5,
                        //       decoration: BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         color: Theme.of(context).colorScheme.inverseSurface,
                        //       ),
                        //     ),
                        //     Text("Lorem ipsum dolor sit amet ")
                        //   ],
                        // ),
                        AppPadding(multipliedBy: 0.6),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            widget.productData?.avatar?.length ?? 0,
                            (index) => Container(
                              width: 8,
                              height: 2,
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: index == _currentPage
                                    ? AppColorScheme.primaryColor
                                    : Color.fromARGB(109, 146, 96, 232),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // AppPadding(multipliedBy: 0.6),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                translation.isArabic
                                    ? widget.productData?.nameAr ??
                                        widget.productData?.nameEn ??
                                        ""
                                    : translation.isFrench
                                        ? widget.productData?.nameFr ??
                                            widget.productData?.nameEn ??
                                            ""
                                        : widget.productData?.nameEn ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontSize: 20,
                                    ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Column(
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'MAD ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground),
                                        ),
                                        TextSpan(
                                          text:
                                              "${widget.productData?.variants?[selectedVarient].price.toString().split('.').first ?? ""}",
                                          // "${widget.productData?.variants?.first.price.toString().split('.').first ?? ""}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w400,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'MAD ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  ?.copyWith(
                                                      fontSize: 9.79,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColorScheme
                                                          .primaryColorDark),
                                            ),
                                            TextSpan(
                                              text:
                                                  "${widget.productData?.variants?[selectedVarient].reductionPrice.toString().split('.').first ?? ""}",

                                              //"${widget.productData?.variants?.first.price.toString().split('.').first ?? ""}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  ?.copyWith(
                                                      fontSize: 13.47,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColorScheme
                                                          .primaryColorDark),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Transform(
                                        transform: Matrix4.identity()
                                          ..translate(0.0, 4.50)
                                          ..rotateZ(-0.15),
                                        child: Container(
                                          width: 50,
                                          height: 1,
                                          decoration: BoxDecoration(
                                              color: AppColorScheme
                                                  .primaryColorDark),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),

                          SizedBox(
                            height: 30,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.productData?.variants?.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedVarient = index;
                                        _totalPrice();

                                        final cartItem = _cartList.firstWhere(
                                          (element) =>
                                              element.variant?.id ==
                                              widget
                                                  .productData
                                                  ?.variants?[selectedVarient]
                                                  .id,
                                          // element.product!.id == widget.productData!.id,
                                          orElse: () => Cart(),
                                        );

                                        print(
                                            "ProductDetilasCartItem${cartItem}");
                                        if (cartItem.id != null) {
                                          setState(() {
                                            _cartList = _cartList;
                                            _isInCart = true;
                                            _itemQuantity =
                                                cartItem.quantity ?? 1;
                                            _cartItem = cartItem;
                                          });
                                        } else {
                                          setState(() {
                                            _cartList = _cartList;
                                            _isInCart = false;
                                            _itemQuantity = 1;
                                            _cartItem = null;
                                          });
                                        }
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              AppConstants.defaultPadding / 3),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      // width: 60,
                                      // height: 24,
                                      decoration: ShapeDecoration(
                                        color: selectedVarient != index
                                            ? Colors.transparent
                                            : AppColorScheme.backgroundLight,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 0.50,
                                              color: selectedVarient != index
                                                  ? AppColorScheme.grey
                                                  : AppColorScheme.primaryColor
                                              // AppColorScheme.primaryColorDark
                                              ),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${widget.productData?.variants?[index].name ?? "_"}",
                                          // widget.productData?.variants?.firstOrNull?.name ?? "_",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              ?.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                              ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          AppPadding(
                            multipliedBy: 0.11,
                          ),

                          // Container(
                          // color: Colors.yellow,
                          //  height: 250,
                          // child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                translation
                                    .of('product_page.about_this_product'),
                                //"About this product",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                              ),
                              SizedBox(
                                  height: AppConstants.defaultPadding * 0.1),
                              Text(
                                translation.isArabic
                                    ? widget.productData?.descriptionAr ??
                                        widget.productData?.descriptionEn ??
                                        ""
                                    : translation.isFrench
                                        ? widget.productData?.descriptionFr ??
                                            widget.productData?.descriptionEn ??
                                            ""
                                        : widget.productData?.descriptionEn ??
                                            "_",
                                // widget.productData?.descriptionEn ?? "_",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                              ),
                              SizedBox(
                                  height: AppConstants.defaultPadding * 0.1),
                              Text(
                                translation.of('product_page.highlights'),
                                //"Highlights",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                              ),
                            ],
                          ),
                          // ),
                        ],
                      )),

                  // Container(
                  //   height: 87,
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: AppConstants.defaultPadding / 2,
                  //       vertical: AppConstants.defaultPadding / 3),
                  //   decoration: BoxDecoration(
                  //     color: Theme.of(context).colorScheme.surface,
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(AppConstants.cornerRadius),
                  //       topRight: Radius.circular(AppConstants.cornerRadius),
                  //     ),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: AppColorScheme.onBlack.withOpacity(0.2),
                  //         blurRadius: 10,
                  //       ),
                  //     ],
                  //   ),
                  //   width: double.maxFinite,
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //        // Expanded(
                  //        // flex: 5,
                  //        // child: Text(
                  //        //   widget.productData?.nameEn ?? "",
                  //        //   style: Theme.of(context)
                  //        //       .textTheme
                  //        //       .subtitle2
                  //        //       ?.copyWith(
                  //        //           fontWeight: FontWeight.w600,
                  //        //           color: Theme.of(context)
                  //        //               .colorScheme
                  //        //               .onBackground,
                  //        //           fontSize: 14,
                  //        //           fontFamily: AppConstants.defaultFont),
                  //        //   overflow: TextOverflow.ellipsis,
                  //        //   maxLines: 2,
                  //        // ),
                  //        // ),
                  //       Expanded(
                  //         flex: 5,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.end,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                  // Text(
                  //                  //   widget.productData?.variants?.firstOrNull
                  //                  //           ?.name ??
                  //                  //       "_",
                  //                  //   style: Theme.of(context)
                  //                  //       .textTheme
                  //                  //       .caption
                  //                  //       ?.copyWith(
                  //                  //         fontWeight: FontWeight.w500,
                  //                  //         color: Theme.of(context)
                  //                  //             .colorScheme
                  //                  //             .onBackground
                  //                  //             .withOpacity(0.5),
                  //                  //       ),
                  //                  // ),
                  //                  // Text(
                  //                  //   "₹ "
                  //                  //   "${widget.productData?.variants?.first.price.toString().split('.').first ?? ""}",
                  //                  //   style: Theme.of(context)
                  //                  //       .textTheme
                  //                  //       .subtitle1
                  //                  //       ?.copyWith(
                  //                  //           fontWeight: FontWeight.w500,
                  //                  //           color: Theme.of(context)
                  //                  //               .colorScheme
                  //                  //               .onBackground),
                  //                  // )
                  //               ],
                  //             ),
                  //             SizedBox(width: AppConstants.defaultPadding / 4),
                  //             if (isInStock)
                  //               _isInCart == true
                  //                   ? IncrementDecrementButton(
                  //                        // height: 42,
                  //                        // width: 118,
                  //                       borderRadius: 8,
                  //                        // cartItemId: _cartItem!.id!,
                  //                       cartItemId: _cartItem?.id ?? "",
                  //                       itemQuantity: _itemQuantity,
                  //                       maximumQuantity: _cartItem
                  //                               ?.variant?.maximumQuantity ??
                  //                           10,
                  //                       minimumQuantity: _cartItem
                  //                               ?.variant?.minimumQuantity ??
                  //                           1,
                  //                       pincode: userData.pinCode,
                  //                     )
                  //                   : AddToCartButtonNew(
                  //                        // height: 42,
                  //                        // width: 118,
                  //                       borderRadius: 8,
                  //                       choiceId: widget.productData?.variants
                  //                               ?.first.id ??
                  //                           "",
                  //                       deviceId: App().deviceId!,
                  //                       pincode: userData.pinCode,
                  //                       productId: widget.productData?.id ?? "",
                  //                       quantity: widget.productData?.variants
                  //                               ?.first.minimumQuantity ??
                  //                           1,
                  //                     )
                  //             else
                  //               OutOfStockButton(
                  //                  // height: 42,
                  //                  // width: 118,
                  //                 borderRadius: 8,
                  //               ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 87,
          //87
          padding: EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding / 2,
              vertical: AppConstants.defaultPadding / 3),
          decoration: BoxDecoration(
            color:
                // Colors.yellow,
                Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppConstants.cornerRadius),
              topRight: Radius.circular(AppConstants.cornerRadius),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColorScheme.onBlack.withOpacity(0.2),
                blurRadius: 10,
              ),
            ],
          ),
          width: double.maxFinite,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Expanded(
              // flex: 5,
              // child: Text(
              //   widget.productData?.nameEn ?? "",
              //   style: Theme.of(context)
              //       .textTheme
              //       .subtitle2
              //       ?.copyWith(
              //           fontWeight: FontWeight.w600,
              //           color: Theme.of(context)
              //               .colorScheme
              //               .onBackground,
              //           fontSize: 14,
              //           fontFamily: AppConstants.defaultFont),
              //   overflow: TextOverflow.ellipsis,
              //   maxLines: 2,
              // ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   widget.productData?.variants?.firstOrNull
                  //           ?.name ??
                  //       "_",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .caption
                  //       ?.copyWith(
                  //         fontWeight: FontWeight.w500,
                  //         color: Theme.of(context)
                  //             .colorScheme
                  //             .onBackground
                  //             .withOpacity(0.5),
                  //       ),
                  // ),
                  // Text(
                  //   "₹ "
                  //   "${widget.productData?.variants?.first.price.toString().split('.').first ?? ""}",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .subtitle1
                  //       ?.copyWith(
                  //           fontWeight: FontWeight.w500,
                  //           color: Theme.of(context)
                  //               .colorScheme
                  //               .onBackground),
                  // )
                ],
              ),
              SizedBox(width: AppConstants.defaultPadding / 4),
              //  if (isInStock)
              //    _isInCart == true
              //       ?
              //          IncrementDecrementButton(
              //                height: 42,
              //               // width: 118,
              //             borderRadius: 8,
              //               // cartItemId: _cartItem!.id!,
              //             cartItemId: _cartItem?.id ?? "",
              //             itemQuantity: _itemQuantity,
              //             maximumQuantity: _cartItem
              //                     ?.variant?.maximumQuantity ??
              //                 10,
              //             minimumQuantity: _cartItem
              //                     ?.variant?.minimumQuantity ??
              //                 1,
              //             pincode: userData.pinCode,
              //           )
              //       :
              //       OutOfStockButton(
              //         // height: 42,
              //         // width: 118,
              //       borderRadius: 8,
              //     )
              //         // AddToCartButtonNew(
              //         //      height: 48,
              //         //        //48
              //         //        width: double.infinity,
              //         //     borderRadius: 8,
              //         //     choiceId: widget.productData?.variants
              //         //             ?.first.id ??
              //         //         "",
              //         //     deviceId: App().deviceId!,
              //         //     pincode: userData.pinCode,
              //         //     productId: widget.productData?.id ?? "",
              //         //     quantity: widget.productData?.variants
              //         //             ?.first.minimumQuantity ??
              //         //         1,
              //         //         //text: "Add to cart",
              //         //  )
              //   else
              //     OutOfStockButton(
              //         // height: 42,
              //         // width: 118,
              //       borderRadius: 8,
              //     ),

              if (isInStock)
                _isInCart == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                translation.of('product_page.total_price'),
                                // 'Total price',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      AppColorScheme.onBlack.withOpacity(0.50),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'MAD',
                                      style: TextStyle(
                                        color: AppColorScheme.onBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${totalPrice}',
                                      style: TextStyle(
                                        color: AppColorScheme.onBlack,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: AppConstants.defaultPadding * 3.15,
                          ),
                          IncrementDecrementButton(
                            // height: 42,
                            // width: 118,
                            //  width: _itemQuantity.toString().length < 2
                            //       ? 100
                            //       : 118,

                            borderRadius: 8,
                            cartItemId: _cartItem!.id ?? "",
                            // cartItemId: _cartItem?.id ?? "",
                            itemQuantity: _itemQuantity,
                            maximumQuantity:
                                _cartItem?.variant?.maximumQuantity ?? 10,
                            minimumQuantity:
                                _cartItem?.variant?.minimumQuantity ?? 1,
                            pincode: userData.pinCode,
                          ),
                          SizedBox(
                            width: AppConstants.defaultPadding * 0.55,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartBottomBar(),
                                  ));
                              print(
                                  "ChoiceID:${widget.productData?.variants?.first.id ?? ""}==${widget.productData?.variants?.first.name ?? ""}");
                              print(
                                  "Depricated choiceID:${widget.productData?.variants?[selectedVarient].id ?? ""}");
                              print(
                                  "ProductID:${widget.productData?.id ?? ""}==${widget.productData?.nameEn ?? ""}");
                              print(
                                  "VarientID:${widget.productData?.variants?[selectedVarient].id ?? ""}==${widget.productData?.variants?[selectedVarient].name ?? ""}}");
                            },
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: ShapeDecoration(
                                color: AppColorScheme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Badge(
                                  stackFit: StackFit.loose,
                                  position: badges.BadgePosition.topEnd(
                                      top: 15, end: 10),
                                  badgeContent: Container(
                                    width: 0.1,
                                    height: 0.1,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColorScheme.accentColorLight,
                                    ),
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Iconsax.shopping_bag,
                                    color: AppColorScheme.onPrimaryLight,
                                  ))),
                            ),
                          )
                        ],
                      )
                    : AddToCartButtonNew(
                        height: 42,
                        width: 320,
                        borderRadius: AppConstants.cornerRadiuscircleMin,
                        choiceId:
                            // widget.productData?.variants?[selectedVarient].id ?? "",
                            widget.productData?.variants?.first.id ?? "",
                        deviceId: App().deviceId!,
                        pincode: userData.pinCode,
                        productId:
                            //  widget.productData?.variants?[selectedVarient].id ??"",
                            widget.productData?.id ?? "",
                        quantity: widget.productData?.variants?[selectedVarient]
                                .minimumQuantity ??
                            1,
                        // widget.productData?.variants?.first.minimumQuantity ?? 1,
                        variantChoiceId:
                            widget.productData?.variants?[selectedVarient].id ??
                                "",
                        // widget.productData?.variants?.first.id ?? "",
                        text: translation.of('product_page.add_to_cart')
                        //"Add to cart",
                        )
              else
                OutOfStockButton(
                  height: 42,
                  width: 320,
                  borderRadius: AppConstants.cornerRadiuscircleMin,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
