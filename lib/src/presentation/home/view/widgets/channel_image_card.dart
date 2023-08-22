import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChannelImageCard extends StatelessWidget {
  final String imageUrl;
  final String imageId;
  final bool localImage;
  final double elevation;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final double? boxDimension;
  final ImageProvider placeholderImage;
  final bool selected;
  final Function(Object, StackTrace?)? localErrorFunction;

  const ChannelImageCard({super.key, 
    required this.imageUrl,
    required this.imageId,
    this.localImage = false,
    this.elevation = 5,
    this.margin = EdgeInsets.zero,
    this.borderRadius = 7.0,
    this.boxDimension = 55.0,
    this.placeholderImage = const AssetImage('assets/img/cover.jpg'),
    this.selected = false,
    this.localErrorFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox.square(
        dimension: boxDimension!,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildImage(context),
            if (selected) _buildSelectionOverlay(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (imageUrl.isEmpty) {
      return Hero(
        tag: imageId,
        child: Image(
          fit: BoxFit.cover,
          errorBuilder: _handleError,
          image: FileImage(File(imageUrl)),
        ),
      );
    } else {
      return Hero(
        tag: imageId,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => Image(
            fit: BoxFit.cover,
            image: placeholderImage,
          ),
          imageUrl: imageUrl,
          filterQuality: FilterQuality.high,
          placeholder: (_, __) => Image(
            fit: BoxFit.cover,
            image: placeholderImage,
          ),
        ),
      );
    }
  }

  Widget _handleError(BuildContext context, Object error, StackTrace? stacktrace) {
    if (localErrorFunction != null) {
      localErrorFunction!(error, stacktrace);
    }
    return Image(
      fit: BoxFit.cover,
      image: placeholderImage,
    );
  }

  Widget _buildSelectionOverlay() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
      ),
      child: const Center(
        child: Icon(
          Icons.check_rounded,
        ),
      ),
    );
  }
}
