import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';

import '../../../../domain/entity/authentication.dart';
import '../../authentication/blocs/authentication/authentication_bloc.dart';
import '../blocs/profile/profile_bloc.dart';

class UserGreetingCard extends StatefulWidget {
  @override
  _UserGreetingCardState createState() => _UserGreetingCardState();
}

class _UserGreetingCardState extends State<UserGreetingCard> {
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

          return Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 60,
              bottom: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hi",
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColorScheme.onPrimaryLight,
                      ),
                ),
                if (name.isNotEmpty)
                  Text(
                    "$name,",
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColorScheme.onPrimaryLight,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  )
                else
                  const SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
