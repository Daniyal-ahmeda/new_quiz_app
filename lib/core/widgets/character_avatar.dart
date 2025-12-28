import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;

  const CharacterAvatar({super.key, this.imageUrl, this.radius = 24});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
          ? CachedNetworkImageProvider(imageUrl!)
          : null,
      child: (imageUrl == null || imageUrl!.isEmpty)
          ? Icon(
              Icons.person,
              size: radius * 1.2,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            )
          : null,
    );
  }
}
