import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class PlayButton extends StatelessWidget {
  final bool isPlaying;
  final Function() onPlayPressed;

  const PlayButton({
    super.key,
    required this.isPlaying,
    required this.onPlayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      endRadius: 60.0,
      animate: isPlaying,
      child: Material(
        elevation: 8.0,
        shape: const CircleBorder(),
        child: CircleAvatar(
          backgroundColor: Colors.grey[100],
          radius: 30.0,
          child: IconButton(
            iconSize: 50,
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                child: Icon(
                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
            onPressed: onPlayPressed,
          ),
        ),
      ),
    );
  }
}
