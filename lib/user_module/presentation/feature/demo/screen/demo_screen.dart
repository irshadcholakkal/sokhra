import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../carousal_module/presentation/feature/carousal/widgets/custom_carousal.dart';
import '../../../../../cart_wishlist_module/presentation/core/values/cart_router.dart';
import '../../../../../base_module/presentation/component/appbar/custom_appbar.dart';
import '../../../../../base_module/presentation/component/buttons/cart_fab.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/component/pincode/pincode.dart';
import '../../../../../base_module/presentation/component/promocode/promocode.dart';
import '../../../../../base_module/presentation/component/side_menu/side_menu.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/app_icon_demo.dart';
import '../widgets/breadcrumb_demo.dart';
import '../widgets/card_demo.dart';
import '../widgets/colors_demo.dart';
import '../widgets/data_table_demo.dart';
import '../widgets/elevated_button_demo.dart';
import '../widgets/flash_alert_demo.dart';
import '../widgets/form_demo.dart';
import '../widgets/icon_button_demo.dart';
import '../widgets/outlined_button_demo.dart';
import '../widgets/statistics_card_demo.dart';
import '../widgets/text_button_demo.dart';
import '../widgets/text_field_demo.dart';
import '../widgets/toggle_button_demo.dart';
import '../widgets/typography_demo.dart';
import '../widgets/welcome_card_demo.dart';

class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  final _pinCodeKey = GlobalKey<FormBuilderState>();
  bool checkPressed = false;
  List _chipList = [
    "ALL",
    "EXOTIC",
    "LEAFY VEG",
    "FRUITS",
    "VEGETALS",
    "ROOTS",
    "STEM"
  ]; //TODO remove
  Map map = {};
  final promoKey = GlobalKey<FormBuilderState>();
  bool promo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: const VendorAppBar(),
        appBar: CustomAppbar(
          context: context,
        ),
        drawer: const SideMenu(
          sideMenuItems: [],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding / 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _chipsWidget(),
                const ColorSwatchesDemo(),
                const AppPadding(),
                const AppPadding(),
                CustomCarousal(),
                const AppPadding(),
                PinCode(
                    formKey: _pinCodeKey,
                    onPressed: () {
                      bool? status =
                          _pinCodeKey.currentState?.fields['pincode']?.isValid;
                      String? value =
                          _pinCodeKey.currentState?.fields['pincode']?.value;
                      debugPrint("pincode check pressed");
                      debugPrint("value:${value}");

                      if (status != true) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("enter a valid pincode"),
                        ));
                      } else {
                        setState(() {
                          checkPressed = true;
                        });
                      }
                    },
                    location:
                        checkPressed ? "Thiruvananthapuram, kerala" : null,
                    message: checkPressed ? "Delivery in 10 days" : null),
                PromoCode(
                    onPressed: () {
                      setState(() {
                        promo = true;
                      });
                    },
                    formKey: promoKey,
                    message: promo ? "₹1000 discount applied" : null),
                const AppPadding(),
                const TypographyDemo(),
                const AppIconsDemo(),
                const ElevatedButtonsDemo(),
                const OutlinedButtonsDemo(),
                const IconButtonsDemo(),
                const TextButtonsDemo(),
                const ToggleButtonsDemo(),
                const TextFieldDemo(),
                FlashAlertDemo(),
                const BreadcrumbDemo(),
                CardDemo(),
                AlertDemo(),
                const StatisticsCardDemo(),
                DataTableDemo(),
                FormDemo(),
                WelcomeCardDemo(),
                const AppPadding(multipliedBy: 2),
              ],
            ),
          ),
        ),
        floatingActionButton: CartFab(
          onPressed: () {
            Navigator.pushNamed(context, CartRouter.cartScreen);
          },
        ));
  }

  Container _chipsWidget() {
    return Container(
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _chipList.length,
          itemBuilder: (context, index) {
            bool _selected = false;
            return StatefulBuilder(builder: (context, state2) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: FilterChip(
                    selected: _selected,
                    label: Text("${_chipList[index]}"),
                    labelStyle: !_selected
                        ? Theme.of(context).textTheme.button
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                    onSelected: (bool onChecked) {
                      state2(() {
                        _selected = onChecked;
                      });
                      print("clicked ${_chipList[index]}");
                    }),
              );
            });
          }),
    );
  }
}
