import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';

import '../../../../domain/entity/authentication.dart';
import '../../authentication/blocs/authentication/authentication_bloc.dart';
import '../blocs/profile/profile_bloc.dart';

class UserProfileCard extends StatefulWidget {
  @override
  _UserProfileCardState createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          setState(() {});
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          final name = Authentication().nameList?[0] ?? "";
          final phone = authentication.user?.phone ?? "";

          return authentication.isAuthenticated
              ? Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 16,
                  ),
                  color: Theme.of(context).colorScheme.primary,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColorScheme.onPrimaryLight,
                                      ),
                                  maxLines: 1,
                                ),
                                Text(
                                  phone,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: 
                                        AppColorScheme.onPrimaryLight.withOpacity(0.7),
                                      ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
