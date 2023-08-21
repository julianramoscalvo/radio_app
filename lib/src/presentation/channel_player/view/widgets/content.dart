import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:radio_app/src/domain/models/radio_channel.dart';
import 'package:radio_app/src/presentation/channel_player/cubit/channel_player_cubit.dart';
import 'package:radio_app/src/utils/helpers/extensions.dart';
import '../../cubit/channel_player_state.dart';

class Content extends StatelessWidget {
  final RadioChannel radioChannel;

  const Content({required this.radioChannel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelPlayerCubit, ChannelPlayerState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(
                    context,
                  ).colorScheme.primary,
                ),
                onPressed: () => context.pop()),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Hero(
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
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
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
                              color: Theme.of(
                                context,
                              ).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        SizedBox(
                          child: Text(
                            radioChannel.tags != null
                                ? radioChannel.tags!
                                    .capitalizeWordsSeparatedByCommas()
                                : '',
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withOpacity(0.5),
                                overflow: TextOverflow.ellipsis),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: AvatarGlow(
                    endRadius: 60.0,
                    animate: state.isPlaying,
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
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary),
                              child: Center(
                                child: Icon(
                                  !state.isPlaying
                                      ? Icons.play_arrow_rounded
                                      : Icons.pause_rounded,
                                  size: 40,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            onPressed: () => context
                                .read<ChannelPlayerCubit>()
                                .playRadioChannel()),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
