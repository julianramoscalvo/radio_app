import 'package:flutter/material.dart';
import 'package:radio_app/src/domain/models/radio_channel.dart';
import 'package:radio_app/src/utils/helpers/extensions.dart';

class RadioInfo extends StatelessWidget {
  final RadioChannel radioChannel;

  const RadioInfo({super.key, required this.radioChannel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 80,
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            radioChannel.name ?? '',
            maxLines: 1,
            style: TextStyle(
              fontSize: 35,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            child: Text(
              radioChannel.tags?.capitalizeWordsSeparatedByCommas() ?? '',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
