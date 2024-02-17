import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  DatePickerWidget({required this.onDateSelected});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });

      widget.onDateSelected(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Selected Date:',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          '${selectedDate.toLocal()}'.split(' ')[0],
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => _selectDate(context),
          child: Text('Select Date'),
        ),
      ],
    );
  }
}
