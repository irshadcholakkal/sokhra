import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../component/padding/app_padding.dart';

class TextFieldDemo extends StatelessWidget {
  const TextFieldDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppPadding(),
        Text(
          "TextField",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const AppPadding(dividedBy: 2),
        // const TextField(
        //   decoration: InputDecoration(
        //     labelText: "First Name",
        //   ),
        // ),
        FormBuilderTextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.phone_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            hintText: "Email or Phone number",
          ),
          keyboardType: TextInputType.phone,
          name: 'name',
        ),
        const AppPadding(dividedBy: 2),
        // const TextField(
        //   decoration: InputDecoration(
        //     labelText: "First Name with icon",
        //     prefixIcon: Icon(
        //       Icons.person,
        //     ),
        //   ),
        // ),
        const AppPadding(dividedBy: 2),
        // const TextField(
        //   decoration: InputDecoration(
        //     labelText: "First Name disabled",
        //     enabled: false,
        //     prefixIcon: Icon(
        //       Icons.person,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
