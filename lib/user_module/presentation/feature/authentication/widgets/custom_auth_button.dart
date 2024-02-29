import 'package:flutter/material.dart';

import '../../../../../base_module/domain/entity/translation.dart';
import '../../demo/screen/on_boarding_screen.dart';

class GuestSignIn extends StatelessWidget {
  const GuestSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
           Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => OnBoardingScreen(),
              ),
              (route) => false);
        },
        child: Text(translation.of('user.sign_in')),
      ),
    );
  }
}