import 'dart:convert';
/// segments : [[{"departure_flight_no":"222","img":"https://phptravels.net/api/uploads/images/flights/airlines/PK.png","departure_time":"03:15 AM","departure_date":"29-09-2022","arrival_time":"04:20 AM","arrival_date":"29-09-2022","departure_code":"LHE","departure_airport":"Lahore","arrival_code":"DXB","arrival_airport":"Dubai","duration_time":"4","currency_code":"USD","price":100,"actual_price":100,"b2c_price":"110.00","b2b_price":"105.00","b2e_price":"102.00","b2c_markup":"10","b2b_markup":"5","b2e_markup":"2","service_fee":"5","desposit":"100","adult_price_b2b":"105.00","adult_price_b2c":"110.00","adult_price_b2e":"102.00","child_price_b2b":"210.00","child_price_b2c":"220.00","child_price_b2e":"204.00","infant_price_b2b":"315.00","infant_price_b2c":"330.00","infant_price_b2e":"306.00","adult_price":"100","child_price":"200","infant_price":"300","url":"","airline_name":"Pakistan International Airlines","class_type":"economy","form":"<input name=\"tripType\" type=\"hidden\"  value=\"oneway\" /><input name=\"setting_id\" type=\"hidden\"  value=\"1\" /><input name=\"adults\" type=\"hidden\"  value=\"1\" /><input name=\"children\" type=\"hidden\"  value=\"0\" /><input name=\"infant\" type=\"hidden\"  value=\"0\" />","form_name":"","action":"https://phptravels.net/api/flights/book","desc":"<p>test</p>\r\n","luggage":"40","refundable":"Non Refundable","supplier_id":"6","supplier":"manual","module_color":""}]]

Controllers controllersFromJson(String str) => Controllers.fromJson(json.decode(str));
String controllersToJson(Controllers data) => json.encode(data.toJson());
class Controllers {
  Controllers({
    List<List<Segments>>? segments,})
  {
    _segments = segments;
  }

  Controllers.fromJson(dynamic json) {
    if (json['segments'] != null) {
      _segments = [];
      json['segments'].forEach((v) {
        _segments?.add(v.fromJson(v));
      });
    }
  }
  List<List<Segments>>? _segments;
  Controllers copyWith({  List<List<Segments>>? segments,
  }) => Controllers(  segments: segments ?? _segments,
  );
  List<List<Segments>>? get segments => _segments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_segments != null) {
      map['segments'] = _segments;
    }
    return map;
  }

}

/// departure_flight_no : "222"
/// img : "https://phptravels.net/api/uploads/images/flights/airlines/PK.png"
/// departure_time : "03:15 AM"
/// departure_date : "29-09-2022"
/// arrival_time : "04:20 AM"
/// arrival_date : "29-09-2022"
/// departure_code : "LHE"
/// departure_airport : "Lahore"
/// arrival_code : "DXB"
/// arrival_airport : "Dubai"
/// duration_time : "4"
/// currency_code : "USD"
/// price : 100
/// actual_price : 100
/// b2c_price : "110.00"
/// b2b_price : "105.00"
/// b2e_price : "102.00"
/// b2c_markup : "10"
/// b2b_markup : "5"
/// b2e_markup : "2"
/// service_fee : "5"
/// desposit : "100"
/// adult_price_b2b : "105.00"
/// adult_price_b2c : "110.00"
/// adult_price_b2e : "102.00"
/// child_price_b2b : "210.00"
/// child_price_b2c : "220.00"
/// child_price_b2e : "204.00"
/// infant_price_b2b : "315.00"
/// infant_price_b2c : "330.00"
/// infant_price_b2e : "306.00"
/// adult_price : "100"
/// child_price : "200"
/// infant_price : "300"
/// url : ""
/// airline_name : "Pakistan International Airlines"
/// class_type : "economy"
/// form : "<input name=\"tripType\" type=\"hidden\"  value=\"oneway\" /><input name=\"setting_id\" type=\"hidden\"  value=\"1\" /><input name=\"adults\" type=\"hidden\"  value=\"1\" /><input name=\"children\" type=\"hidden\"  value=\"0\" /><input name=\"infant\" type=\"hidden\"  value=\"0\" />"
/// form_name : ""
/// action : "https://phptravels.net/api/flights/book"
/// desc : "<p>test</p>\r\n"
/// luggage : "40"
/// refundable : "Non Refundable"
/// supplier_id : "6"
/// supplier : "manual"
/// module_color : ""

