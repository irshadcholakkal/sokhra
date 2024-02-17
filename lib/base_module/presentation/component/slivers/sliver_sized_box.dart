import 'package:flutter/material.dart';

class SliverSizedBox extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const SliverSizedBox({
    Key? key,
    this.height,
    this.width,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        SizedBox(
          height: height,
          width: width,
          child: child,
        ),
      ]),
    );
  }
}
