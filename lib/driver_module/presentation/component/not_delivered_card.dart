import 'package:flutter/material.dart';

import '../../../base_module/presentation/core/values/app_constants.dart';

class NotDeliveredCard extends StatefulWidget {
  const NotDeliveredCard({Key? key}) : super(key: key);

  @override
  State<NotDeliveredCard> createState() => _NotDeliveredCardState();
}

class _NotDeliveredCardState extends State<NotDeliveredCard> {
  bool _hasTaped = true;
  @override
  Widget build(BuildContext context) {


    return  Card(
      child: InkWell(
        onTap: () {
          setState(() => _hasTaped = !_hasTaped);
        },
        child: Container(
          margin:  EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 12),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
              // AppColorScheme.DriverFormFieldFill
          ),
          child: Padding(
            padding:  EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "customerName",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "orderId",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 18),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: [
                        _hasTaped
                            ? Icon(Icons.keyboard_arrow_down,
                            size: 26,
                            color: Theme.of(context).colorScheme.primary)
                            : Icon(Icons.keyboard_arrow_up,
                            size: 26,
                            color: Theme.of(context).colorScheme.primary),
                        Text(
                      "customerId" ,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    )),
                Text.rich(TextSpan(
                    text: 'area',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'street ',
                      ),
                      TextSpan(
                        text: 'block ',
                      ),
                      TextSpan(
                        text: 'buildingNumber ',
                      )
                    ])),


                     Row(
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
                        "comments",
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
                ),

                const SizedBox(
                  height: 14,
                ),
                // _hasTaped
                //     ? const SizedBox()
                //     :
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary),
                          children: [
                            TextSpan(
                              text: 'area',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "area")
                          ])),
                      Text.rich(TextSpan(
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary),
                          children: [
                            TextSpan(
                              text: 'block',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "block")
                          ])),
                      Text.rich(TextSpan(
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary),
                          children: [
                            TextSpan(
                              text: 'street',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "street")
                          ])),
                      Text.rich(TextSpan(
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary),
                          children: [
                            TextSpan(
                              text: 'jedha',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "jedha")
                          ])),
                      Text.rich(TextSpan(
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary),
                          children: [
                            TextSpan(
                              text: 'building',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "buildingNumber")
                          ])),
                      Text.rich(TextSpan(
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary),
                          children: [
                            TextSpan(
                              text: 'house',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "houseNumber")
                          ])),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary),
                          children: [
                            TextSpan(
                              text: 'contact_method',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "contactMethod")
                          ],
                        ),
                      ),
                      Text.rich(TextSpan(
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary),
                          children: [
                            TextSpan(
                              text: 'comments',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "comments")
                          ])),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(),
                        child: Icon(
                          Icons.call,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        onPressed: () {
                          // launch(Uri.encodeFull("tel: $contact"));
                        },
                      ),
                    ),
                    // SizedBox(
                    //   width: 40,
                    // ),
                    // Expanded(
                    //   child: FlatButton(
                    //     splashColor: Palette.SUCCESS,
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(36)),
                    //     color: Palette.PINK,
                    //     child: Image.asset(
                    //       "lib/core/assets/images/comment_logo.png",
                    //       width: 22,
                    //     ),
                    //     onPressed: () {
                    //       openComment();
                    //     },
                    //   ),
                    // ),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: TextButton(
                        // style: Theme.of(context)
                        //     .textButtonTheme
                        //     .style
                        //     ?.copyWith(
                            // backgroundColor: const MaterialStatePropertyAll(
                            //     AppColorScheme.SUCCESS
                            // ),
                            // shape: MaterialStatePropertyAll(
                            //     RoundedRectangleBorder(
                            //         borderRadius:
                            //         BorderRadius.circular(18)))
                        // ),
                        //
                        child: Text(
                          "Delivered",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                              color:
                              Theme.of(context).colorScheme.primary),
                        ),
                        onPressed: () {
                          // showAlertDialog(id);
                          //  updateDeliveryStatus(id.toString(), "DELIVERED");
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DeliveryScreen(
                          //               date: widget.date,
                          //               defaultShift: widget.shift,
                          //             )));
                          // _deliveryInfoAlet(" marked as Delivered ",
                          //     Icons.verified_rounded, true, false);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
