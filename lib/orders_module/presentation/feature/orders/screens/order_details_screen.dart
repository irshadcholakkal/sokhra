import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_bloc.dart';
import '../../../../../new_cart_module/presentation/blocs/new_cart_bloc/new_cart_event.dart';
import '../../../../../user_module/domain/user_data.dart';
import '../../../../domain/models/order.dart';
import '../../../components/order_details_card.dart';
import '../blocs/repeat_order_bloc/repeat_order_bloc.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Order order;

  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.secondaryBackgroundColor,
      appBar: SimpleAppBar(title: "Order details"),
      body: BlocListener<RepeatOrderBloc, RepeatOrderState>(
        listener: (context, state) {
          if (state is RepeatOrderSuccess) {
            Navigator.of(context).pop();

            showSuccessFlash(
              context: context,
              message: "Added to cart successfully",
            );

            BlocProvider.of<NewCartBloc>(context).add(
              FetchCartItems(pincode: userData.pinCode),
            );
          } else if (state is RepeatOrderFailed) {
            Navigator.of(context).pop();
            showErrorFlash(context: context, message: "${state.error}");
          } else if (state is RepeatOrderLoading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return Dialog(
                  insetPadding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding * 3,
                    vertical: AppConstants.defaultPadding * 9,
                  ),
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding / 2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppPadding(dividedBy: 2),
              OrderDetailsCard(order: widget.order),
              AppPadding(dividedBy: 2),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      height: 70,
      width: double.infinity,
      // color: Colors.red,
      padding: EdgeInsetsDirectional.only(
        start: AppConstants.defaultPadding / 2,
        end: AppConstants.defaultPadding / 2,
        bottom: AppConstants.defaultPadding / 2,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.onTertiary,
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppConstants.cornerRadius / 2,
                ),
              ),
            ),
          ),
        ),
        onPressed: _repeatOrder,
        child: Center(
          child: Text(
            "Repeat order",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.background,
                ),
          ),
        ),
      ),
    );
  }

  void _repeatOrder([bool reFetch = true]) {
    BlocProvider.of<RepeatOrderBloc>(context).add(
      RepeatOrderCreateEvent(orderId: widget.order.id!),
    );
  }
}
