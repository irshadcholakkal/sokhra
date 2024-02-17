import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../../base_module/domain/entity/translation.dart';

class OtpTimer extends StatefulWidget {
  final Function()? onTap;

  const OtpTimer({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  late Timer _timer;
  String _timerMessage = "00:60";
  bool _hasTimerEnded = false;

  @override
  void initState() {
    super.initState();

    const duration = Duration(seconds: 60);
    final initialDateTime = DateTime.now();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        final difference = DateTime.now().difference(initialDateTime);

        if (difference.inSeconds < duration.inSeconds) {
          setState(() {
            _timerMessage =
                "00:${(duration.inSeconds - difference.inSeconds).toString().padLeft(2, "0")}";
          });
        } else {
          setState(() {
            _hasTimerEnded = true;
          });

          timer.cancel();
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _hasTimerEnded ? widget.onTap : null,
      child: RichText(
        text: TextSpan(
          text: _hasTimerEnded
              ? translation.of("user.resend")
              : translation.of("user.resend_in"),
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                decoration: _hasTimerEnded
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
          children: _hasTimerEnded
              ? []
              : [
                  TextSpan(
                    text: " $_timerMessage ",
                  ),
                ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