Segments segmentsFromJson(String str) => Segments.fromJson(json.decode(str));
String segmentsToJson(Segments data) => json.encode(data.toJson());
class Segments {
  Segments({
    String? departureFlightNo,
    String? img,
    String? departureTime,
    String? departureDate,
    String? arrivalTime,
    String? arrivalDate,
    String? departureCode,
    String? departureAirport,
    String? arrivalCode,
    String? arrivalAirport,
    String? durationTime,
    String? currencyCode,
    int? price,
    int? actualPrice,
    String? b2cPrice,
    String? b2bPrice,
    String? b2ePrice,
    String? b2cMarkup,
    String? b2bMarkup,
    String? b2eMarkup,
    String? serviceFee,
    String? desposit,
    String? adultPriceB2b,
    String? adultPriceB2c,
    String? adultPriceB2e,
    String? childPriceB2b,
    String? childPriceB2c,
    String? childPriceB2e,
    String? infantPriceB2b,
    String? infantPriceB2c,
    String? infantPriceB2e,
    String? adultPrice,
    String? childPrice,
    String? infantPrice,
    String? url,
    String? airlineName,
    String? classType,
    String? form,
    String? formName,
    String? action,
    String? desc,
    String? luggage,
    String? refundable,
    String? supplierId,
    String? supplier,
    String? moduleColor,}){
    _departureFlightNo = departureFlightNo;
    _img = img;
    _departureTime = departureTime;
    _departureDate = departureDate;
    _arrivalTime = arrivalTime;
    _arrivalDate = arrivalDate;
    _departureCode = departureCode;
    _departureAirport = departureAirport;
    _arrivalCode = arrivalCode;
    _arrivalAirport = arrivalAirport;
    _durationTime = durationTime;
    _currencyCode = currencyCode;
    _price = price;
    _actualPrice = actualPrice;
    _b2cPrice = b2cPrice;
    _b2bPrice = b2bPrice;
    _b2ePrice = b2ePrice;
    _b2cMarkup = b2cMarkup;
    _b2bMarkup = b2bMarkup;
    _b2eMarkup = b2eMarkup;
    _serviceFee = serviceFee;
    _desposit = desposit;
    _adultPriceB2b = adultPriceB2b;
    _adultPriceB2c = adultPriceB2c;
    _adultPriceB2e = adultPriceB2e;
    _childPriceB2b = childPriceB2b;
    _childPriceB2c = childPriceB2c;
    _childPriceB2e = childPriceB2e;
    _infantPriceB2b = infantPriceB2b;
    _infantPriceB2c = infantPriceB2c;
    _infantPriceB2e = infantPriceB2e;
    _adultPrice = adultPrice;
    _childPrice = childPrice;
    _infantPrice = infantPrice;
    _url = url;
    _airlineName = airlineName;
    _classType = classType;
    _form = form;
    _formName = formName;
    _action = action;
    _desc = desc;
    _luggage = luggage;
    _refundable = refundable;
    _supplierId = supplierId;
    _supplier = supplier;
    _moduleColor = moduleColor;
  }

