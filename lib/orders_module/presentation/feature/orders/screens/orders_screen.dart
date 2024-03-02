import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../catalogue_module/domain/models/product.dart';
import '../../../../../user_module/domain/entity/authentication.dart';
import '../../../../../user_module/presentation/feature/authentication/widgets/custom_auth_button.dart';
import '../../../../domain/models/order.dart';
import '../../../../domain/models/order_product_pricing.dart';
import '../../../../domain/models/order_status.dart';
import '../../../components/order_card.dart';
import '../blocs/order_bloc/order_bloc.dart';

class OrdersScreen extends StatefulWidget {
  final VoidCallback? onPress;
  const OrdersScreen({Key? key, this.onPress}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColorScheme.surfaceColorLight,
        appBar: SimpleAppBar(
            title: translation.of("orders.my_orders"), ontap: widget.onPress),
        body: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                const Duration(milliseconds: 500),
                _fetchOrders,
              );
            },
            child: authentication.isAuthenticated
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: BlocBuilder<OrderBloc, OrderState>(
                          builder: (context, state) {
                        if (state is FetchOrdersLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColorScheme.primaryColor,
                            ),
                          );
                        }
                        if (state is FetchOrdersSuccess) {
                          final orders = state.orders;

                          final List<Order> activeOrders = orders
                              .where((order) =>
                                  order.status == OrderStatus.PENDING ||
                                  order.status == OrderStatus.DISPATCHED)
                              .toList();
                          final List<Order> orderHistory = orders
                              .where((order) =>
                                  order.status != OrderStatus.PENDING &&
                                  order.status != OrderStatus.DISPATCHED)
                              .toList();
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                translation.of('orders.active_orders'),
                                // 'Active Orders',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      color: Color(0xFF1D1B1E),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              activeOrders.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: activeOrders.length,
                                      itemBuilder: (context, index) {
                                        final order = activeOrders[index];
                                        return _orderCard(order: order);
                                        //_activeOrdersList();
                                      },
                                    )
                                  : Center(
                                      child: Text(
                                        translation
                                            .of('orders.no_active_orders'),
                                        // 'no_active_orders'
                                      ),
                                    ),
                              Text(
                                translation.of('orders.order_history'),
                                // 'Order history',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      color: Color(0xFF1D1B1E),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              orderHistory.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: orderHistory.length,
                                      itemBuilder: (context, index) {
                                        final order = orderHistory[index];
                                        return _orderCard(order: order);
                                      },
                                    )
                                  : Center(
                                      child: Text(
                                        translation.of('orders.no_any_orders'),
                                        //"No any Orders"
                                      ),
                                    ),
                            ],
                          );
                        }
                        if (state is FetchOrdersFailed) {
                          return Center(
                            child: Text(state.message.toString()),
                          );
                        }
                        return SizedBox();
                      }),
                    ),
                  )
                : GuestSignIn()

            // child: SingleChildScrollView(
            //   controller: _scrollController,
            //   physics: AlwaysScrollableScrollPhysics(),
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: AppConstants.defaultPadding / 2,
            //   ),
            //   child: Column(
            //     children: [
            // AppPadding(dividedBy: 2),
            // BlocBuilder<OrderBloc, OrderState>(
            //   builder: (context, state) {
            //     if (state is FetchOrdersSuccess) {
            //       final orders = state.orders;
            //   if (orders.isNotEmpty) {
            //     return ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: orders.length,
            //       physics: NeverScrollableScrollPhysics(),
            //       itemBuilder: (context, index) {
            //         final order = orders[index];
            //         return OrderCard(order: order);
            //       },
            //     );
            //   }
            //   return SizedBox(
            //     height: 300,
            //     child: Center(
            //       child: Text("Orders is empty"),
            //     ),
            //   );
            // }
            //     return LoadingOrErrorIndicator(
            //       padding: const EdgeInsets.only(
            //         top: AppConstants.defaultPadding * 2,
            //         bottom: AppConstants.defaultPadding,
            //       ),
            //       isLoading: state is! FetchOrdersFailed,
            //       error: state.errorMessage,
            //       onRetry: _fetchOrders,
            //     );
            //   },
            // ),
            // AppPadding(dividedBy: 2),
            //   ],
            // ),
            // ),
            ));
  }

  void _fetchOrders([bool reFetch = true]) {
    BlocProvider.of<OrderBloc>(context).add(FetchOrders(reFetch: reFetch));
  }

  void _onScroll() {
    if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse &&
        _scrollController.position.atEdge) {
      _fetchOrders(false);
    }
  }

  // Widget _activeOrdersList() {
  //   return Card(
  //     color: AppColorScheme.scaffoldBackgroundColorLight,
  //     child: ExpansionTile(
  //       title: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Column(
  //             children: [
  //               Row(
  //                 children: [
  //                   Text(
  //                     '#SE9865742',
  //                     style: Theme.of(context).textTheme.subtitle1?.copyWith(
  //                       color: Color(0xFF1D1B1E),
  //                       fontSize: 11,
  //
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 8.0),
  //                     child: Text(
  //                       'In progress',
  //                       style: Theme.of(context).textTheme.subtitle1?.copyWith(
  //                         color: Color(0xFFF2994A),
  //                         fontSize: 8,
  //
  //                         fontWeight: FontWeight.w400,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   Text(
  //                     '12 Dec 2023',
  //                     style: Theme.of(context).textTheme.subtitle1?.copyWith(
  //                       color: Color(0xFF1D1B1E),
  //                       fontSize: 9,
  //
  //                       fontWeight: FontWeight.w400,
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: 3,
  //                   ),
  //                   SvgPicture.asset(
  //                       "lib/base_module/presentation/core/assets/images/noon.svg"),
  //                   SizedBox(
  //                     width: 3,
  //                   ),
  //                   Text(
  //                     ' Noon',
  //                     style: Theme.of(context).textTheme.subtitle1?.copyWith(
  //                       color: Color(0xFF1D1A20),
  //                       fontSize: 7.41,
  //
  //                       fontWeight: FontWeight.w400,
  //                     ),
  //                   ),
  //                   Text(
  //                     ' 02:30 PM',
  //                     style: Theme.of(context).textTheme.subtitle1?.copyWith(
  //                       color: Color(0xFF1D1A20),
  //                       fontSize: 7.41,
  //
  //                       fontWeight: FontWeight.w400,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           Column(
  //             children: [
  //               Row(
  //                 children: [
  //                   SvgPicture.asset(
  //                     ThemeAssets.location,
  //                   ),
  //                   Text(
  //                     ' Home',
  //                     style: Theme.of(context).textTheme.subtitle1?.copyWith(
  //                       color: Color(0xFF1D1B1E),
  //                       fontSize: 9.26,
  //
  //                       fontWeight: FontWeight.w400,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           InkWell(
  //               onTap: () {},
  //               child: SvgPicture.asset(
  //                   "lib/base_module/presentation/core/assets/images/download.svg"))
  //         ],
  //       ),
  //       children: <Widget>[
  //         ListTile(
  //           title: ListView.builder(
  //             shrinkWrap: true,
  //             physics: NeverScrollableScrollPhysics(),
  //             itemCount: 3,
  //             itemBuilder: (context, index) {
  //               return _productCard();
  //             },
  //           ),
  //         ),
  //         // Add more ListTile widgets if needed
  //       ],
  //     ),
  //   );
  // }

  Widget _orderCard({required Order order}) {
    return Card(
      color: AppColorScheme.scaffoldBackgroundColorLight,
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "${order.orderNumber}",
                      // '#SE9865742',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Color(0xFF1D1B1E),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '${getStatus(order.status!)}',
                        //'Delivered',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: getColor(order.status!),
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${formattedDateTime(order.createdAt)}',
                      //'12 Dec 2023',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Color(0xFF1D1B1E),
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    SvgPicture.asset(
                        "lib/base_module/presentation/core/assets/images/noon.svg"),
                    SizedBox(
                      width: AppConstants.defaultPadding * 0.15,
                    ),
                    Text(
                      ' Noon',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Color(0xFF1D1A20),
                            fontSize: 7.41,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Text(
                      ' 02:30 PM',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Color(0xFF1D1A20),
                            fontSize: 7.41,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      ThemeAssets.location,
                    ),
                    Text(
                      ' ${order.shippingDetails?.type ?? "Unknown"}',
                      //' Home',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Color(0xFF1D1B1E),
                            fontSize: 9.26,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                    "lib/base_module/presentation/core/assets/images/download.svg"))
          ],
        ),
        children: <Widget>[
          ListTile(
            title: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: order.orders?.length,
              itemBuilder: (context, index) {
                return _productCard(
                    product: order.orders![index].productInfo?.name,
                    productVariant: order.orders![index].productInfo?.variant,
                    productPrice: order.orders![index].pricing!);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _productCard({
    required product,
    required productVariant,
    required OrderProductPricing productPrice,
  }) {
    return Container(
        margin: EdgeInsetsDirectional.only(bottom: 16),
        width: 350,
        height: 116,
        padding: const EdgeInsets.only(
          top: 8,
          left: 8,
          // right: 22.51,
          bottom: 8,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColorScheme.onPrimaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 7,
              offset: Offset(0, 3),
              spreadRadius: 0,
            )
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                      "lib/base_module/presentation/core/assets/images/dummy_product.png")
                  //  CustomNetworkImage(
                  //   urlList: [
                  //     StringModifiers.toUrl(
                  //       widget.products?.thumbnailImage,
                  //     ),
                  //   ],
                  //   border: Border.all(
                  //     color: AppColorScheme.productCardBorderColor,
                  //   ),
                  //   borderRadius: AppConstants.cornerRadius,
                  //   // padding: EdgeInsetsDirectional.all(8),
                  //   height: 62,
                  //   width: 62,
                  //   fit: BoxFit.contain,
                  // ),
                  ),
              SizedBox(width: AppConstants.defaultPadding * 0.4),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product,

                      //'Kati Patang Non Alcoholic drink',

                      style: Theme.of(context).textTheme.caption?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // SizedBox(height: 4),
                    Container(
                      width: 46.56,
                      height: 18.07,
                      // padding: const EdgeInsets.symmetric(
                      //     horizontal: 5.28, vertical: 0),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 0.38, color: Color(0xFFCBC4CF)),
                          borderRadius: BorderRadius.circular(4.52),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          productVariant,
                          //'500 mL',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                fontSize: 9.05,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1D1A20),
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'MAD',
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      color: AppColorScheme.primaryColor,
                                      fontSize: 12.57,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          TextSpan(
                            text: "${productPrice.netAmount}",
                            //"7.00",
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      color: AppColorScheme.primaryColor,
                                      fontSize: 17.29,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  String getStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.PENDING:
        return translation.of('orders.active');
      //"Active";
      case OrderStatus.DISPATCHED:
        return translation.of('orders.dispatched');
      //"Dispatched";
      case OrderStatus.DELIVERED:
        return translation.of('orders.delivered');
      //"Delivered";
      case OrderStatus.DECLINED:
        return translation.of('orders.declined');
      //"Declined";
      case OrderStatus.CANCELLED:
        return translation.of('orders.cancelled');
      //"Cancelled";
      case OrderStatus.DISPATCH_HELD:
        return translation.of('orders.dispatch_held');
      //"Dispatch held";
      default:
        return "";
    }
  }

  getColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.PENDING:
        return Colors.blue;
      case OrderStatus.DISPATCHED:
        return Colors.blue;
      case OrderStatus.DELIVERED:
        return Colors.green;
      case OrderStatus.DECLINED:
        return Colors.red;
      case OrderStatus.CANCELLED:
        return Colors.red;
      case OrderStatus.DISPATCH_HELD:
        return Colors.red;
      default:
        return Colors.transparent;
    }
  }

  formattedDateTime(String? date) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(date ?? ''));

    String formattedDateTime =
        DateFormat('dd MMM yyyy hh:mm a').format(dateTime);

    return formattedDateTime;
  }
}
