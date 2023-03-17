import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  String? imageUrl;
  double radious;
  CachedImage({
    super.key,
    this.imageUrl,
    this.radious = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radious)),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl ?? '',
        errorWidget: (context, url, error) {
          return Container(
            color: Colors.red[400],
          );
        },
        placeholder: (context, url) {
          return Container(
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
