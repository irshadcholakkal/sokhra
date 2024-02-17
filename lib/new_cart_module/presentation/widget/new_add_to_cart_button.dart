
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../base_module/domain/entity/color_scheme.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../blocs/new_add_to_cart_bloc/new_add_to_cart_bloc.dart';
import '../blocs/new_add_to_cart_bloc/new_add_to_cart_event.dart';
import '../blocs/new_add_to_cart_bloc/new_add_to_cart_state.dart';
import '../blocs/new_cart_bloc/new_cart_bloc.dart';
import '../blocs/new_cart_bloc/new_cart_event.dart';

class AddToCartButtonNew extends StatefulWidget {
  final String choiceId;
  final String productId;
  final String deviceId;
  final int quantity;
  final String pincode;
  final double? borderRadius;
  final double? width;
  final double? height;
  final String text;
  final String variantChoiceId;

  const AddToCartButtonNew({
    Key? key,
    required this.choiceId,
    required this.deviceId,
    required this.pincode,
    required this.productId,
    required this.quantity,
    this.borderRadius,
    this.width,
    this.height, 
    required this.text,
     required this.variantChoiceId,
  }) : super(key: key);

  @override
  State<AddToCartButtonNew> createState() => _AddToCartButtonNewState();
}

class _AddToCartButtonNewState extends State<AddToCartButtonNew> {
  final _addToCartBloc = NewAddToCartBloc();

  @override
  void dispose() {
    _addToCartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 88,
      height: widget.height ?? 36,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: AppColorScheme.primaryColor,
        // ),
        color: AppColorScheme.primaryColor,
        borderRadius: BorderRadius.circular(
          widget.borderRadius ?? AppConstants.cornerRadius / 3,
        ),
      ),
      child: BlocConsumer<NewAddToCartBloc, NewAddToCartState>(
        bloc: _addToCartBloc,
        listener: (context, state) {
          BlocProvider.of<NewCartBloc>(context).add(
            FetchCartItems(
              pincode: widget.pincode,
            ),
          );
        },
        builder: (context, state) {
          if (state is AddToCartButtonLoading) {
            return Center(
              child: CupertinoActivityIndicator(
                color: AppColorScheme.primaryColor,
              ),
            );
          } else {
            return InkWell(
              onTap: () {
                _addToCartBloc.add(
                  AddItemToCart(
                    choiceId: widget.choiceId,
                    deviceId: widget.deviceId,
                    pincode: widget.pincode,
                    productId: widget.productId,
                    quantity: widget.quantity,
                    variantChoiceId: widget.variantChoiceId
                  ),
                );
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.shopping_bag,size: 18,color:AppColorScheme.onPrimaryLight,),
                    SizedBox(width: 10,),
                    Text(
                      widget.text,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: AppColorScheme.onPrimaryLight,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 16
                          ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
