import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../domain/entity/translation.dart';
import '../../../component/buttons/clear_button.dart';
import '../../../component/buttons/edit_button.dart';
import '../../../component/buttons/save_button.dart';
import '../../../component/form/form_frame.dart';
import '../../../component/padding/app_padding.dart';

//ref: https://pub.dev/packages/flutter_form_builder

class FormDemoContent extends StatefulWidget {
  @override
  FormDemoContentState createState() {
    return FormDemoContentState();
  }
}

class FormDemoContentState extends State<FormDemoContent> {
  bool autoValidate = true;
  late bool readOnly;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _ageHasError = false;
  bool _genderHasError = false;

  void _onChanged(val) => debugPrint(val.toString());
  List<String> genderOptions = ['Male', 'Female', 'Other'];

  @override
  void initState() {
    readOnly = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormFrame(
            title: "Demo Form",
            actions: [
              if (!readOnly)
                ClearButton(
                  onpress: () {
                    _formKey.currentState?.reset();
                  },
                ),
              if (readOnly)
                EditButton(
                  onpress: () {
                    setState(() {
                      readOnly = false;
                    });
                  },
                ),
              if (readOnly)
                // DeleteButton(
                //   onpress: () {
                //     //
                //   }, id: '',
                // ),
                if (!readOnly)
                  SaveButton(
                    onpress: () {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        debugPrint(_formKey.currentState?.value.toString());
                        setState(() {
                          readOnly = true;
                        });
                      } else {
                        debugPrint(_formKey.currentState?.value.toString());
                        debugPrint('validation failed');
                      }
                    },
                  ),
            ],
            footerActions: [
              ClearButton(
                // isExpanded:true,
                onpress: () {
                  _formKey.currentState?.reset();
                },
              ),
              SaveButton(
                isExpanded: true,
                onpress: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    debugPrint(_formKey.currentState?.value.toString());
                    setState(() {
                      readOnly = true;
                    });
                  } else {
                    debugPrint(_formKey.currentState?.value.toString());
                    debugPrint('validation failed');
                  }
                },
              ),
            ],
            formBuilder: FormBuilder(
              key: _formKey,
              enabled: !readOnly,
              autovalidateMode: AutovalidateMode.disabled,
              initialValue: const {
                'movie_rating': 5,
                'best_language': 'Dart',
                'age': '13',
                'gender': 'Male'
              },
              skipDisabled: true,
              child: Column(
                children: <Widget>[
                  const AppPadding(dividedBy: 2),
                  FormBuilderDateTimePicker(
                    name: 'date',
                    initialValue: DateTime.now(),
                    inputType: InputType.time,
                    decoration: InputDecoration(
                      labelText: 'Appointment Time',
                      prefixIcon: const Icon(MdiIcons.clockOutline),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _formKey.currentState!.fields['date']
                                ?.didChange(null);
                          }),
                    ),
                    initialTime: const TimeOfDay(hour: 8, minute: 0),
                    locale: translation.selectedLocale,
                  ),
                  const AppPadding(),
                  FormBuilderDateRangePicker(
                    name: 'date_range',
                    firstDate: DateTime(1970),
                    lastDate: DateTime(2030),
                    format: DateFormat('yyyy-MM-dd'),
                    onChanged: _onChanged,
                    decoration: InputDecoration(
                      labelText: 'Date Range',
                      helperText: 'Helper text',
                      hintText: 'Hint text',
                      prefixIcon: const Icon(MdiIcons.calendar),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _formKey.currentState!.fields['date_range']
                                ?.didChange(null);
                          }),
                    ),
                  ),
                  const AppPadding(),
                  FormBuilderSlider(
                    name: 'slider',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.min(6),
                    ]),
                    onChanged: _onChanged,
                    min: 0.0,
                    max: 10.0,
                    initialValue: 7.0,
                    divisions: 20,
                    activeColor: Theme.of(context).colorScheme.primary,
                    inactiveColor: Theme.of(context).colorScheme.onSurface,
                    decoration: const InputDecoration(
                      labelText: 'Number of things',
                      filled: false,
                    ),
                  ),
                  const AppPadding(),
                  FormBuilderRangeSlider(
                    name: 'range_slider',
                    // validator: FormBuilderValidators.compose([FormBuilderValidators.min(context, 6)]),
                    onChanged: _onChanged,
                    min: 0.0,
                    max: 100.0,
                    initialValue: const RangeValues(4, 7),
                    divisions: 20,
                    activeColor: Theme.of(context).colorScheme.primary,
                    inactiveColor: Theme.of(context).colorScheme.onSurface,
                    decoration: const InputDecoration(
                      labelText: 'Price Range',
                      filled: false,
                    ),
                  ),
                  FormBuilderCheckbox(
                    name: 'accept_terms',
                    initialValue: false,
                    onChanged: _onChanged,
                    decoration: const InputDecoration(
                        filled: false, errorBorder: InputBorder.none),
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'I have read and agree to the ',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                            // Flutter doesn't allow a button inside a button
                            // https://github.com/flutter/flutter/issues/31437#issuecomment-492411086
                            /*
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('launch url');
                              },
                            */
                          ),
                        ],
                      ),
                    ),
                    activeColor: Theme.of(context).colorScheme.primary,
                    validator: FormBuilderValidators.equal(
                      true,
                      errorText:
                          'You must accept terms and conditions to continue',
                    ),
                  ),
                  const AppPadding(),
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.always,
                    name: 'age',
                    decoration: InputDecoration(
                      labelText: 'Age',
                      suffixIcon: _ageHasError
                          ? const Icon(Icons.error, color: Colors.red)
                          : const Icon(Icons.check, color: Colors.green),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _ageHasError = !(_formKey.currentState?.fields['age']
                                ?.validate() ??
                            false);
                      });
                    },
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.max(70),
                    ]),
                    // initialValue: '12',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  const AppPadding(),
                  FormBuilderDropdown<String>(
                    // autovalidate: true,
                    name: 'gender',
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      suffix: _genderHasError
                          ? const Icon(Icons.error)
                          : const Icon(Icons.check),
                    ),
                    // initialValue: 'Male',
                    allowClear: true,
                    hint: const Text('Select Gender'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                    items: genderOptions
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                    onChanged: (val) {
                      debugPrint(val.toString());
                      setState(() {
                        _genderHasError = !(_formKey
                                .currentState?.fields['gender']
                                ?.validate() ??
                            false);
                      });
                    },
                  ),
                  const AppPadding(),
                  FormBuilderRadioGroup<String>(
                    decoration: const InputDecoration(
                      labelText: 'My chosen language',
                      filled: false,
                    ),
                    name: 'best_language',
                    onChanged: _onChanged,
                    activeColor: Theme.of(context).colorScheme.primary,
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                    options: ['Dart', 'Kotlin', 'Java', 'Swift', 'Objective-C']
                        .map((lang) => FormBuilderFieldOption(
                              value: lang,
                              child: Text(lang),
                            ))
                        .toList(growable: false),
                  ),
                  const AppPadding(),
                  FormBuilderSegmentedControl(
                    decoration: const InputDecoration(
                      labelText: 'Movie Rating (Archer)',
                      filled: false,
                    ),
                    name: 'movie_rating',
                    // initialValue: 1,
                    // textStyle: TextStyle(fontWeight: FontWeight.bold),
                    options: List.generate(5, (i) => i + 1)
                        .map((number) => FormBuilderFieldOption(
                              value: number,
                              child: Text(
                                number.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                    onChanged: _onChanged,
                  ),
                  const AppPadding(),
                  FormBuilderSwitch(
                    title: const Text('I Accept the tems and conditions'),
                    name: 'accept_terms_switch',
                    initialValue: true,
                    onChanged: _onChanged,
                    activeColor: Theme.of(context).colorScheme.primary,
                    decoration: const InputDecoration(
                      filled: false,
                    ),
                  ),
                  const AppPadding(),
                  FormBuilderCheckboxGroup(
                    decoration: const InputDecoration(
                      labelText: 'The language of my people',
                      filled: false,
                    ),
                    name: 'languages',
                    initialValue: const ['Dart'],
                    activeColor: Theme.of(context).colorScheme.primary,
                    options: const [
                      FormBuilderFieldOption(value: 'Dart'),
                      FormBuilderFieldOption(value: 'Kotlin'),
                      FormBuilderFieldOption(value: 'Java'),
                      FormBuilderFieldOption(value: 'Swift'),
                      FormBuilderFieldOption(value: 'Objective-C'),
                    ],
                    onChanged: _onChanged,
                    separator: const VerticalDivider(
                      width: 10,
                      thickness: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
