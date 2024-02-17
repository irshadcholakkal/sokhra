
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../../orders_module/domain/models/order.dart';

class DeliveryTabCard extends StatefulWidget {
  final Order? order;

  const DeliveryTabCard({Key? key, this.order}) : super(key: key);

  @override
  State<DeliveryTabCard> createState() => _DeliveryTabCardState();
}

class _DeliveryTabCardState extends State<DeliveryTabCard> {
  bool _hasTaped = true;

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
      // AppColorScheme.DriverFormFieldFill,
      child: InkWell(
        onTap: () {
          setState(() => _hasTaped = !_hasTaped);
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 12),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
            // color:Colors.yellow
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
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
                          ? ""
                          : "${widget.order?.orderNumber}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 17),
                    ),
                  ],
                ),
                // Text(
                //   "${widget.order?.customer?.customerId}" ,
                //   style: TextStyle(
                //     color: Theme.of(context).colorScheme.primary,
                //   ),
                // ),
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
                              text: widget.order?.shippingDetails?.pincode,
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
                              text: widget.order?.shippingDetails?.phone,
                            ),
                          ]))
                    : const SizedBox(),
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
                                  widget.order?.shippingDetails?.note ?? '',
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
                                    text: "house : ",
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
                            // Text.rich(TextSpan(
                            //     style: TextStyle(
                            //         color: Theme.of(context)
                            //             .colorScheme
                            //             .primary),
                            //     children: [
                            //       TextSpan(
                            //         text: "bloc",
                            //         style: const TextStyle(
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       TextSpan(text: "bloc")
                            //     ])),
                            Text.rich(TextSpan(
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                children: [
                                  TextSpan(
                                    text: 'street : ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          widget.order?.shippingDetails?.street)
                                ])),
                            // Text.rich(TextSpan(
                            //     style: TextStyle(
                            //         color: Theme.of(context)
                            //             .colorScheme
                            //             .primary),
                            //     children: [
                            //       TextSpan(
                            //         text: 'jedha',
                            //         style: const TextStyle(
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       TextSpan(text: "jedha")
                            //     ])),
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
                            Text.rich(TextSpan(
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
                                ])),
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
                                    text: "contact : ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          widget.order?.shippingDetails?.phone)
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
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
