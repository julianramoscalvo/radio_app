import 'package:equatable/equatable.dart';

class ChannelPlayerState extends Equatable {
  final bool isPlaying;

  const ChannelPlayerState({this.isPlaying = true});

  ChannelPlayerState copyWith({
    bool? isPlaying,
  }) {
    return ChannelPlayerState(isPlaying: isPlaying ?? this.isPlaying);
  }

  @override
  List<Object?> get props => [isPlaying];
}
