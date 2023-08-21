import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget imageCard({
  required String imageUrl,
  required String imageId,
  bool localImage = false,
  double elevation = 5,
  EdgeInsetsGeometry margin = EdgeInsets.zero,
  double borderRadius = 7.0,
  double? boxDimension = 55.0,
  ImageProvider placeholderImage = const AssetImage(
    'assets/img/cover.jpg',
  ),
  bool selected = false,
  Function(Object, StackTrace?)? localErrorFunction,
}) {
  return Card(
    elevation: elevation,
    margin: margin,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    clipBehavior: Clip.antiAlias,
    child: SizedBox.square(
      dimension: boxDimension,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (imageUrl.isEmpty)
            Hero(
              tag: imageId,
              child: Image(
                fit: BoxFit.cover,
                errorBuilder: (context, error, stacktrace) {
                  if (localErrorFunction != null) {
                    localErrorFunction(error, stacktrace);
                  }
                  return Image(
                    fit: BoxFit.cover,
                    image: placeholderImage,
                  );
                },
                image: FileImage(
                  File(
                    imageUrl,
                  ),
                ),
              ),
            )
          else
            Hero(
              tag: imageId,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                errorWidget: (context, _, __) => Image(
                  fit: BoxFit.cover,
                  image: placeholderImage,
                ),
                imageUrl: imageUrl,
                filterQuality: FilterQuality.high,
                placeholder: (context, url) => Image(
                  fit: BoxFit.cover,
                  image: placeholderImage,
                ),
              ),
            ),
          if (selected)
            Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
              ),
              child: const Center(
                child: Icon(
                  Icons.check_rounded,
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
