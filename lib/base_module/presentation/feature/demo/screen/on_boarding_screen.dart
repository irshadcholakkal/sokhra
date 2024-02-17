import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lumiereorganics_app/base_module/presentation/component/app_icons/app_icon_large.dart';
import 'package:lumiereorganics_app/user_module/presentation/feature/sign_in/screens/intro_screen.dart';
import 'package:lumiereorganics_app/base_module/presentation/feature/demo/screen/mobile_number_sign_up_screen.dart';
import 'package:lumiereorganics_app/home/feature/home/screens/home_screen.dart';
import '../../../../domain/entity/color_scheme.dart';
import '../../../component/padding/app_padding.dart';
import '../../../core/values/app_constants.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColorScheme.backgroundColorLight,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // SizedBox(height: AppConstants.defaultPadding * 1),
            AppIconLarge(),
            AppPadding(multipliedBy: 9),
            SizedBox(
              width: 261,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Let’s find the ',
                      style: TextStyle(
                        color: AppColorScheme.onBlack,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'Best',
                      style: TextStyle(
                        color: AppColorScheme.primaryColor,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' & ',
                      style: TextStyle(
                        color: AppColorScheme.onBlack,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'Healthy',
                      style: TextStyle(
                        color: AppColorScheme.primaryColor,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' Grocery',
                      style: TextStyle(
                        color: AppColorScheme.onBlack,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 284,
              child: Text(
                'Lorem ipsum door sit amet, lorem ipsum door sit amet, Lorem ipsum door sit amet, lorem ipsum door sit amet.',
                style: TextStyle(
                  color: AppColorScheme.onBlack.withOpacity(0.50),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (route) => false);
              },
              child: Container(
                // width: 343,
                height: 56,
                decoration: ShapeDecoration(
                  color: AppColorScheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                //padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Center(
                  child: Text(
                    'Let’s Explore',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColorScheme.scaffoldBackgroundColorLightTwo,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ));
              },
              child: Container(
                width: double.infinity,
                height: 56,
                // clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1, color: AppColorScheme.tertiaryLight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColorScheme.primaryColor,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.10,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: SizedBox(
                // width: 343,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'New User ?',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColorScheme.onBlack.withOpacity(0.5),
                            fontSize: 12,
                            fontFamily: 'Poppins'),
                        //  TextStyle(
                        //   color: AppColorScheme.onBlack.withOpacity(0.5),
                        //   fontSize: 12,
                        //   fontFamily: 'Poppins',
                        //   fontWeight: FontWeight.w400,
                        // ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColorScheme.onBlack.withOpacity(0.5),
                            fontSize: 12,
                            fontFamily: 'Poppins'),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColorScheme.primaryColor,
                            fontSize: 12,
                            fontFamily: 'Poppins'),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MobileNumberScreenForSignUp(),
                                ));
                          }),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
