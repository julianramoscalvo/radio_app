class RadioChannel {
  final String? changeuuid;
  final String? stationuuid;
  final String? name;
  final String? url;
  final String? urlResolved;
  final String? homepage;
  final String? favicon;
  final String? tags;
  final String? country;
  final String? countrycode;
  final String? state;
  final String? language;
  final String? languagecodes;
  final int? votes;
  final String? lastchangetime;
  final String? lastchangetimeIso8601;
  final String? codec;
  final int? bitrate;
  final int? hls;
  final int? lastcheckok;
  final String? lastchecktime;
  final String? lastchecktimeIso8601;
  final String? lastcheckoktime;
  final String? lastcheckoktimeIso8601;
  final String? lastlocalchecktime;
  final String? clicktimestamp;
  final String? clicktimestampIso8601;
  final int? clickcount;
  final int? clicktrend;
  final int? sslError;
  final bool? hasExtendedInfo;

  RadioChannel({
    this.changeuuid,
    this.stationuuid,
    this.name,
    this.url,
    this.urlResolved,
    this.homepage,
    this.favicon,
    this.tags,
    this.country,
    this.countrycode,
    this.state,
    this.language,
    this.languagecodes,
    this.votes,
    this.lastchangetime,
    this.lastchangetimeIso8601,
    this.codec,
    this.bitrate,
    this.hls,
    this.lastcheckok,
    this.lastchecktime,
    this.lastchecktimeIso8601,
    this.lastcheckoktime,
    this.lastcheckoktimeIso8601,
    this.lastlocalchecktime,
    this.clicktimestamp,
    this.clicktimestampIso8601,
    this.clickcount,
    this.clicktrend,
    this.sslError,
    this.hasExtendedInfo,
  });

  factory RadioChannel.fromJson(Map<String, dynamic> json) {
    return RadioChannel(
      changeuuid: json['changeuuid'],
      stationuuid: json['stationuuid'],
      name: json['name'],
      url: json['url'],
      urlResolved: json['url_resolved'],
      homepage: json['homepage'],
      favicon: json['favicon'],
      tags: json['tags'],
      country: json['country'],
      countrycode: json['countrycode'],
      state: json['state'],
      language: json['language'],
      languagecodes: json['languagecodes'],
      votes: json['votes'],
      lastchangetime: json['lastchangetime'],
      lastchangetimeIso8601: json['lastchangetime_iso8601'],
      codec: json['codec'],
      bitrate: json['bitrate'],
      hls: json['hls'],
      lastcheckok: json['lastcheckok'],
      lastchecktime: json['lastchecktime'],
      lastchecktimeIso8601: json['lastchecktime_iso8601'],
      lastcheckoktime: json['lastcheckoktime'],
      lastcheckoktimeIso8601: json['lastcheckoktime_iso8601'],
      lastlocalchecktime: json['lastlocalchecktime'],
      clicktimestamp: json['clicktimestamp'],
      clicktimestampIso8601: json['clicktimestamp_iso8601'],
      clickcount: json['clickcount'],
      clicktrend: json['clicktrend'],
      sslError: json['ssl_error'],
      hasExtendedInfo: json['has_extended_info'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'changeuuid': changeuuid,
      'stationuuid': stationuuid,
      'name': name,
      'url': url,
      'url_resolved': urlResolved,
      'homepage': homepage,
      'favicon': favicon,
      'tags': tags,
      'country': country,
      'countrycode': countrycode,
      'state': state,
      'language': language,
      'languagecodes': languagecodes,
      'votes': votes,
      'lastchangetime': lastchangetime,
      'lastchangetime_iso8601': lastchangetimeIso8601,
      'codec': codec,
      'bitrate': bitrate,
      'hls': hls,
      'lastcheckok': lastcheckok,
      'lastchecktime': lastchecktime,
      'lastchecktime_iso8601': lastchecktimeIso8601,
      'lastcheckoktime': lastcheckoktime,
      'lastcheckoktime_iso8601': lastcheckoktimeIso8601,
      'lastlocalchecktime': lastlocalchecktime,
      'clicktimestamp': clicktimestamp,
      'clicktimestamp_iso8601': clicktimestampIso8601,
      'clickcount': clickcount,
      'clicktrend': clicktrend,
      'ssl_error': sslError,
      'has_extended_info': hasExtendedInfo,
    };
  }
}
