class RadioChannel {
  String? changeuuid;
  String? stationuuid;
  String? name;
  String? url;
  String? urlResolved;
  String? homepage;
  String? favicon;
  String? tags;
  String? country;
  String? countrycode;
  String? state;
  String? language;
  String? languagecodes;
  int? votes;
  String? lastchangetime;
  String? lastchangetimeIso8601;
  String? codec;
  int? bitrate;
  int? hls;
  int? lastcheckok;
  String? lastchecktime;
  String? lastchecktimeIso8601;
  String? lastcheckoktime;
  String? lastcheckoktimeIso8601;
  String? lastlocalchecktime;
  String? clicktimestamp;
  String? clicktimestampIso8601;
  int? clickcount;
  int? clicktrend;
  int? sslError;

  bool? hasExtendedInfo;

  RadioChannel(
      {this.changeuuid,
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
      this.hasExtendedInfo});

  RadioChannel.fromJson(Map<String, dynamic> json) {
    changeuuid = json['changeuuid'];
    stationuuid = json['stationuuid'];
    name = json['name'];
    url = json['url'];
    urlResolved = json['url_resolved'];
    homepage = json['homepage'];
    favicon = json['favicon'];
    tags = json['tags'];
    country = json['country'];
    countrycode = json['countrycode'];
    state = json['state'];
    language = json['language'];
    languagecodes = json['languagecodes'];
    votes = json['votes'];
    lastchangetime = json['lastchangetime'];
    lastchangetimeIso8601 = json['lastchangetime_iso8601'];
    codec = json['codec'];
    bitrate = json['bitrate'];
    hls = json['hls'];
    lastcheckok = json['lastcheckok'];
    lastchecktime = json['lastchecktime'];
    lastchecktimeIso8601 = json['lastchecktime_iso8601'];
    lastcheckoktime = json['lastcheckoktime'];
    lastcheckoktimeIso8601 = json['lastcheckoktime_iso8601'];
    lastlocalchecktime = json['lastlocalchecktime'];
    clicktimestamp = json['clicktimestamp'];
    clicktimestampIso8601 = json['clicktimestamp_iso8601'];
    clickcount = json['clickcount'];
    clicktrend = json['clicktrend'];
    sslError = json['ssl_error'];
    hasExtendedInfo = json['has_extended_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['changeuuid'] = changeuuid;
    data['stationuuid'] = stationuuid;
    data['name'] = name;
    data['url'] = url;
    data['url_resolved'] = urlResolved;
    data['homepage'] = homepage;
    data['favicon'] = favicon;
    data['tags'] = tags;
    data['country'] = country;
    data['countrycode'] = countrycode;
    data['state'] = state;
    data['language'] = language;
    data['languagecodes'] = languagecodes;
    data['votes'] = votes;
    data['lastchangetime'] = lastchangetime;
    data['lastchangetime_iso8601'] = lastchangetimeIso8601;
    data['codec'] = codec;
    data['bitrate'] = bitrate;
    data['hls'] = hls;
    data['lastcheckok'] = lastcheckok;
    data['lastchecktime'] = lastchecktime;
    data['lastchecktime_iso8601'] = lastchecktimeIso8601;
    data['lastcheckoktime'] = lastcheckoktime;
    data['lastcheckoktime_iso8601'] = lastcheckoktimeIso8601;
    data['lastlocalchecktime'] = lastlocalchecktime;
    data['clicktimestamp'] = clicktimestamp;
    data['clicktimestamp_iso8601'] = clicktimestampIso8601;
    data['clickcount'] = clickcount;
    data['clicktrend'] = clicktrend;
    data['ssl_error'] = sslError;
    data['has_extended_info'] = hasExtendedInfo;
    return data;
  }
}
