/// urlData : {"longUrl":"https://www.geeksforgeeks.org/flutter-circular-linear-progress-indicators/","shortCode":"k10DnaL","type":"web","errorMessage":null,"totalLinks":26136,"siteKey":null,"hits":0}

class CreateShortLinkResponseModel {
  CreateShortLinkResponseModel({
      UrlData? urlData,}){
    _urlData = urlData;
}

  CreateShortLinkResponseModel.fromJson(dynamic json) {
    _urlData = json['urlData'] != null ? UrlData.fromJson(json['urlData']) : null;
  }
  UrlData? _urlData;
CreateShortLinkResponseModel copyWith({  UrlData? urlData,
}) => CreateShortLinkResponseModel(  urlData: urlData ?? _urlData,
);
  UrlData? get urlData => _urlData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_urlData != null) {
      map['urlData'] = _urlData?.toJson();
    }
    return map;
  }

}

/// longUrl : "https://www.geeksforgeeks.org/flutter-circular-linear-progress-indicators/"
/// shortCode : "k10DnaL"
/// type : "web"
/// errorMessage : null
/// totalLinks : 26136
/// siteKey : null
/// hits : 0

class UrlData {
  UrlData({
      String? longUrl, 
      String? shortCode, 
      String? type, 
      dynamic errorMessage, 
      num? totalLinks, 
      dynamic siteKey, 
      num? hits,}){
    _longUrl = longUrl;
    _shortCode = shortCode;
    _type = type;
    _errorMessage = errorMessage;
    _totalLinks = totalLinks;
    _siteKey = siteKey;
    _hits = hits;
}

  UrlData.fromJson(dynamic json) {
    _longUrl = json['longUrl'];
    _shortCode = json['shortCode'];
    _type = json['type'];
    _errorMessage = json['errorMessage'];
    _totalLinks = json['totalLinks'];
    _siteKey = json['siteKey'];
    _hits = json['hits'];
  }
  String? _longUrl;
  String? _shortCode;
  String? _type;
  dynamic _errorMessage;
  num? _totalLinks;
  dynamic _siteKey;
  num? _hits;
UrlData copyWith({  String? longUrl,
  String? shortCode,
  String? type,
  dynamic errorMessage,
  num? totalLinks,
  dynamic siteKey,
  num? hits,
}) => UrlData(  longUrl: longUrl ?? _longUrl,
  shortCode: shortCode ?? _shortCode,
  type: type ?? _type,
  errorMessage: errorMessage ?? _errorMessage,
  totalLinks: totalLinks ?? _totalLinks,
  siteKey: siteKey ?? _siteKey,
  hits: hits ?? _hits,
);
  String? get longUrl => _longUrl;
  String? get shortCode => _shortCode;
  String? get type => _type;
  dynamic get errorMessage => _errorMessage;
  num? get totalLinks => _totalLinks;
  dynamic get siteKey => _siteKey;
  num? get hits => _hits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['longUrl'] = _longUrl;
    map['shortCode'] = _shortCode;
    map['type'] = _type;
    map['errorMessage'] = _errorMessage;
    map['totalLinks'] = _totalLinks;
    map['siteKey'] = _siteKey;
    map['hits'] = _hits;
    return map;
  }

}