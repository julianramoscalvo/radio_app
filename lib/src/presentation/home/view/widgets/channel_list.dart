import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_app/src/domain/models/radio_channel.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';
import 'image_card.dart';
import 'package:radio_app/src/utils/helpers/extensions.dart';

class ChannelList extends StatelessWidget {
  const ChannelList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      List<RadioChannel> songsList = state.radioChannels;
      bool loadingMore = state.loadingMore;
      return Expanded(
        child: Align(
          alignment: Alignment.centerLeft,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: songsList.length + (loadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < songsList.length) {
                RadioChannel radioChannel = songsList[index];
                return ListTile(
                    title: Text(
                      radioChannel.name ?? '-',
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      radioChannel.tags != null
                          ? radioChannel.tags!
                              .capitalizeWordsSeparatedByCommas()
                          : '',
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: imageCard(
                      imageUrl: radioChannel.favicon ?? '',
                      imageId: radioChannel.stationuuid ?? '',
                      placeholderImage: const AssetImage(
                        'assets/img/album.png',
                      ),
                    ),
                    onTap: () => context.push(
                          "/player",
                          extra: {'radioChannel': radioChannel},
                        ));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Lottie.asset('assets/animations/ax_headphone.json',
                        width: 50),
                  ),
                );
              }
            },
          ),
        ),
      );
    });
  }
}
