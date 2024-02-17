import 'package:flutter/material.dart';

class LoadFailedButton extends StatelessWidget {
  final String? message;
  final Function? onPressed;

  const LoadFailedButton({
    Key? key,
    required this.message,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(message ?? "could_not_load"),
          onPressed != null
              ? ElevatedButton(
                  child: Text("retry"),
                  onPressed: onPressed!(),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
