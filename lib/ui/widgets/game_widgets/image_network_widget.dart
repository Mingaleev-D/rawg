import 'package:flutter/material.dart';

class ImageNetworkWidget extends StatelessWidget {
  final String imageUrlSrc;
  final double height;
  final double width;

  const ImageNetworkWidget(
      {super.key,
      required this.imageUrlSrc,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrlSrc,
      fit: BoxFit.cover,
      height: height,
      width: width,
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          height: height,
          width: width,
          child: const Icon(Icons.broken_image_outlined),
        );
      },
    );
  }
}
