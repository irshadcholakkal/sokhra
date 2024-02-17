import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../core/values/app_constants.dart';
import '../padding/app_padding.dart';

class PromoCode extends StatefulWidget {
  final VoidCallback onPressed;
  final GlobalKey<FormBuilderState> formKey;
  final String? message;
  final String? initialValue;

  const PromoCode(
      {Key? key,
      this.initialValue,
      required this.onPressed,
      required this.formKey,
      required this.message})
      : super(key: key);

  @override
  _PromoCodeState createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            child: Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 200,
                      child: FormBuilder(
                        key: widget.formKey,
                        child: FormBuilderTextField(
                          initialValue: widget.initialValue,
                          name: 'promocode',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          decoration: InputDecoration(
                              fillColor: Theme.of(context).colorScheme.surface,
                              counterText: "",
                              hintText: "Promocode",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 3)),
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
                          "APPLY",
                          style: Theme.of(context).textTheme.button!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary),
                        )),
                  )
                ],
              ),
            ),
          ),
          widget.message != null
              ? AppPadding(
                  dividedBy: 4,
                )
              : Container(),
          widget.message != null
              ? Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultPadding / 2.2),
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
