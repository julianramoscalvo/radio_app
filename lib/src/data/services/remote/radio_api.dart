import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../domain/models/radio_channel.dart';

class RadioApiService {
  final String baseUrl =
      'https://nl1.api.radio-browser.info/json/stations/search';

  Future<List<RadioChannel>> fetchRadioChannelsPaginated({
    required int limit,
    required int offset,
    String searchText = '',
  }) async {
    final queryParams = {
      'countrycode': 'ES',
      'name': searchText,
      'limit': limit.toString(),
      'offset': offset.toString(),
      'order': 'name',
    };
    final uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);
    final response = await http.get(uri);
    print('URL -> $baseUrl -> parameters: $queryParams');
    if (response.statusCode == 200) {
      final List<dynamic> jsonList =
          json.decode(utf8.decode(response.bodyBytes));
      final List<RadioChannel> channels = jsonList.map((json) {
        return RadioChannel.fromJson(json);
      }).toList();

      return channels;
    } else {
      throw Exception('Failed to load radio channels');
    }
  }
}
