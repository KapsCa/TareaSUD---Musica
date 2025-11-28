
import 'package:flutter/material.dart';
import '../../../core/values/values.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //* Acción al presionar el botón *//
      },
      style: AppStyles.bannerButton,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.play_arrow_rounded, size: 20),
          SizedBox(width: 5),
          Text(AppStrings.btnPlay, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
