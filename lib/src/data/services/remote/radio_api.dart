import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../domain/models/radio_channel.dart';

class RadioApiService {
  final String baseUrl = 'https://at1.api.radio-browser.info/json';
  //http://at1.api.radio-browser.info/json/stations/search

  Future<List<RadioChannel>> fetchRadioChannelsPaginated({
    required int limit,
    required int offset,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl/stations/bycountry/spain?order=name&limit=$limit&offset=$offset'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(utf8.decode(response.bodyBytes));
      final List<RadioChannel> channels = jsonList.map((json) {
        return RadioChannel.fromJson(json);
      }).toList();

      return channels;
    } else {
      throw Exception('Failed to load radio channels');
    }
  }
}
