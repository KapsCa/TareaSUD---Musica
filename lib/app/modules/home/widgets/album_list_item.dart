import 'package:flutter/material.dart';

import '../../../core/values/values.dart';
import '../../../data/models/song_model.dart';

class AlbumListItem extends StatelessWidget {
  const AlbumListItem({super.key, required this.album});

  final Song album;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: AssetImage(album.imagePath),
            radius: 35,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(album.title, style: AppStyles.title),
                Text(album.artist, style: AppStyles.subtitle),
                Text(album.duration, style: AppStyles.duration),
              ],
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(Icons.more_vert, color: Colors.white70),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
