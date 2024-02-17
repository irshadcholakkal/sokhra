import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_bloc.dart';
import '../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_event.dart';
import '../../core/values/app_constants.dart';

class CartQuantityButton extends StatefulWidget {
  final bool loading;
  final int count;
  final Function onIncrement;
  final Function onDecrement;
  final String id;
  final String productId;

  const CartQuantityButton({
    Key? key,
    this.loading = false,
    required this.id,
    required this.productId,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  _CreateOrderCountUpdaterState createState() =>
      _CreateOrderCountUpdaterState();
}

class _CreateOrderCountUpdaterState extends State<CartQuantityButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          radius: 14,
          child: IconButton(
              icon: Icon(
                MdiIcons.minus,
                size: 14,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {
                BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
                    cartId: widget.id, quantity: widget.count - 1));

                if (widget.count == 1) {
                  BlocProvider.of<CartBloc>(context).add(CartDeleteEvent(
                      cartId: widget.id,
                      productId: widget.productId,
                      choiceId: ''));
                }
              }
              // => widget.onDecrement(),
              ),
        ),
        Container(
          constraints: const BoxConstraints(
            minWidth: 55,
          ),
          height: AppConstants.defaultPadding,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding / 2,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding / 4,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                AppConstants.defaultPadding,
              ),
            ),
          ),
          child: widget.loading
              ? const CupertinoActivityIndicator()
              : Text(
                  widget.count.toString(),
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
        ),
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          radius: 14,
          child: IconButton(
            icon: Icon(
              MdiIcons.plus,
              size: 14,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              BlocProvider.of<CartBloc>(context).add(CartUpdateEvent(
                  cartId: widget.id, quantity: widget.count + 1));
            },
          ),
        ),
      ],
    );
  }
}
