import 'package:equatable/equatable.dart';
import '../../../domain/models/radio_channel.dart';
import '../../../utils/helpers/enum.dart';

class HomeState extends Equatable {
  final List<RadioChannel> radioChannels;
  final RequestStatus status;
  final String errorStatus;
  final bool loadingMore;

  const HomeState({
    required this.radioChannels,
    required this.status,
    required this.errorStatus,
    this.loadingMore = false,
  });

  // Factory constructor for the initial state
  factory HomeState.initial() => const HomeState(
        radioChannels: [],
        status: RequestStatus.loading,
        errorStatus: '',
        loadingMore: false,
      );

  // CopyWith method for creating a new state with updated values
  HomeState copyWith({
    List<RadioChannel>? radioChannels,
    RequestStatus? status,
    String? errorStatus,
    bool? loadingMore,
  }) {
    return HomeState(
      radioChannels: radioChannels ?? this.radioChannels,
      status: status ?? this.status,
      errorStatus: errorStatus ?? this.errorStatus,
      loadingMore: loadingMore ?? this.loadingMore,
    );
  }

  @override
  List<Object?> get props => [radioChannels, status, errorStatus, loadingMore];
}
