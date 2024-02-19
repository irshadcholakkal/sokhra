import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lumiereorganics_app/base_module/presentation/core/values/app_constants.dart';
import 'package:lumiereorganics_app/user_module/domain/user_data.dart';
import 'package:lumiereorganics_app/user_module/presentation/components/manage_address_bottom_sheet.dart';
import 'package:lumiereorganics_app/user_module/presentation/feature/profile/screens/language_selection_screen.dart';
import 'package:lumiereorganics_app/user_module/presentation/feature/profile/screens/update_password_screen.dart';

import '../../../../../base_module/data/entity/graphql_service.dart';
import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../../base_module/presentation/component/images/custom_image_view.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_bloc.dart';
import '../../../../../cart_wishlist_module/presentation/feature/cart/blocs/cart_bloc/cart_event.dart';
import '../../../../../cart_wishlist_module/presentation/feature/wishlist/blocs/customer_wishlist_bloc/customer_wishlist_bloc.dart';
import '../../../../../main.dart';
import '../../../../domain/entity/authentication.dart';
import '../../../components/signout_card.dart';
import 'personal_details.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback? onPress;
  const ProfileScreen({Key? key, this.onPress}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? _image;
  final _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // userData.getUserData();
    // userData.init();
    
  }
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColorScheme.surfaceColorLight,
      appBar: SimpleAppBar(title: translation.of('user.my_account')
      //'My Account'
      ,ontap: widget.onPress),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //color: Colors.yellow,
              height: 200,
              width: double.infinity,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                          foregroundColor: AppColorScheme.backgroundLight,
                          radius: 50,
                          backgroundColor: AppColorScheme.backgroundLight,
                          child: (_image == null || _image == '')
                              ? CustomImageView(
                                  margin: EdgeInsets.all(18),
                                  // radius: BorderRadius.circular(),
                                  height: 100,
                                  width: 100,
                                  // color: Colors.red,
                                  svgPath: ThemeAssets.profile,
                                )
                              : Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: FileImage(
                                            File(_image!.path),
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                        ),
                    InkWell(
                      onTap: _pickImage,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: AppColorScheme.primaryColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Iconsax.edit_2,
                          size: 12,
                          color: AppColorScheme.onPrimaryLight,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            _listdata(context, Icon(Iconsax.user,color: AppColorScheme.onBlack,), 
           translation.of('user.personal_details'),
            //'Personal details', 
            personalDetails()
           //SignUpScreen ()
          // PasswordScreen()
          
            ),
            _listdata(context, Icon(Iconsax.location,color: AppColorScheme.onBlack,), 
           translation.of('user.addresses'),
            //'Addresses',
             ManageAddressBottomSheet()
           // EditAddressScreen()
          //  AddAddressScreen()
            
            ),
            _listdata(context, Icon(Iconsax.lock,color: AppColorScheme.onBlack,), 
             translation.of('user.password'),
            //'Password',
             UpdatePasswordScreen()),
            _listdata(context, Icon(Icons.language,color: AppColorScheme.onBlack,), 
            translation.of('user.language'),
            //'Language', 
            LanguageSelection()),
             _signOut(context,),
          ],
        ),
      ),
    );
  }

  Widget _listdata(BuildContext context, leading, String text, pages) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pages,
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: ShapeDecoration(
        color: Color(0xFFF7F2FA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: ListTile(
         // contentPadding: EdgeInsets.all(5),
          leading: leading,
          title: Text(
            text,
            style: TextStyle(
              color: AppColorScheme.onBlack,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            Iconsax.arrow_right_3,
            color: AppColorScheme.onBlack,
          ),
        ),
      ),
    ),
  );
}

 Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

 Widget _signOut(BuildContext context,) {
  return GestureDetector(
    onTap: () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => pages,
      //   ),
      // );
      _onSignOut(context);
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: ShapeDecoration(
        color: Color(0xFFFFEDEA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: ListTile(
         // contentPadding: EdgeInsets.all(5),
          leading: Icon(Iconsax.logout,color: Color(0xFFDE3730),),
          title: Text(
            'Logout',
            style: TextStyle(
              color: Color(0xFFDE3730),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}

 void _onSignOut(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.all(AppConstants.defaultPadding),
            child: SignoutCard(
              onPressed: () async {
                // BlocProvider.of<SignOutBloc>(context).add(SignOut());
                _navigateToNext(context);
              },
            ),
          );
        });
  }

  void _navigateToNext(BuildContext context) async {
    BlocProvider.of<CustomerWishlistBloc>(context)
        .add(CustomerWishListResetEvent());
    BlocProvider.of<CartBloc>(context).add(CartResetEvent());
    await Future.value([
      await userData.removeUserData(),
      await authentication.clearAuthenticatedUser()
    ]);

    graphQLService.resetCache();
    // CustomPageController.controller.jumpToTab(0);
    RestartWidget.restartApp(context);
    // await userData.removeUserData();
    // await authentication.clearAuthenticatedUser().then((value) {
    //   graphQLService.resetCache();
    //   CustomPageController.controller.jumpToTab(0);
    // });
  }


}
