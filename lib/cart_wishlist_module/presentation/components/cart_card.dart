import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base_module/presentation/component/buttons/delete_button.dart';
import '../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../base_module/presentation/core/values/app_assets.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../../catalogue_module/domain/models/sub_choices.dart';
import '../../../catalogue_module/presentation/components/custom_quantity_widget.dart';
import '../../../user_module/domain/user_data.dart';
import '../../domain/models/cart.dart';
import '../feature/cart/blocs/cart_bloc/cart_bloc.dart';
import '../feature/cart/blocs/cart_bloc/cart_event.dart';

class CartCard extends StatefulWidget {
  CartCard({required this.cartItem});
  final Cart cartItem;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  double _textBoxWidth = 180;
  Cart? cart;
  // var base64 = Base64Codec();
  // late List<String> urlList;

  @override
  void initState() {
    cart = widget.cartItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // widget.cartItem.product.variant?.choices?.forEach((element) {
    //   if (element?.choiceId == widget.cartItem.choice) {
    //     _choice = element;
    //     // debugPrint("choice id set is ${_choice?.choiceId}");
    //   }
    // });
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.cornerRadius)),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding * 0.8,
            vertical: AppConstants.defaultPadding * 0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _productInfo(_textBoxWidth, context),
            Divider(
              thickness: 1,
            ),
            _productRate(_textBoxWidth, context)
          ],
        ),
      ),
    );
  }

  // Column _productRate(double _textBoxWidth, BuildContext context) {
  //   double total = 0.0;
  //   double discountPrice = 0.0;
  //   SubChoice?  _subChoiceData;
  //
  //   if (cart?.variant?.price != null) {
  //     double rate = (cart!.variant!.price!);
  //     double reduction = (double.parse(cart?.variant?.reductionPrice != null
  //         ? "${cart!.variant!.reductionPrice!}"
  //         : "0.0"));
  //     total = ((rate - reduction) * (widget.cartItem.quantity ?? 1));
  //   } else {
  //     total = 0.0;
  //   }
  //
  //   // if(cart?.variant?.reductionPrice != null){
  //   //   discountPrice = widget.cartItem.quantity!* cart!.variant!.reductionPrice!.toDouble() ;
  //   // }else{
  //   //   discountPrice = 0.0;
  //   // };
  //   //
  //   if(cart?.variant?.subChoices != null){
  //     final subChoiceData = cart?.variant?.subChoices?.firstWhere(
  //           (element) => element.id == cart?.variantChoice,
  //       orElse: () => SubChoice(),
  //     );
  //     _subChoiceData =subChoiceData;
  //   }
  //
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       AppPadding(dividedBy: 6,),
  //    Row(
  //      mainAxisAlignment: MainAxisAlignment.start,
  //      crossAxisAlignment: CrossAxisAlignment.start,
  //      children: [
  //        InkWell(
  //            onTap: (){
  //              print(cart?.variant?.subChoices);
  //              print(cart?.variantChoice);
  //            },
  //            child: Text("Choice : ",style: Theme.of(context).textTheme.bodyLarge,)),
  //        Text(_subChoiceData?.name ??"",style: Theme.of(context).textTheme.bodyLarge,)
  //
  //      ],
  //    ),
  //       AppPadding(dividedBy: 8,),
  //
  //       Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Text("Discount : ",style: Theme.of(context).textTheme.bodyLarge),
  //           Text("₹${discountPrice }",style: Theme.of(context).textTheme.bodyLarge),
  //         ],
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Container(
  //             width: _textBoxWidth * 0.5,
  //             child: Text(
  //               "₹ ${total}",
  //               style: Theme.of(context).textTheme.headline6,
  //             ),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               DeleteButton(
  //                 onPressed: () {
  //                   BlocProvider.of<CartBloc>(context).add(CartDeleteEvent(
  //                       cartId: widget.cartItem.cartId,
  //                       productId: widget.cartItem.product?.productId,
  //                       choiceId: widget.cartItem.variant?.variantId ?? "00000"));
  //                 },
  //                 // id: "$id",
  //               ),
  //               Container(
  //                 child: CustomQuantityWidget(
  //                   onAddPressed: () {
  //                     BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
  //                         pincode: userData.pinCode,
  //                         cartId: widget.cartItem.cartId,
  //                         quantity: (widget.cartItem.quantity ?? 0) + 1));
  //                   },
  //                   onRemovePressed: () {
  //                     BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
  //                         pincode: userData.pinCode,
  //                         cartId: widget.cartItem.cartId,
  //                         quantity: (widget.cartItem.quantity ?? 1) - 1));
  //
  //                     if (widget.cartItem.quantity == 1) {
  //                       BlocProvider.of<CartBloc>(context).add(CartDeleteEvent(
  //                           cartId: widget.cartItem.cartId,
  //                           productId: widget.cartItem.product?.productId,
  //                           choiceId:
  //                               widget.cartItem.variant?.variantId ?? "0000"));
  //                     }
  //                   },
  //                   quantity: widget.cartItem.quantity.toString(),
  //                 ),
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     ],
  //   );
  // }




  Column _productRate(double _textBoxWidth, BuildContext context) {
    double total = 0.0;
    double originalPrice = 0.0;
    double discountPrice = 0.0;
    SubChoice?  _subChoiceData;
    
    if(cart?.variant?.subChoices != null){
    

        final subChoiceData = cart?.variant?.subChoices?.firstWhere(
              (element) => element.id == cart?.variantChoice,
          orElse: () => SubChoice(),
        );
        _subChoiceData =subChoiceData;
        originalPrice = (cart?.variant?.price ?? 0 + _subChoiceData!.choicePrice!.toDouble())*widget.cartItem.quantity!.toDouble() ;
        double rate = cart?.variant?.price ??0.0  +  subChoiceData!.choicePrice!.toDouble();
        double reduction = cart?.variant?.reductionPrice ?? 0.0;
        total =  ((rate - reduction) * (widget.cartItem.quantity ?? 1));
        // discountPrice = widget.cartItem.quantity ?? 1* cart!.variant!.reductionPrice!.toDouble() ;
        discountPrice = widget.cartItem.quantity! * ( cart?.variant?.reductionPrice !=null ?
            cart!.variant!.reductionPrice!.toDouble():0.0) ;
      

    }else{
      if (cart?.variant?.price != null) {
        double rate = (cart?.variant?.price ?? 0.0);
        double reduction = (double.parse(cart?.variant?.reductionPrice != null
            ? "${cart!.variant!.reductionPrice!}"
            : "0.0"));
        discountPrice = widget.cartItem.quantity! * ( cart?.variant?.reductionPrice !=null ?
        cart!.variant!.reductionPrice!.toDouble():0.0) ;
        total = ((rate - reduction) * (widget.cartItem.quantity ?? 1));
        originalPrice = rate * widget.cartItem.quantity!.toDouble();
      } else {
        total = 0.0;
        discountPrice =0.0;
        originalPrice =0.0;
      }
    }



    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppPadding(dividedBy: 6,),
        cart?.variantChoice ==null?SizedBox():
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: (){
                  print(cart?.variant?.subChoices);
                  print(cart?.variantChoice);
                },
                child: Text("Choice : ",style: Theme.of(context).textTheme.bodyLarge,)),
            Text(_subChoiceData?.name ??"",style: Theme.of(context).textTheme.bodyLarge,)

          ],
        ),
        cart?.variantChoice ==null?SizedBox():
        AppPadding(dividedBy: 8,),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Price : ",style: Theme.of(context).textTheme.bodyLarge),
            Text("₹ ${originalPrice}",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                // decoration: TextDecoration.lineThrough
            ),),

          ],
        ), Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Discount : ",style: Theme.of(context).textTheme.bodyLarge),
            Text("₹ ${discountPrice }",style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _textBoxWidth * 0.5,
              child: Text(
                "₹ ${total}",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DeleteButton(
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context).add(CartDeleteEvent(
                        cartId: widget.cartItem.cartId,
                        productId: widget.cartItem.product?.productId,
                        choiceId: widget.cartItem.variant?.variantId ?? "00000"));
                  },
                  // id: "$id",
                ),
                Container(
                  child: CustomQuantityWidget(
                    onAddPressed: () {
                      BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
                          pincode: userData.pinCode,
                          cartId: widget.cartItem.cartId,
                          quantity: (widget.cartItem.quantity ?? 0) + 1));
                    },
                    onRemovePressed: () {
                      BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
                          pincode: userData.pinCode,
                          cartId: widget.cartItem.cartId,
                          quantity: (widget.cartItem.quantity ?? 1) - 1));

                      if (widget.cartItem.quantity == 1) {
                        BlocProvider.of<CartBloc>(context).add(CartDeleteEvent(
                            cartId: widget.cartItem.cartId,
                            productId: widget.cartItem.product?.productId,
                            choiceId:
                            widget.cartItem.variant?.variantId ?? "0000"));
                      }
                    },
                    quantity: widget.cartItem.quantity.toString(),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }




  Row _productInfo(double _textBoxWidth, BuildContext context) {


    // debugPrint("productInfo choice is ${_choice.toString()}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(

          width: 70,
          child: widget.cartItem.product?.thumbnailImage != null
              ? Image.network(
                  AppConstants.filesUrl +
                      widget.cartItem.product!.thumbnailImage!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, object, stackTrace) =>  Image.asset(ThemeAssets.dummy_image_product,fit: BoxFit.cover),
                )
              : Container(
            child: Image.asset(ThemeAssets.dummy_image_product,fit: BoxFit.cover),
          ),
          // child: urlList.length == 2
          //     ? Image.memory(base64.decode("${urlList[1]}"))
          //     : Image.network(
          //         AppConstants.filesUrl + urlList[0],
          //         errorBuilder: (context, stackTrace, error) {
          //           return Image.network(
          //             AppConstants.dummyImage,
          //             fit: BoxFit.cover,
          //           );
          //         },
          //         fit: BoxFit.cover,
          //       ),
        ),
        const AppPadding(),
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: _textBoxWidth,
                  child: Text(
                    "${widget.cartItem.product?.nameEn ?? ""}",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(),
                  ),
                ),
                // AppPadding(
                //   dividedBy: 8,
                // ),
                Text( "${widget.cartItem.product?.brand?.name ?? ""}", style: Theme.of(context).textTheme.subtitle2!.copyWith()),
                const AppPadding(
                  dividedBy: 6,
                ),
                Container(
                  width: _textBoxWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        child: Text(cart?.variant?.name ?? "",
                            style: Theme.of(context).textTheme.subtitle2!),
                      ),
                      const AppPadding(
                        dividedBy: 3,
                      ),
                      Container(
                        width: _textBoxWidth * 0.4,
                        child: Text(
                            "₹ ${cart?.variant?.price == null ? "N/A" : (cart!.variant!.price! - (double.tryParse(cart?.variant?.reductionPrice != null ? "${cart?.variant!.reductionPrice!}" : "0.0") ?? 0))}",
                            style: Theme.of(context).textTheme.bodyText2!),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // DeleteButton(
        //   id: "$id",
        // )
      ],
    );
  }
}
