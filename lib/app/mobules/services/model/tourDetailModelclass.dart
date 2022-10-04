// To parse this JSON data, do
//
//     final tourDetailModelClass = tourDetailModelClassFromJson(jsonString);

import 'dart:convert';

TourDetailModelClass tourDetailModelClassFromJson(String str) => TourDetailModelClass.fromJson(json.decode(str));

String tourDetailModelClassToJson(TourDetailModelClass data) => json.encode(data.toJson());

class TourDetailModelClass {
  TourDetailModelClass({
    this.tourId,
    this.name,
    this.tourType,
    this.location,
    this.img,
    this.desc,
    this.price,
    this.actualPrice,
    this.b2CPriceAdult,
    this.b2BPriceAdult,
    this.b2EPriceAdult,
    this.b2CPriceChild,
    this.b2BPriceChild,
    this.b2EPriceChild,
    this.b2CPriceInfant,
    this.b2BPriceInfant,
    this.b2EPriceInfant,
    this.b2CMarkup,
    this.b2BMarkup,
    this.b2EMarkup,
    this.serviceFee,
    this.desposit,
    this.tax,
    this.depositType,
    this.taxType,
    this.adultPrice,
    this.childPrice,
    this.infantPrice,
    this.maxAdults,
    this.maxChild,
    this.maxInfant,
    this.rating,
    this.longitude,
    this.latitude,
    this.redirect,
    this.inclusions,
    this.exclusions,
    this.currencycode,
    this.duration,
    this.policy,
    this.maxTravellers,
    this.departureTime,
    this.departurePoint,
    this.supplier,
    this.multiDestinations,
  });

  String? tourId;
  String? name;
  String? tourType;
  String? location;
  List<String>? img;
  String? desc;
  int? price;
  String? actualPrice;
  int? b2CPriceAdult;
  int? b2BPriceAdult;
  int? b2EPriceAdult;
  int? b2CPriceChild;
  int? b2BPriceChild;
  int? b2EPriceChild;
  int? b2CPriceInfant;
  int? b2BPriceInfant;
  int? b2EPriceInfant;
  String? b2CMarkup;
  String? b2BMarkup;
  String? b2EMarkup;
  String? serviceFee;
  String? desposit;
  String? tax;
  String? depositType;
  String? taxType;
  String? adultPrice;
  String? childPrice;
  String? infantPrice;
  String? maxAdults;
  String? maxChild;
  String? maxInfant;
  String? rating;
  String? longitude;
  String? latitude;
  String? redirect;
  List<String>? inclusions;
  List<String>? exclusions;
  String? currencycode;
  String? duration;
  String? policy;
  String? maxTravellers;
  String? departureTime;
  String? departurePoint;
  String? supplier;
  List<MultiDestination>? multiDestinations;

  factory TourDetailModelClass.fromJson(Map<String, dynamic> json) => TourDetailModelClass(
    tourId: json["tour_id"],
    name: json["name"],
    tourType: json["tour_type"],
    location: json["location"],
    img: List<String>.from(json["img"].map((x) => x)),
    desc: json["desc"],
    price: json["price"],
    actualPrice: json["actual_price"],
    b2CPriceAdult: json["b2c_price_adult"],
    b2BPriceAdult: json["b2b_price_adult"],
    b2EPriceAdult: json["b2e_price_adult"],
    b2CPriceChild: json["b2c_price_child"],
    b2BPriceChild: json["b2b_price_child"],
    b2EPriceChild: json["b2e_price_child"],
    b2CPriceInfant: json["b2c_price_infant"],
    b2BPriceInfant: json["b2b_price_infant"],
    b2EPriceInfant: json["b2e_price_infant"],
    b2CMarkup: json["b2c_markup"],
    b2BMarkup: json["b2b_markup"],
    b2EMarkup: json["b2e_markup"],
    serviceFee: json["service_fee"],
    desposit: json["desposit"],
    tax: json["tax"],
    depositType: json["deposit_type"],
    taxType: json["tax_type"],
    adultPrice: json["adult_price"],
    childPrice: json["child_price"],
    infantPrice: json["infant_price"],
    maxAdults: json["maxAdults"],
    maxChild: json["maxChild"],
    maxInfant: json["maxInfant"],
    rating: json["rating"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    redirect: json["redirect"],
    inclusions: List<String>.from(json["inclusions"].map((x) => x)),
    exclusions: List<String>.from(json["exclusions"].map((x) => x)),
    currencycode: json["currencycode"],
    duration: json["duration"],
    policy: json["policy"],
    maxTravellers: json["max_travellers"],
    departureTime: json["departure_time"],
    departurePoint: json["departure_point"],
    supplier: json["supplier"],
    multiDestinations: List<MultiDestination>.from(json["multi_destinations"].map((x) => MultiDestination.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tour_id": tourId,
    "name": name,
    "tour_type": tourType,
    "location": location,
    "img": List<dynamic>.from(img!.map((x) => x)),
    "desc": desc,
    "price": price,
    "actual_price": actualPrice,
    "b2c_price_adult": b2CPriceAdult,
    "b2b_price_adult": b2BPriceAdult,
    "b2e_price_adult": b2EPriceAdult,
    "b2c_price_child": b2CPriceChild,
    "b2b_price_child": b2BPriceChild,
    "b2e_price_child": b2EPriceChild,
    "b2c_price_infant": b2CPriceInfant,
    "b2b_price_infant": b2BPriceInfant,
    "b2e_price_infant": b2EPriceInfant,
    "b2c_markup": b2CMarkup,
    "b2b_markup": b2BMarkup,
    "b2e_markup": b2EMarkup,
    "service_fee": serviceFee,
    "desposit": desposit,
    "tax": tax,
    "deposit_type": depositType,
    "tax_type": taxType,
    "adult_price": adultPrice,
    "child_price": childPrice,
    "infant_price": infantPrice,
    "maxAdults": maxAdults,
    "maxChild": maxChild,
    "maxInfant": maxInfant,
    "rating": rating,
    "longitude": longitude,
    "latitude": latitude,
    "redirect": redirect,
    "inclusions": List<dynamic>.from(inclusions!.map((x) => x)),
    "exclusions": List<dynamic>.from(exclusions!.map((x) => x)),
    "currencycode": currencycode,
    "duration": duration,
    "policy": policy,
    "max_travellers": maxTravellers,
    "departure_time": departureTime,
    "departure_point": departurePoint,
    "supplier": supplier,
    "multi_destinations": List<dynamic>.from(multiDestinations!.map((x) => x.toJson())),
  };
}

class MultiDestination {
  MultiDestination({
    this.country,
    this.isValid,
    this.city,
    this.latitude,
    this.longitude,
    this.status,
    this.id,
  });

  String? country;
  bool? isValid;
  String? city;
  String? latitude;
  String? longitude;
  String? status;
  String? id;

  factory MultiDestination.fromJson(Map<String, dynamic> json) => MultiDestination(
    country: json["country"],
    isValid: json["isValid"],
    city: json["city"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    status: json["status"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "isValid": isValid,
    "city": city,
    "latitude": latitude,
    "longitude": longitude,
    "status": status,
    "id": id,
  };
}
