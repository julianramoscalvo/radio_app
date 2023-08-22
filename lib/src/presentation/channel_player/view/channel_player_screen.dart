import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/radio_channel.dart';
import '../cubit/channel_player_cubit.dart';
import 'widgets/content.dart';

class ChannelPlayerScreen extends StatelessWidget {
  final RadioChannel radioChannel;

  const ChannelPlayerScreen({Key? key, required this.radioChannel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChannelPlayerCubit(
        radioChannel: radioChannel,
      ),
      child: Content(radioChannel: radioChannel),
    );
  }
}
