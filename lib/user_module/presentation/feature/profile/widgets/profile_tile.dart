import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../domain/entity/authentication.dart';
import '../../../core/values/user_router.dart';
import '../../authentication/blocs/authentication/authentication_bloc.dart';

class ProfileTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return authentication.isAuthenticated
            ? TextButton(
                onPressed: () {
                  Navigator.pop(context);

                  final currentRoute = ModalRoute.of(context)?.settings.name;

                  if (currentRoute != UserRouter.profileScreen) {
                    Navigator.pushNamed(
                      context,
                      UserRouter.profileScreen,
                    );
                  }
                },
                child: Text(translation.of("profile")),
              )
            : const SizedBox();
      },
    );
  }
}
