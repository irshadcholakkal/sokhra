import 'package:flutter/material.dart';

import '../../../component/padding/app_padding.dart';
import '../../../core/values/app_constants.dart';
import 'form_demo_content.dart';

//ref: https://pub.dev/packages/flutter_form_builder

class FormDemo extends StatefulWidget {
  @override
  FormDemoState createState() {
    return FormDemoState();
  }
}

class FormDemoState extends State<FormDemo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.defaultPadding / 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const AppPadding(
            dividedBy: 2,
          ),
          Text(
            "Form Demo",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const AppPadding(dividedBy: 2),
          FormDemoContent(),
        ],
      ),
    );
  }
}
