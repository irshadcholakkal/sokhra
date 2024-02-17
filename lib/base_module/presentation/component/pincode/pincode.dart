import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../core/values/app_constants.dart';
import '../padding/app_padding.dart';

class PinCode extends StatefulWidget {
  final VoidCallback onPressed;
  final GlobalKey<FormBuilderState> formKey;
  final String? message;
  final String? location;
  final String? initialValue;

  PinCode(
      {Key? key,
      this.initialValue,
      required this.formKey,
      required this.onPressed,
      required this.location,
      required this.message})
      : super(key: key);

  @override
  State<PinCode> createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: AppConstants.defaultPadding * 0.2),
            width: double.infinity,
            child: Text(
              "Check delivery availability",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const AppPadding(
            dividedBy: 4,
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 240,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 120,
                          child: FormBuilder(
                            key: widget.formKey,
                            child: FormBuilderTextField(
                              initialValue: widget.initialValue,
                              name: 'pincode',
                              maxLength: 6,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration: InputDecoration(
                                  fillColor:
                                      Theme.of(context).colorScheme.background,
                                  counterText: "",
                                  hintText: "Pincode", ////todo add translation
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 3)),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 100,
                        child: ElevatedButton(
                            onPressed: widget.onPressed,
                            style: Theme.of(context)
                                .elevatedButtonTheme
                                .style!
                                .copyWith(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(5))),
                            child: Text(
                              "CHECK", //todo add translation
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          widget.location != null
              ? AppPadding(
                  dividedBy: 4,
                )
              : Container(),
          widget.location != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      widget.location ?? "",
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      maxLines: 3,
                    ),
                  ),
                )
              : Container(),
          widget.message != null
              ? AppPadding(
                  dividedBy: 4,
                )
              : Container(),
          widget.message != null
              ? Container(
                  width: double.infinity,
                  child: Text(
                    "${widget.message}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
