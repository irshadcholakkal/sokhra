

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../base_module/data/entity/models/page_input.dart';
import '../../../../../base_module/presentation/component/alerts/flash_alert.dart';
import '../bloc/change_order_status_bloc/change_order_status_bloc.dart';
import '../bloc/deliverd_delivery_by_delivery_boy/delivered_delivery_by_delivery_boy_bloc.dart';
import '../bloc/pending_delivery_by_delivery_boy/pending_delivery_by_delivery_boy_bloc.dart';

class DeliveryDialog extends StatefulWidget {
  final String ?id;
  const DeliveryDialog({Key? key, this.id}) : super(key: key);

  @override
  State<DeliveryDialog> createState() => _DeliveryDialogState();
}

class _DeliveryDialogState extends State<DeliveryDialog> {
  TextEditingController deliveryTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  getRefresh(){
    BlocProvider.of<DeliveredDeliveryByDeliveryBoyBloc>(context).add(GetDeliveredDeliveryByDeliveryBoy(
        pageInput: PageInput(),orderStatus:"DELIVERED"
    ));
    BlocProvider.of<PendingDeliveryByDeliveryBoyBloc>(context).add(GetPendingDeliveryByDeliveryBoy(orderStatus:"DISPATCHED",pageInput:  PageInput()));


  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeOrderStatusBloc, ChangeOrderStatusState>(
  listener: (context, state) {
    if(state is ChangeOrderStatusSuccess){

      getRefresh();
      Navigator.pop(context);
    }
    else if(state is ChangeOrderStatusFail){
      showErrorFlash(
        context: context,
        message: state.message,
      );
      // Navigator.pop(context);
    }
  },
  child: Form(
      key: _formKey,
      child: SizedBox(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("comments",style:  Theme.of(context)
                        .textTheme.labelLarge!
                        .copyWith(
                        color: Theme.of(context).primaryColor,fontSize: 18),),
                    IconButton(onPressed: (){

                      Navigator.pop(context);

                    }, icon: Container(
                      height: 30,
                      width: 30,
                      // padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary
                        ),
                        child: Icon(MdiIcons.close,color: AppColorScheme.onPrimaryLight,)))

                  ],
                )),
            SizedBox(height: 20,),
            TextFormField(
              controller: deliveryTextController,
              minLines: 2,
              maxLines: 3,
              decoration: InputDecoration(

                // disabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                //   borderSide: BorderSide(width: 1, color: Colors.red),
                // ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.primary)
                  ),


                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: "comments"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {


                            BlocProvider.of<ChangeOrderStatusBloc>(context).add(GetChangeOrderStatus(id: widget.id,deliveryText: deliveryTextController.text,status: "DELIVERED"));

                            // Navigator.pop(context);

                          }
                        },
                        child: Container(
                          width: 100,
                          height: 40,

                          decoration: BoxDecoration(
                              color:Theme.of(context).colorScheme.primary ,
                              border: Border.all(color: Colors.transparent),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10))),
                          child:  Center(
                              child: Text(
                                "Send",
                                style: TextStyle(color: AppColorScheme.onPrimaryLight),
                              )),
                        )),
                  ]),
            )
          ],
        ),
      ),
    ),
);
  }
}
