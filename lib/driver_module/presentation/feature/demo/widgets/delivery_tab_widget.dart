import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../base_module/data/entity/models/page_input.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../component/delivery_tab_card.dart';
import '../bloc/deliverd_delivery_by_delivery_boy/delivered_delivery_by_delivery_boy_bloc.dart';

class DeliveryTabWidget extends StatefulWidget {
  const DeliveryTabWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryTabWidget> createState() => _DeliveryTabWidgetState();
}

double listviewPosition = 0.0;

class _DeliveryTabWidgetState extends State<DeliveryTabWidget> {
  final ScrollController _scrollController = ScrollController();

  void scrollPosition() {
    // final double position = listviewPosition;
    // _scrollController.jumpTo(position);
  }

  @override
  void initState() {
    // BlocProvider.of<DeliveredDeliveryByDeliveryBoyBloc>(context).add(GetDeliveredDeliveryByDeliveryBoy(
    //     pageInput: PageInput(),orderStatus:"DELIVERED"
    // ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 0), () {
          BlocProvider.of<DeliveredDeliveryByDeliveryBoyBloc>(context).add(
              GetDeliveredDeliveryByDeliveryBoy(
                  pageInput: PageInput(), orderStatus: "DELIVERED"));
          return true;
        });
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        child: BlocBuilder<DeliveredDeliveryByDeliveryBoyBloc,
            DeliveredDeliveryByDeliveryBoyState>(
          builder: (context, state) {
            if (state is DeliveredDeliveryByDeliveryBoyInitial) {
              // return Center(child: SizedBox(
              //   height: size.height*0.60,
              //   width: size.width,
              //   child: Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ));
              return ListView.builder(
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemCount: 6,
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
            } else if (state is DeliveredDeliveryByDeliveryBoySuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (state.orderList!.orders!.isEmpty ||
                          state.orderList?.orders?.length == 0)
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: AppConstants.defaultPadding),
                          child: Center(
                            child: Text(
                              "No Item To Deliver",
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
                              // controller: _scrollController,
                              //  key:  PageStorageKey<String>('keyhj'),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.orderList?.orders?.length,
                              itemBuilder: (BuildContext ctxt, int i) {
                                scrollPosition();

                                // scrollUp();
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
                                            top:
                                                AppConstants.defaultPadding / 4,
                                            left: size.width * 0.05,
                                            right: size.width * 0.05),
                                        child: DeliveryTabCard(
                                          order: state.orderList?.orders?[i],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                ],
              );
            } else if (state is DeliveredDeliveryByDeliveryBoyFail) {
              return SizedBox(
                width: size.width,
                height: size.height * 0.60,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<DeliveredDeliveryByDeliveryBoyBloc>(
                              context)
                          .add(GetDeliveredDeliveryByDeliveryBoy(
                              pageInput: PageInput(),
                              orderStatus: "DELIVERED"));
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
                      BlocProvider.of<DeliveredDeliveryByDeliveryBoyBloc>(
                              context)
                          .add(GetDeliveredDeliveryByDeliveryBoy(
                              pageInput: PageInput(),
                              orderStatus: "DELIVERED"));
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
