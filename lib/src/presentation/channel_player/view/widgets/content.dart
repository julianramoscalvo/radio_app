import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:radio_app/src/domain/models/radio_channel.dart';
import 'package:radio_app/src/presentation/channel_player/cubit/channel_player_cubit.dart';
import 'package:radio_app/src/presentation/channel_player/view/widgets/play_button.dart';
import 'package:radio_app/src/presentation/channel_player/view/widgets/radio_image.dart';
import 'package:radio_app/src/presentation/channel_player/view/widgets/radio_info.dart';
import 'package:go_router/go_router.dart';
import 'appbar_widget.dart';

class Content extends StatelessWidget {
  final RadioChannel radioChannel;

  const Content({required this.radioChannel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWidget(
        onClosePressed: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: RadioImage(radioChannel: radioChannel),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RadioInfo(radioChannel: radioChannel),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PlayButton(
                isPlaying: context.select(
                    (ChannelPlayerCubit cubit) => cubit.state.isPlaying),
                onPlayPressed: () =>
                    context.read<ChannelPlayerCubit>().playRadioChannel(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
