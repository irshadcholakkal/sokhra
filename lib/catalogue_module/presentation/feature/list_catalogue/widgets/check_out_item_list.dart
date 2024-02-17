
import 'package:flutter/material.dart';

import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../new_cart_module/domain/new_cart_model.dart';
import 'item_list_widget.dart';

class CheckOutItemList extends StatefulWidget {
  final List<Cart>? cartList;
  bool? showItems;
  void Function()? ontap;

  CheckOutItemList({
    Key? key,
    this.cartList,
    this.showItems,
    this.ontap,
  });

  @override
  State<CheckOutItemList> createState() => _CheckOutItemListState();
}

class _CheckOutItemListState extends State<CheckOutItemList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         // SizedBox(height: 20),
          ItemListWidget(cartList: widget.cartList),
         // SizedBox(height: 20),
        ],
      ),
    );
  }
}
