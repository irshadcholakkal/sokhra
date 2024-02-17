import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CommonCarousel extends StatefulWidget {
  final CarouselController? carouselController;
  final double? height;
  final Axis scrollDirection;
  final Widget Function(BuildContext, int, int) itemBuilder;
  final int itemCount;
  final ScrollPhysics? physics;

  const CommonCarousel({
    Key? key,
    this.carouselController,
    this.height,
    required this.scrollDirection,
    required this.itemBuilder,
    required this.itemCount,
    this.physics
  }) : super(key: key);

  @override
  State<CommonCarousel> createState() => _CommonCarouselState();
}

class _CommonCarouselState extends State<CommonCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: widget.carouselController,
      options: CarouselOptions(
          height: widget.height,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: false,
          scrollPhysics: widget.physics,
          scrollDirection: widget.scrollDirection,
          viewportFraction: 1),
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
    );
  }
}
