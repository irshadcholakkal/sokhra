import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lumiereorganics_app/base_module/presentation/component/app_icons/app_icon_large.dart';
import 'package:lumiereorganics_app/user_module/presentation/feature/sign_in/screens/intro_screen.dart';
import 'package:lumiereorganics_app/user_module/presentation/feature/demo/screen/mobile_number_sign_up_screen.dart';
import 'package:lumiereorganics_app/home/feature/home/screens/home_screen.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  TextStyle? get _homeTitleStyle =>
      Theme.of(context).textTheme.subtitle1?.copyWith(
            fontWeight: FontWeight.w600,
            
            fontSize: 24,
            color: Theme.of(context).colorScheme.onBackground,
          );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).canvasColor,
      //AppColorScheme.backgroundColorLight,
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
                        text: translation.of("user.letsfindthe"),
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: AppColorScheme.onBlack,
                              fontSize: 24,
                              
                              fontWeight: FontWeight.w600,
                            )
                        
                        ),
                    TextSpan(
                      text: translation.of("user.best"),
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: AppColorScheme.primaryColor,
                              fontSize: 24,
                              
                              fontWeight: FontWeight.w600,
                            )
                      
                      
                    ),
                    TextSpan(
                      text: ' & ',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: AppColorScheme.onBlack,
                              fontSize: 24,
                              
                              fontWeight: FontWeight.w600,
                            )
                              ),
                    TextSpan(
                      text: translation.of("user.healthy"),
                      style:Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: AppColorScheme.primaryColor,
                              fontSize: 24,
                              
                              fontWeight: FontWeight.w600,
                     ) ),
                    TextSpan(
                      text: translation.of("user.grocery"),
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: AppColorScheme.onBlack,
                              fontSize: 24,
                              
                              fontWeight: FontWeight.w600,
                            )
                                         ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppConstants.defaultPadding* 0.8,
            ),
            SizedBox(
              child: Text(
                translation.of("user.lorem_ipsum"),
                style:Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: AppColorScheme.onBlack.withOpacity(0.50),
                              fontSize: 12,
                              
                              fontWeight: FontWeight.w400,
                            )
                
              ),
            ),
            SizedBox(
              height: AppConstants.defaultPadding* 1.1,
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
                    borderRadius: BorderRadius.circular(AppConstants.cornerRadiusMin),
                  ),
                ),
                child: Center(
                  child: Text(
                  translation.of("user.LetsExplore"),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: AppColorScheme.scaffoldBackgroundColorLightTwo,
                              fontSize: 14,
                              
                              fontWeight: FontWeight.w500,
                            )
                   
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppConstants.defaultPadding* 0.6,
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
                    borderRadius: BorderRadius.circular(AppConstants.cornerRadiusMin),
                  ),
                ),
                child: Center(
                  child: Text(
                    translation.of("user.sign_in"),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: AppColorScheme.primaryColor,
                              fontSize: 14,
                              
                              fontWeight: FontWeight.w500,
                            )
                    
                  ),
                ),
              ),
            ),
            SizedBox(height: AppConstants.defaultPadding* 0.5),
            Center(
              child: SizedBox(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: translation.of("user.new_user"),
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColorScheme.onBlack.withOpacity(0.5),
                            fontSize: 12,
                           ),
                        
                      ),
                      TextSpan(
                        text: ' ',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColorScheme.onBlack.withOpacity(0.5),
                            fontSize: 12,
                           ),
                      ),
                      TextSpan(
                        text: translation.of("user.signup"),
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColorScheme.primaryColor,
                            fontSize: 12,
                           ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MobileNumberScreenForSignUp(),
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
