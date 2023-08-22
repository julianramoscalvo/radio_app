import 'package:flutter/material.dart';
import 'package:radio_app/src/data/services/remote/radio_api.dart';
import '../../../domain/models/radio_channel.dart';

class RadioRepository {
  final RadioApiService _apiService;

  RadioRepository({required RadioApiService apiService})
      : _apiService = apiService;

  Future<List<RadioChannel>> fetchRadioChannelsPaginated({
    required int limit,
    required int offset,
    String searchText = '',
  }) async {
    try {
      final List<RadioChannel> channels =
          await _apiService.fetchRadioChannelsPaginated(
        limit: limit,
        offset: offset,
        searchText: searchText,
      );
      return channels;
    } catch (error) {
      debugPrint('Error fetching radio channels: $error');
      rethrow;
    }
  }
}
