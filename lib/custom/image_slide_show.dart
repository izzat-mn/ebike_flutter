import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageSlideShow extends StatelessWidget {
  final double height;
  final bool isLoop;
  final List<Widget> children;
  const ImageSlideShow(
      {super.key,
      required this.height,
      required this.isLoop,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      indicatorColor: Colour.white,
      autoPlayInterval: 3000,
      height: height,
      isLoop: isLoop,
      children: children,
    );
  }
}
