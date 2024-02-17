import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../cart_wishlist_module/presentation/core/values/cart_router.dart';
import '../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_bloc.dart';
import '../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_state.dart';
import '../../../../catalogue_module/presentation/core/values/catalogue_router.dart';
import '../../../../payment_module/presentation/core/values/payments_router.dart';
import '../../../../user_module/domain/entity/authentication.dart';
import '../../../../user_module/domain/entity/models/role.dart';
import '../../../../user_module/presentation/core/values/user_router.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          MdiIcons.home,
        ),
        label: "Home",
        // activeColorPrimary: Theme.of(context).colorScheme.primary,
        // inactiveColorPrimary: Theme.of(context).colorScheme.primary,
      ),
      if (authentication.role == Role.CUSTOMER)
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.wallet),
          label: "Wallet",
          // activeColorPrimary: Theme.of(context).colorScheme.primary,
          // inactiveColorPrimary: Theme.of(context).colorScheme.primary,
        ),
      BottomNavigationBarItem(
        icon: Container(
          height: 30,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.all(2),
                child: Icon(
                  MdiIcons.cart,
                ),
              ),
              BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                if (state is ListLoading) {
                  final carts = state.previousCart.cartList ?? [];

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
        label: "Cart",
        // activeColorPrimary: Theme.of(context).colorScheme.primary,
        // inactiveColorPrimary: Theme.of(context).colorScheme.primary,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          MdiIcons.account,
        ),
        label: "Profile",
        // activeColorPrimary: Theme.of(context).colorScheme.primary,
        // inactiveColorPrimary: Theme.of(context).colorScheme.primary,
      ),
    ];
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 29,
      items: _navBarsItems(),
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.primary,
      showUnselectedLabels: true,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamedAndRemoveUntil(
                context, CatalogueRouter.listCatalogue, (route) => false);
            break;
          case 1:
            if (authentication.role == Role.CUSTOMER) {
              Navigator.pushNamedAndRemoveUntil(
                  context, PaymentsRouter.walletScreen, (route) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, CartRouter.cartScreen, (route) => false);
            }
            break;
          case 2:
            if (authentication.role == Role.CUSTOMER) {
              Navigator.pushNamedAndRemoveUntil(
                  context, CartRouter.cartScreen, (route) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, UserRouter.profileScreen, (route) => false);
            }
            break;
          case 3:
            Navigator.pushNamedAndRemoveUntil(
                context, UserRouter.profileScreen, (route) => false);
            break;
          default:
            Navigator.pushNamedAndRemoveUntil(
                context, CatalogueRouter.listCatalogue, (route) => false);
            break;
        }
      },
    );
  }
}
