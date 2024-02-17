
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../base_module/data/entity/models/page_input.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../component/delivery_card.dart';
import '../bloc/pending_delivery_by_delivery_boy/pending_delivery_by_delivery_boy_bloc.dart';

class PendingDeliveryWidget extends StatefulWidget {
  const PendingDeliveryWidget({Key? key}) : super(key: key);

  @override
  State<PendingDeliveryWidget> createState() => _PendingDeliveryWidgetState();
}

double listviewPosition = 0.0;

class _PendingDeliveryWidgetState extends State<PendingDeliveryWidget> {
  final ScrollController _scrollController = ScrollController();

  void scrollPosition() {
    // final double position  = listviewPosition;
    // _scrollController.jumpTo(listviewPosition);
  }

  @override
  void initState() {
    // BlocProvider.of<PendingDeliveryByDeliveryBoyBloc>(context).add(GetPendingDeliveryByDeliveryBoy(orderStatus:"DISPATCHED",pageInput:  PageInput()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 0), () {
          BlocProvider.of<PendingDeliveryByDeliveryBoyBloc>(context).add(
              GetPendingDeliveryByDeliveryBoy(
                  orderStatus: "DISPATCHED", pageInput: PageInput()));

          return true;
        });
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        child: BlocBuilder<PendingDeliveryByDeliveryBoyBloc,
            PendingDeliveryByDeliveryBoyState>(
          builder: (context, state) {
            if (state is PendingDeliveryByDeliveryBoyLoading) {
              return ListView.builder(
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: AppColorScheme.onPrimaryLight.withOpacity(0.6),
                        period: Duration(seconds: 5),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColorScheme.onPrimaryLight,
                            ),
                            width: size.width,
                            height: 200,
                          ),
                        ),
                      ),
                    );
                  });
            } else if (state is PendingDeliveryByDeliveryLoad) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (state.orderList!.orders!.isEmpty ||
                          state.orderList?.orders?.length == 0)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppConstants.defaultPadding),
                          child: Center(
                            child: Text(
                              "No Item Pending",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                        )
                      : AnimationLimiter(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.orderList?.orders?.length,
                              itemBuilder: (BuildContext ctxt, int i) {
                                scrollPosition();
                                return AnimationConfiguration.staggeredGrid(
                                  position: i,
                                  columnCount: 1,
                                  // Same as the crossAxisCount above
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: AppConstants.defaultPadding/4,
                                              left: size.width * 0.05,
                                              right: size.width * 0.05),
                                          child: DeliveryCard(
                                            order: state.orderList?.orders?[i],
                                          )),
                                    ),
                                  ),
                                );
                              }),
                        ),
                ],
              );
            } else if (state is PendingDeliveryByDeliveryBoyFail) {
              return SizedBox(
                width: size.width,
                height: size.height * 0.60,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<PendingDeliveryByDeliveryBoyBloc>(context)
                          .add(GetPendingDeliveryByDeliveryBoy(
                              orderStatus: "DISPATCHED",
                              pageInput: PageInput()));
                    },
                    child: Container(
                        height: 60,
                        width: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Refresh"),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(MdiIcons.refresh)
                          ],
                        )),
                  ),
                ),
              );
            } else {
              return SizedBox(
                width: size.width,
                height: size.height * 0.60,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<PendingDeliveryByDeliveryBoyBloc>(context)
                          .add(GetPendingDeliveryByDeliveryBoy(
                              orderStatus: "DISPATCHED",
                              pageInput: PageInput()));
                    },
                    child: Container(
                        height: 60,
                        width: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Refresh"),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(MdiIcons.refresh)
                          ],
                        )),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
