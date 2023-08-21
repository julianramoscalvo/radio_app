import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/src/domain/models/radio_channel.dart';
import 'package:radio_player/radio_player.dart';
import 'channel_player_state.dart';

class ChannelPlayerCubit extends Cubit<ChannelPlayerState> {
  final RadioChannel radioChannel;
  RadioPlayer radioPlayer = RadioPlayer();

  ChannelPlayerCubit({required this.radioChannel})
      : super(const ChannelPlayerState()) {
    _initRadioPlayer(radioChannel);
  }

  void _initRadioPlayer(RadioChannel radioChannel) async {
    await radioPlayer.setChannel(
        title: radioChannel.name ?? '',
        url: radioChannel.url ?? '',
        imagePath: 'assets/img/album.png');
    await radioPlayer.play();
  }

  void playRadioChannel() {
    if (state.isPlaying) {
      radioPlayer.pause();
    } else {
      radioPlayer.play();
    }
    emit(state.copyWith(isPlaying: !state.isPlaying));
  }

  void resetRadioPlayer() {
    radioPlayer.pause();
  }

  @override
  Future<void> close() {
    resetRadioPlayer();
    return super.close();
  }
}
