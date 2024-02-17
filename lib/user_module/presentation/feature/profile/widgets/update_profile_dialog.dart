import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base_module/domain/entity/translation.dart';
import '../blocs/profile/profile_bloc.dart';
import 'profile_edit_view.dart';

class UpdateProfileDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess || state is UpdateProfileFailed) {
          Navigator.maybePop(context);
        }
      },
      child: Dialog(
        child: Column(
          children: [
            Text(translation.of("user.edit_profile")),
            const ProfileEditView(),
          ],
        ),
      ),
    );
  }
}
