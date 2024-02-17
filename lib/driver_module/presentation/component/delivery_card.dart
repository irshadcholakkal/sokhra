
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base_module/domain/entity/color_scheme.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../../orders_module/domain/models/order.dart';
import '../feature/demo/widgets/delivery_dialog.dart';

class DeliveryCard extends StatefulWidget {
  final Order? order;

  const DeliveryCard({Key? key, this.order}) : super(key: key);

  @override
  State<DeliveryCard> createState() => _DeliveryCardState();
}

class _DeliveryCardState extends State<DeliveryCard> {
  bool _hasTaped = true;

  TextEditingController deliveryTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      int.tryParse(
            widget.order!.deliveryDate.toString(),
          ) ??
          0,
    );
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
      ),
      // color: Colors.yellow,
      child: InkWell(
        onTap: () {
          setState(() => _hasTaped = !_hasTaped);
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 12),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
            // color: AppColorScheme.primaryColorLight
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.order?.shippingDetails?.firstname ?? ''}"
                      " "
                      "${widget.order?.shippingDetails?.lastname ?? ''}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.order?.orderNumber.toString() == "null"
                          ? ''
                          : "${widget.order?.orderNumber}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 17),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // textDirection: TextDirection.rtl,
                      children: [
                        _hasTaped
                            ? Icon(Icons.keyboard_arrow_down,
                                size: 26,
                                color: Theme.of(context).colorScheme.primary)
                            : Icon(Icons.keyboard_arrow_up,
                                size: 26,
                                color: Theme.of(context).colorScheme.primary),
                        SizedBox(
                          width: 3,
                        ),
                        // Text(
                        //   "${widget.order?.customer?.customerId}",
                        //   style: TextStyle(
                        //     color: Theme.of(context).colorScheme.primary,
                        //   ),
                        // ),
                      ],
                    )),
                _hasTaped
                    ? Text.rich(TextSpan(
                        text: widget.order?.shippingDetails?.house,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        children: <InlineSpan>[
                            TextSpan(
                              text: " , ",
                            ),
                            // TextSpan(
                            //
                            //   text: widget.order?.shippingDetails?.zone?.zoneName,
                            // ),
                            TextSpan(
                              text: " , ",
                            ),
                            TextSpan(
                              text: widget.order?.shippingDetails?.street,
                            ),
                            TextSpan(
                              text: " , ",
                            ),
                            TextSpan(
                              text: "${widget.order?.shippingDetails?.pincode}",
                            ),
                            TextSpan(
                              text: " , ",
                            ),
                            TextSpan(
                              text: widget.order?.shippingDetails?.district,
                            ),
                            TextSpan(
                              text: " , ",
                            ),
                            TextSpan(
                              text: widget.order?.shippingDetails?.landmark,
                            ),
                            TextSpan(
                              text: " , ",
                            ),

                            TextSpan(
                              text: widget.order?.shippingDetails?.phone,
                            ),
                          ]))
                    : const SizedBox(),
                SizedBox(
                  height:
                      widget.order?.shippingDetails?.note.toString() != 'null'
                          ? 5
                          : 1,
                ),
                _hasTaped
                    ? (widget.order?.shippingDetails?.note.toString() != 'null')
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.warning,
                                color: Theme.of(context).colorScheme.error,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  "${widget.order?.shippingDetails?.note}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color:
                                          Theme.of(context).colorScheme.error),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox()
                    : const SizedBox(),
                const SizedBox(
                  height: 14,
                ),
                _hasTaped
                    ? const SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text.rich(TextSpan(
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                children: [
                                  TextSpan(
                                    text: 'house : ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          widget.order?.shippingDetails?.house)
                                ])),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                children: [
                                  TextSpan(
                                    text: 'area : ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // TextSpan(
                                  //   text: widget
                                  //       .order?.shippingDetails?.zone?.zoneName,
                                  // )
                                ],
                              ),
                            ),
                            Text.rich(TextSpan(
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                children: [
                                  TextSpan(
                                    text: "street : ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          widget.order?.shippingDetails?.street)
                                ])),
                            Text.rich(TextSpan(
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                children: [
                                  TextSpan(
                                    text: 'pin : ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: widget
                                          .order?.shippingDetails?.pincode)
                                ])),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                children: [
                                  TextSpan(
                                    text: 'district : ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: widget
                                          .order?.shippingDetails?.district)
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                children: [
                                  TextSpan(
                                    text: 'contact : ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          widget.order?.shippingDetails?.phone)
                                ],
                              ),
                            ),
                            Text.rich(TextSpan(
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                children: [
                                  TextSpan(
                                    text: 'landmark : ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: widget
                                          .order?.shippingDetails?.landmark)
                                ])),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                children: [
                                  TextSpan(
                                    text: 'date : ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: formattedDate)
                                ],
                              ),
                            ),
                            (widget.order?.shippingDetails?.note.toString() !=
                                    "null")
                                ? Text.rich(TextSpan(
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    children: [
                                        TextSpan(
                                          text: 'comments : ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                            text: widget.order?.shippingDetails
                                                    ?.note ??
                                                '')
                                      ]))
                                : SizedBox(),
                          ]),
                SizedBox(
                  height: AppConstants.defaultPadding / 2,
                ),
                SizedBox(
                  width: size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // InkWell(
                      //   onTap: (){},
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20,),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: AppColorScheme.primaryColorLight,
                      //     ),
                      //     child:  Icon(MdiIcons.phone,color: AppColorScheme.surfaceColorLight),
                      //   ),
                      // ),
                      // SizedBox(width: 10,),

                      MaterialButton(
                        onPressed: () {
                          String contact =
                              widget.order!.shippingDetails!.phone ?? "";
                          launchUrl(Uri.parse("tel: $contact"));
                        },
                        // height: 42,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(MdiIcons.phone,
                            color: AppColorScheme.surfaceColorLight),
                        color: AppColorScheme.primaryColorLight,
                      ),
                      SizedBox(
                        width: AppConstants.defaultPadding,
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    content:
                                        DeliveryDialog(id: widget.order?.id),
                                  ));
                          // openComment(context);
                        },
                        child: Text('Delivered',
                            style: TextStyle(
                                color: AppColorScheme.primaryColorLight)),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                                color: AppColorScheme.primaryColorLight),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  openComment(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              content: DeliveryDialog(id: widget.order?.id),
            ));
  }
}
