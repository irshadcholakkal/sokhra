import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app_settings_module/presentation/feature/app_settings/blocs/configurations/configurations_bloc.dart';
import '../../../../../home/feature/home/screens/home_screen.dart';
import '../../../../../home/feature/home/screens/location_screen.dart';
import '../../../../../user_module/domain/entity/authentication.dart';
import '../../../../domain/entity/color_scheme.dart';
import '../../../component/images/custom_image_view.dart';
import '../../../core/values/app_assets.dart';
import '../../../core/values/app_constants.dart';
import 'on_boarding_screen.dart';
import 'update_screen.dart';

class SplashScreen extends StatefulWidget {
  final bool isTimer;

  const SplashScreen({Key? key, this.isTimer = true});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late CurvedAnimation _animation;
  // bool _page=false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      // curve: Curves.fastOutSlowIn,
      curve: Curves.easeIn,
    );

    _animationController.repeat(reverse: true);

    if (widget.isTimer) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      body: BlocListener<ConfigurationsBloc, ConfigurationsState>(
        listener: (context, state) {
          if (state is ConfigurationsFetchSuccessState) {
            if (state.data.settings?.isNotEmpty == true) {
              if (state.data.settings?.first.appVersion?.version ==
                  AppConstants.appVersion) {
                // _navigateToNext();
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateScreen(),
                    ));
              }
            }
          } else if (state is ConfigurationsFetchLoadingState) {}
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColorScheme.primaryColor,
          child: Stack(
            children: [
              Center(
                child:
                    // FadeTransition(
                    //   opacity: _animation,
                    //   child:
                    Padding(
                        padding: EdgeInsets.all(5.0),
                        child:
                            //_page==true?
                            CustomImageView(
                          imagePath: ThemeAssets.textAndIcon,
                          // svgPath: ThemeAssets.splashImage,
                          width: 222,
                          height: 222,
                          fit: BoxFit.fill,
                        )
                        //:CustomImageView(
                        //     imagePath: ThemeAssets.logoIcon,
                        //     // svgPath: ThemeAssets.splashImage,
                        //     width: 222,
                        //     height: 222,
                        //     fit: BoxFit.fill,
                        //   )
                        ),
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    const _duration = Duration(seconds: 5);
    Future.delayed(_duration, _navigateToNext);
    // const _duration = Duration(milliseconds: 100);
    // Future.delayed(_duration, _getAppVersion);
  }

  void _navigateToNext() {
    // final role = authentication.role;
    if (authentication.isAuthenticated) {
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return HomeScreen();
              //LocationScreen();
              // return HomePage(title: "testing",);
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 500),
          ),
          (route) => false);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => OnBoardingScreen(),
          //IntroScreen(),
        ),
      );
    }
    // debugPrint("$role");
    // switch (role) {
    //   case Role.DRIVER:
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => DriverHomeScreen()));
    //     break;
    //   case Role.CUSTOMER:
    //     // Navigator.pushReplacementNamed(
    //     //   context,
    //     //   CustomerRouter.customerHomeScreen,
    //     // );
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => HomeScreen()));
    //     // Navigator.pushReplacementNamed(context, CatalogueRouter.listCatalogue);
    //     break;
    //   case Role.VENDOR:
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute<void>(
    //         builder: (BuildContext context) => IntroScreen(),
    //         // builder: (BuildContext context) => DemoScreen(),
    //       ),
    //     );
    //     //   Navigator.pushReplacementNamed(
    //     //     context,
    //     //     VendorRouter.vendorHomeScreen,
    //     //   );
    //     break;
    //   case Role.GUEST:
    //     if (app.isFirstTime) {
    //       app.setFirstTimeLaunch(value: false);
    //       // Navigator.pushReplacementNamed(context, UserRouter.signInScreen);
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute<void>(
    //           builder: (BuildContext context) => IntroScreen(),
    //           // builder: (BuildContext context) => SignInScreen(),
    //           // builder: (BuildContext context) => DemoScreen(),
    //         ),
    //       );
    //       // Navigator.pushReplacementNamed(
    //       //   context,
    //       //   UserRouter.signInScreen,
    //       // );
    //     } else {
    //       // Navigator.pushReplacementNamed(
    //       //   context,
    //       //   CustomerRouter.customerHomeScreen,
    //       // );
    //       // Navigator.pushReplacementNamed(
    //       //   context,
    //       //   UserRouter.signInScreen,
    //       // );
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute<void>(
    //           builder: (BuildContext context) => IntroScreen(),
    //           // builder: (BuildContext context) => SignInScreen(),
    //           // builder: (BuildContext context) => DemoScreen(),
    //         ),
    //       );
    //     }
    //     break;
    // }
  }

  void _getAppVersion() {
    BlocProvider.of<ConfigurationsBloc>(context)
        .add(ConfigurationsFetchEvent(reFetch: true));
  }
}
