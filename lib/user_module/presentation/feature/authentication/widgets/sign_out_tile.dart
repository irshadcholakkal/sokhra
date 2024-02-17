import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';

import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../domain/entity/authentication.dart';
import '../blocs/authentication/authentication_bloc.dart';
import 'sign_out_dialog.dart';

class SignOutTile extends StatelessWidget {
  const SignOutTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return authentication.isAuthenticated
            ? Column(
                children: [
                  _divider(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);

                      showDialog(
                        context: context,
                        builder: (_) {
                          return SignOutDialog();
                        },
                      );
                    },
                    child: Text(
                      translation.of("user.sign_out"),
                    ),
                  ),
                  // DrawerTile(
                  //   svgAsset: UserAssets.SIGN_OUT,
                  //   title: translation.of("user.sign_out"),
                  //   showTrailing: false,
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //
                  //     showDialog(
                  //       context: context,
                  //       builder: (_) {
                  //         return SignOutDialog();
                  //       },
                  //     );
                  //   },
                  // ),
                  _divider(),
                ],
              )
            : SizedBox();
      },
    );
  }

  Widget _divider() {
    return Divider(
      height: 0,
      thickness: 1,
      color: AppColorScheme.onPrimaryLight.withOpacity(0.4),
    );
  }
}
