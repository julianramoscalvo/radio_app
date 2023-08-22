import 'package:flutter/material.dart';
import 'package:radio_app/src/domain/models/radio_channel.dart';

class RadioImage extends StatelessWidget {
  final RadioChannel radioChannel;

  const RadioImage({super.key, required this.radioChannel});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: radioChannel.stationuuid ?? '',
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: MediaQuery.of(context).size.width - 60,
        decoration: radioChannel.favicon != null &&
                radioChannel.favicon!.isNotEmpty
            ? BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(radioChannel.favicon!),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20))
            : BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/img/album.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
