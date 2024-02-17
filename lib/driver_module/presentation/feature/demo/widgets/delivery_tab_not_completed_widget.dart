

import 'package:flutter/material.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../component/not_delivered_card.dart';

class DeliveryTabNotCompletedWidget extends StatefulWidget {
  const DeliveryTabNotCompletedWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryTabNotCompletedWidget> createState() => _DeliveryTabNotCompletedWidgetState();
}
double listviewPosition = 0.0;

class _DeliveryTabNotCompletedWidgetState extends State<DeliveryTabNotCompletedWidget> {
  final ScrollController _scrollController = ScrollController();
  void scrollPosition() {
    // final double position  = listviewPosition;
    // _scrollController.jumpTo(listviewPosition);
  }
  @override
  void initState(){
    // BlocProvider.of<NotDeliveredDeliveryByDeliveryBoyBloc>(context).add(GetNotDeliveryByDeliveryBoy(
    //     pageInput: PageInput(),orderStatus:"DELIVERED"
    // ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      controller: _scrollController,
      child: Column(
        children: [

          ListView.builder(

            //     key:  PageStorageKey<String>('key6'),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext ctxt, int i) {
                //  if (_scrollController.hasClients)
                // _scrollController.jumpTo(200);
                scrollPosition();
              
                return Padding(
                  padding: EdgeInsets.only(
                      top: AppConstants.defaultPadding,
                      left: size.width * 0.05,
                      right: size.width * 0.05),
                  child: NotDeliveredCard(
                  ),
                );
              }),
        ],
      ),
    );
  }
}
