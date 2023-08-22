import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/remote/radio_repository.dart';
import '../../../utils/helpers/enum.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ScrollController _scrollController = ScrollController();
  final RadioRepository radioRepository;
  final int itemsPage = 20;
  int currentPage = 0;
  String _searchText = '';

  HomeCubit({required this.radioRepository}) : super(HomeState.initial()) {
    _initScrollListener();
  }

  ScrollController get scrollController => _scrollController;

  void _initScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreRadioChannels();
      }
    });
  }

  Future<void> loadRadioChannels(
      {String searchText = '', bool resetPagination = false}) async {
    emit(state.copyWith(
        status: RequestStatus.loading, radioChannels: [], errorStatus: ''));
    try {
      _searchText = searchText;
      if (resetPagination) {
        currentPage = 0;
      }
      final result = await radioRepository.fetchRadioChannelsPaginated(
        limit: itemsPage,
        offset: currentPage * itemsPage,
        searchText: searchText,
      );
      currentPage++;
      emit(state.copyWith(
          status: RequestStatus.success,
          radioChannels: result,
          errorStatus: ''));
    } catch (error) {
      emit(state.copyWith(
          status: RequestStatus.failure,
          radioChannels: [],
          errorStatus: error.toString()));
    }
  }

  Future<void> _loadMoreRadioChannels() async {
    if (state.status != RequestStatus.loading) {
      emit(state.copyWith(loadingMore: true));
      try {
        final result = await radioRepository.fetchRadioChannelsPaginated(
          limit: itemsPage,
          offset: currentPage * itemsPage,
          searchText: _searchText,
        );
        if (result.isEmpty) {
          emit(state.copyWith(loadingMore: false));
        } else {
          currentPage++;
          emit(state.copyWith(
            radioChannels: [...state.radioChannels, ...result],
            loadingMore: true,
          ));
        }
      } catch (error) {
        emit(state.copyWith(loadingMore: false));
      }
    }
  }

  @override
  Future<void> close() {
    _scrollController.dispose();
    return super.close();
  }
}
