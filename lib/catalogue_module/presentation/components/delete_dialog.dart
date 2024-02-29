import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base_module/domain/entity/color_scheme.dart';
import '../../../user_module/presentation/feature/sign_in/screens/intro_screen.dart';
import '../../../user_module/presentation/feature/demo/screen/on_boarding_screen.dart';
import '../../../user_module/presentation/feature/authentication/blocs/authentication/authentication_bloc.dart';

class DeleteAccountDialog extends StatefulWidget {
  const DeleteAccountDialog({Key? key});

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  late AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Are you sure?',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      content: Text(
        'This will permenantly delete your account and data. It may take up to seven days to complete account deletion',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          child: Text(
            'No',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        TextButton(
          onPressed: () async {
            _authenticationBloc.add(SignedOut());
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
                (Route<dynamic> route) => false);
          },
          child: Text(
            'Yes delete',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColorScheme.outOfStockColor,
                ),
          ),
        ),
      ],
    );
  }
}