  Segments.fromJson(dynamic json) {
    _departureFlightNo = json['departure_flight_no'];
    _img = json['img'];
    _departureTime = json['departure_time'];
    _departureDate = json['departure_date'];
    _arrivalTime = json['arrival_time'];
    _arrivalDate = json['arrival_date'];
    _departureCode = json['departure_code'];
    _departureAirport = json['departure_airport'];
    _arrivalCode = json['arrival_code'];
    _arrivalAirport = json['arrival_airport'];
    _durationTime = json['duration_time'];
    _currencyCode = json['currency_code'];
    _price = json['price'];
    _actualPrice = json['actual_price'];
    _b2cPrice = json['b2c_price'];
    _b2bPrice = json['b2b_price'];
    _b2ePrice = json['b2e_price'];
    _b2cMarkup = json['b2c_markup'];
    _b2bMarkup = json['b2b_markup'];
    _b2eMarkup = json['b2e_markup'];
    _serviceFee = json['service_fee'];
    _desposit = json['desposit'];
    _adultPriceB2b = json['adult_price_b2b'];
    _adultPriceB2c = json['adult_price_b2c'];
    _adultPriceB2e = json['adult_price_b2e'];
    _childPriceB2b = json['child_price_b2b'];
    _childPriceB2c = json['child_price_b2c'];
    _childPriceB2e = json['child_price_b2e'];
    _infantPriceB2b = json['infant_price_b2b'];
    _infantPriceB2c = json['infant_price_b2c'];
    _infantPriceB2e = json['infant_price_b2e'];
    _adultPrice = json['adult_price'];
    _childPrice = json['child_price'];
    _infantPrice = json['infant_price'];
    _url = json['url'];
    _airlineName = json['airline_name'];
    _classType = json['class_type'];
    _form = json['form'];
    _formName = json['form_name'];
    _action = json['action'];
    _desc = json['desc'];
    _luggage = json['luggage'];
    _refundable = json['refundable'];
    _supplierId = json['supplier_id'];
    _supplier = json['supplier'];
    _moduleColor = json['module_color'];
  }
  String? _departureFlightNo;
  String? _img;
  String? _departureTime;
  String? _departureDate;
  String? _arrivalTime;
  String? _arrivalDate;
  String? _departureCode;
  String? _departureAirport;
  String? _arrivalCode;
  String? _arrivalAirport;
  String? _durationTime;
  String? _currencyCode;
  int? _price;
  int? _actualPrice;
  String? _b2cPrice;
  String? _b2bPrice;
  String? _b2ePrice;
  String? _b2cMarkup;
  String? _b2bMarkup;
  String? _b2eMarkup;
  String? _serviceFee;
  String? _desposit;
  String? _adultPriceB2b;
  String? _adultPriceB2c;
  String? _adultPriceB2e;
  String? _childPriceB2b;
  String? _childPriceB2c;
  String? _childPriceB2e;
  String? _infantPriceB2b;
  String? _infantPriceB2c;
  String? _infantPriceB2e;
  String? _adultPrice;
  String? _childPrice;
  String? _infantPrice;
  String? _url;
  String? _airlineName;
  String? _classType;
  String? _form;
  String? _formName;
  String? _action;
  String? _desc;
  String? _luggage;
  String? _refundable;
  String? _supplierId;
  String? _supplier;
  String? _moduleColor;
  Segments copyWith({  String? departureFlightNo,
    String? img,
    String? departureTime,
    String? departureDate,
    String? arrivalTime,
    String? arrivalDate,
    String? departureCode,
    String? departureAirport,
    String? arrivalCode,
    String? arrivalAirport,
    String? durationTime,
    String? currencyCode,
    int? price,
    int? actualPrice,
    String? b2cPrice,
    String? b2bPrice,
    String? b2ePrice,
    String? b2cMarkup,
    String? b2bMarkup,
    String? b2eMarkup,
    String? serviceFee,
    String? desposit,
    String? adultPriceB2b,
    String? adultPriceB2c,
    String? adultPriceB2e,
    String? childPriceB2b,
    String? childPriceB2c,
    String? childPriceB2e,
    String? infantPriceB2b,
    String? infantPriceB2c,
    String? infantPriceB2e,
    String? adultPrice,
    String? childPrice,
    String? infantPrice,
    String? url,
    String? airlineName,
    String? classType,
    String? form,
    String? formName,
    String? action,
    String? desc,
    String? luggage,
    String? refundable,
    String? supplierId,
    String? supplier,
    String? moduleColor,
  }) => Segments(  departureFlightNo: departureFlightNo ?? _departureFlightNo,
    img: img ?? _img,
    departureTime: departureTime ?? _departureTime,
    departureDate: departureDate ?? _departureDate,
    arrivalTime: arrivalTime ?? _arrivalTime,
    arrivalDate: arrivalDate ?? _arrivalDate,
    departureCode: departureCode ?? _departureCode,
    departureAirport: departureAirport ?? _departureAirport,
    arrivalCode: arrivalCode ?? _arrivalCode,
    arrivalAirport: arrivalAirport ?? _arrivalAirport,
    durationTime: durationTime ?? _durationTime,
    currencyCode: currencyCode ?? _currencyCode,
    price: price ?? _price,
    actualPrice: actualPrice ?? _actualPrice,
    b2cPrice: b2cPrice ?? _b2cPrice,
    b2bPrice: b2bPrice ?? _b2bPrice,
    b2ePrice: b2ePrice ?? _b2ePrice,
    b2cMarkup: b2cMarkup ?? _b2cMarkup,
    b2bMarkup: b2bMarkup ?? _b2bMarkup,
    b2eMarkup: b2eMarkup ?? _b2eMarkup,
    serviceFee: serviceFee ?? _serviceFee,
    desposit: desposit ?? _desposit,
    adultPriceB2b: adultPriceB2b ?? _adultPriceB2b,
    adultPriceB2c: adultPriceB2c ?? _adultPriceB2c,
    adultPriceB2e: adultPriceB2e ?? _adultPriceB2e,
    childPriceB2b: childPriceB2b ?? _childPriceB2b,
    childPriceB2c: childPriceB2c ?? _childPriceB2c,
    childPriceB2e: childPriceB2e ?? _childPriceB2e,
    infantPriceB2b: infantPriceB2b ?? _infantPriceB2b,
    infantPriceB2c: infantPriceB2c ?? _infantPriceB2c,
    infantPriceB2e: infantPriceB2e ?? _infantPriceB2e,
    adultPrice: adultPrice ?? _adultPrice,
    childPrice: childPrice ?? _childPrice,
    infantPrice: infantPrice ?? _infantPrice,
    url: url ?? _url,
    airlineName: airlineName ?? _airlineName,
    classType: classType ?? _classType,
    form: form ?? _form,
    formName: formName ?? _formName,
    action: action ?? _action,
    desc: desc ?? _desc,
    luggage: luggage ?? _luggage,
    refundable: refundable ?? _refundable,
    supplierId: supplierId ?? _supplierId,
    supplier: supplier ?? _supplier,
    moduleColor: moduleColor ?? _moduleColor,
  );
  String? get departureFlightNo => _departureFlightNo;
  String? get img => _img;
  String? get departureTime => _departureTime;
  String? get departureDate => _departureDate;
  String? get arrivalTime => _arrivalTime;
  String? get arrivalDate => _arrivalDate;
  String? get departureCode => _departureCode;
  String? get departureAirport => _departureAirport;
  String? get arrivalCode => _arrivalCode;
  String? get arrivalAirport => _arrivalAirport;
  String? get durationTime => _durationTime;
  String? get currencyCode => _currencyCode;
  int? get price => _price;
  int? get actualPrice => _actualPrice;
  String? get b2cPrice => _b2cPrice;
  String? get b2bPrice => _b2bPrice;
  String? get b2ePrice => _b2ePrice;
  String? get b2cMarkup => _b2cMarkup;
  String? get b2bMarkup => _b2bMarkup;
  String? get b2eMarkup => _b2eMarkup;
  String? get serviceFee => _serviceFee;
  String? get desposit => _desposit;
  String? get adultPriceB2b => _adultPriceB2b;
  String? get adultPriceB2c => _adultPriceB2c;
  String? get adultPriceB2e => _adultPriceB2e;
  String? get childPriceB2b => _childPriceB2b;
  String? get childPriceB2c => _childPriceB2c;
  String? get childPriceB2e => _childPriceB2e;
  String? get infantPriceB2b => _infantPriceB2b;
  String? get infantPriceB2c => _infantPriceB2c;
  String? get infantPriceB2e => _infantPriceB2e;
  String? get adultPrice => _adultPrice;
  String? get childPrice => _childPrice;
  String? get infantPrice => _infantPrice;
  String? get url => _url;
  String? get airlineName => _airlineName;
  String? get classType => _classType;
  String? get form => _form;
  String? get formName => _formName;
  String? get action => _action;
  String? get desc => _desc;
  String? get luggage => _luggage;
  String? get refundable => _refundable;
  String? get supplierId => _supplierId;
  String? get supplier => _supplier;
  String? get moduleColor => _moduleColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['departure_flight_no'] = _departureFlightNo;
    map['img'] = _img;
    map['departure_time'] = _departureTime;
    map['departure_date'] = _departureDate;
    map['arrival_time'] = _arrivalTime;
    map['arrival_date'] = _arrivalDate;
    map['departure_code'] = _departureCode;
    map['departure_airport'] = _departureAirport;
    map['arrival_code'] = _arrivalCode;
    map['arrival_airport'] = _arrivalAirport;
    map['duration_time'] = _durationTime;
    map['currency_code'] = _currencyCode;
    map['price'] = _price;
    map['actual_price'] = _actualPrice;
    map['b2c_price'] = _b2cPrice;
    map['b2b_price'] = _b2bPrice;
    map['b2e_price'] = _b2ePrice;
    map['b2c_markup'] = _b2cMarkup;
    map['b2b_markup'] = _b2bMarkup;
    map['b2e_markup'] = _b2eMarkup;
    map['service_fee'] = _serviceFee;
    map['desposit'] = _desposit;
    map['adult_price_b2b'] = _adultPriceB2b;
    map['adult_price_b2c'] = _adultPriceB2c;
    map['adult_price_b2e'] = _adultPriceB2e;
    map['child_price_b2b'] = _childPriceB2b;
    map['child_price_b2c'] = _childPriceB2c;
    map['child_price_b2e'] = _childPriceB2e;
    map['infant_price_b2b'] = _infantPriceB2b;
    map['infant_price_b2c'] = _infantPriceB2c;
    map['infant_price_b2e'] = _infantPriceB2e;
    map['adult_price'] = _adultPrice;
    map['child_price'] = _childPrice;
    map['infant_price'] = _infantPrice;
    map['url'] = _url;
    map['airline_name'] = _airlineName;
    map['class_type'] = _classType;
    map['form'] = _form;
    map['form_name'] = _formName;
    map['action'] = _action;
    map['desc'] = _desc;
    map['luggage'] = _luggage;
    map['refundable'] = _refundable;
    map['supplier_id'] = _supplierId;
    map['supplier'] = _supplier;
    map['module_color'] = _moduleColor;
    return map;
  }

}

