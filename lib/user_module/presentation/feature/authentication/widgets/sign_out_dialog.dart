import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base_module/domain/entity/translation.dart';
// import 'package:armino_ecom/customer_module/presentation/feature/manage_cart/blocs/cart/cart_bloc.dart';
import '../../../../domain/entity/authentication.dart';
import '../../../core/values/user_router.dart';
import '../blocs/authentication/authentication_bloc.dart';

class SignOutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(translation.of("user.confirm_sign_out")),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          child: Text(
            translation.of('no'),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            await authentication.clearAuthenticatedUser();

            BlocProvider.of<AuthenticationBloc>(context).add(SignedOut());

            // if (authentication.role == Role.VENDOR) {
            //   BlocProvider.of<VendorBloc>(context).add(ClearVendor());
            // }

            // if (authentication.role == Role.CUSTOMER) {
            //   BlocProvider.of<CartBloc>(context).add(ClearCart());
            // }

            Navigator.pushNamedAndRemoveUntil(
              context,
              UserRouter.introScreen,
              (route) => false,
            );
          },
          child: Text(
            translation.of('yes'),
          ),
        ),
      ],
    );
  }
}
