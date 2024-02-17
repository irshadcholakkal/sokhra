import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_bloc.dart';
import '../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_event.dart';
import '../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_state.dart';
import '../../../../user_module/domain/user_data.dart';
import '../../../domain/entity/app.dart';

class CartFab extends StatefulWidget {
  final VoidCallback onPressed;

  const CartFab({Key? key, required this.onPressed}) : super(key: key);

  @override
  _CartFabState createState() => _CartFabState();
}

class _CartFabState extends State<CartFab> {
  String deviceId = app.deviceId!;

  @override
  void initState() {
    super.initState();
    //////check latandlng
    BlocProvider.of<CartBloc>(context).add(
      CartFetchEvent(deviceId: deviceId, lng: userData.lng, lat: userData.lat),
    );
  }

  @override
  Widget build(BuildContext context) {
    // int cartItemCountv = Cart.length;
    return FloatingActionButton(
      onPressed: widget.onPressed,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Center(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: EdgeInsets.all(6),
              height: 30,
              width: 30,
              child: Icon(
                MdiIcons.cart,
                size: 30,
              ),
            ),
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state is ListLoading) {
                return CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 10,
                  child: Center(
                    child: Text(
                      "0",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                );
              } else if (state is ListLoaded) {
                final carts = state.carts.cartList ?? [];

                return CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 10,
                  child: Center(
                    child: Text(
                      carts.length.toString(),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                );
              } else
                return CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 10,
                  child: Center(
                    child: Text(
                      "0",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                );
            }),
          ],
        ),
      ),
    );
  }
}
