// // // class UserModels {
// // //   final String? id;
// // //   final DateTime? createdAt;
// // //   // final String? name;
// // //   final String? avatar;

// // //   UserModels({this.id, this.createdAt, this.avatar});

// // //   factory UserModels.fromJson(Map<String, dynamic> json) {
// // //     if (json == null) return null!;
// // //     return UserModels(
// // //       id: json["id"],
// // //       createdAt:
// // //           json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
// // //       // name: json["name"],
// // //       avatar: json["avatar"],
// // //     );
// // //   }

// // //   static List<UserModels> fromJsonList(List list) {
// // //     if (list == null) return null!;
// // //     return list.map((item) => UserModels.fromJson(item)).toList();
// // //   }

// // //   ///this method will prevent the override of toString
// // //   String userAsString() {
// // //     return '#${this.id} ';
// // //   }

// // //   ///this method will prevent the override of toString
// // //   bool userFilterByCreationDate(String filter) {
// // //     return this.createdAt.toString().contains(filter);
// // //   }

// // //   ///custom comparing function to check if two users are equal
// // //   bool isEqual(UserModels model) {
// // //     return this.id == model.id;
// // //   }

// // //   // @override
// // //   // String toString() => name!;
// // // }

// // class testerPostResponse {
// //   String? id;
// //   String? name;
// //   String? location;
// //   String? stars;
// //   String? rating;
// //   String? longitude;
// //   String? latitude;
// //   String? desc;
// //   List<String>? img;
// //   List<Amenities>? amenities;
// //   String? supplierName;
// //   int? supplier;
// //   List<Rooms>? rooms;
// //   String? policy;
// //   String? address;
// //   String? taxType;
// //   String? taxAmount;
// //   String? depositType;
// //   String? depositAmount;
// //   List<PaymentOption>? paymentOption;
// //   String? hotelPhone;
// //   String? hotelEmail;
// //   String? hotelWebsite;
// //   String? discount;

// //   testerPostResponse(
// //       {this.id,
// //       this.name,
// //       this.location,
// //       this.stars,
// //       this.rating,
// //       this.longitude,
// //       this.latitude,
// //       this.desc,
// //       this.img,
// //       this.amenities,
// //       this.supplierName,
// //       this.supplier,
// //       this.rooms,
// //       this.policy,
// //       this.address,
// //       this.taxType,
// //       this.taxAmount,
// //       this.depositType,
// //       this.depositAmount,
// //       this.paymentOption,
// //       this.hotelPhone,
// //       this.hotelEmail,
// //       this.hotelWebsite,
// //       this.discount});

// //   testerPostResponse.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     name = json['name'];
// //     location = json['location'];
// //     stars = json['stars'];
// //     rating = json['rating'];
// //     longitude = json['longitude'];
// //     latitude = json['latitude'];
// //     desc = json['desc'];
// //     img = json['img'].cast<String>();
// //     if (json['amenities'] != null) {
// //       amenities = <Amenities>[];
// //       json['amenities'].forEach((v) {
// //         amenities!.add(new Amenities.fromJson(v));
// //       });
// //     }
// //     supplierName = json['supplier_name'];
// //     supplier = json['supplier'];
// //     if (json['rooms'] != null) {
// //       rooms = <Rooms>[];
// //       json['rooms'].forEach((v) {
// //         rooms!.add( Rooms.fromJson(v));
// //       });
// //     }
// //     policy = json['policy'];
// //     address = json['address'];
// //     taxType = json['tax_type'];
// //     taxAmount = json['tax_amount'];
// //     depositType = json['deposit_type'];
// //     depositAmount = json['deposit_amount'];
// //     if (json['payment_option'] != null) {
// //       paymentOption = <PaymentOption>[];
// //       json['payment_option'].forEach((v) {
// //         paymentOption!.add(PaymentOption.fromJson(v));
// //       });
// //     }
// //     hotelPhone = json['hotel_phone'];
// //     hotelEmail = json['hotel_email'];
// //     hotelWebsite = json['hotel_website'];
// //     discount = json['discount'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['name'] = this.name;
// //     data['location'] = this.location;
// //     data['stars'] = this.stars;
// //     data['rating'] = this.rating;
// //     data['longitude'] = this.longitude;
// //     data['latitude'] = this.latitude;
// //     data['desc'] = this.desc;
// //     data['img'] = this.img;
// //     if (this.amenities != null) {
// //       data['amenities'] = this.amenities!.map((v) => v.toJson()).toList();
// //     }
// //     data['supplier_name'] = this.supplierName;
// //     data['supplier'] = this.supplier;
// //     if (this.rooms != null) {
// //       data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
// //     }
// //     data['policy'] = this.policy;
// //     data['address'] = this.address;
// //     data['tax_type'] = this.taxType;
// //     data['tax_amount'] = this.taxAmount;
// //     data['deposit_type'] = this.depositType;
// //     data['deposit_amount'] = this.depositAmount;
// //     if (this.paymentOption != null) {
// //       data['payment_option'] =
// //           this.paymentOption!.map((v) => v.toJson()).toList();
// //     }
// //     data['hotel_phone'] = this.hotelPhone;
// //     data['hotel_email'] = this.hotelEmail;
// //     data['hotel_website'] = this.hotelWebsite;
// //     data['discount'] = this.discount;
// //     return data;
// //   }
// // }

// // class Amenities {
// //   String? icon;
// //   String? name;

// //   Amenities({this.icon, this.name});

// //   Amenities.fromJson(Map<String, dynamic> json) {
// //     icon = json['icon'];
// //     name = json['name'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['icon'] = this.icon;
// //     data['name'] = this.name;
// //     return data;
// //   }
// // }

// // class Rooms {
// //   String? id;
// //   String? name;
// //   int? price;
// //   int? preDay;
// //   String? realPrice;
// //   int? b2cPrice;
// //   int? b2bPrice;
// //   int? b2ePrice;
// //   String? b2cMarkup;
// //   String? b2bMarkup;
// //   String? b2eMarkup;
// //   String? serviceFee;
// //   String? actualCurrency;
// //   Null? currency;
// //   String? refundable;
// //   String? refundableDate;
// //   List<String>? img;
// //   List<Amenities>? amenities;
// //   List<Options>? options;

// //   Rooms(
// //       {this.id,
// //       this.name,
// //       this.price,
// //       this.preDay,
// //       this.realPrice,
// //       this.b2cPrice,
// //       this.b2bPrice,
// //       this.b2ePrice,
// //       this.b2cMarkup,
// //       this.b2bMarkup,
// //       this.b2eMarkup,
// //       this.serviceFee,
// //       this.actualCurrency,
// //       this.currency,
// //       this.refundable,
// //       this.refundableDate,
// //       this.img,
// //       this.amenities,
// //       this.options});

// //   Rooms.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     name = json['name'];
// //     price = json['price'];
// //     preDay = json['pre_day'];
// //     realPrice = json['real_price'];
// //     b2cPrice = json['b2c_price'];
// //     b2bPrice = json['b2b_price'];
// //     b2ePrice = json['b2e_price'];
// //     b2cMarkup = json['b2c_markup'];
// //     b2bMarkup = json['b2b_markup'];
// //     b2eMarkup = json['b2e_markup'];
// //     serviceFee = json['service_fee'];
// //     actualCurrency = json['actual_currency'];
// //     currency = json['currency'];
// //     refundable = json['refundable'];
// //     refundableDate = json['refundable_date'];
// //     img = json['img'].cast<String>();
// //     if (json['amenities'] != null) {
// //       amenities = <Amenities>[];
// //       json['amenities'].forEach((v) {
// //         amenities!.add(new Amenities.fromJson(v));
// //       });
// //     }
// //     if (json['options'] != null) {
// //       options = <Options>[];
// //       json['options'].forEach((v) {
// //         options!.add(new Options.fromJson(v));
// //       });
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['name'] = this.name;
// //     data['price'] = this.price;
// //     data['pre_day'] = this.preDay;
// //     data['real_price'] = this.realPrice;
// //     data['b2c_price'] = this.b2cPrice;
// //     data['b2b_price'] = this.b2bPrice;
// //     data['b2e_price'] = this.b2ePrice;
// //     data['b2c_markup'] = this.b2cMarkup;
// //     data['b2b_markup'] = this.b2bMarkup;
// //     data['b2e_markup'] = this.b2eMarkup;
// //     data['service_fee'] = this.serviceFee;
// //     data['actual_currency'] = this.actualCurrency;
// //     data['currency'] = this.currency;
// //     data['refundable'] = this.refundable;
// //     data['refundable_date'] = this.refundableDate;
// //     data['img'] = this.img;
// //     if (this.amenities != null) {
// //       data['amenities'] = this.amenities!.map((v) => v.toJson()).toList();
// //     }
// //     if (this.options != null) {
// //       data['options'] = this.options!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }

// // class Options {
// //   String? id;
// //   String? currCode;
// //   int? price;
// //   int? preDay;
// //   String? realPrice;
// //   int? b2cPrice;
// //   int? b2bPrice;
// //   int? b2ePrice;
// //   String? b2cMarkup;
// //   String? b2bMarkup;
// //   String? b2eMarkup;
// //   String? serviceFee;
// //   String? quantity;
// //   String? adults;
// //   String? child;
// //   int? childrenAges;
// //   String? bookingurl;
// //   String? bookingKey;
// //   String? extrabedsQuantity;
// //   int? extrabedPrice;
// //   String? roomAdultPrice;
// //   String? roomChildPrice;
// //   String? priceType;
// //   String? cancellationInfo;
// //   int? roomBooked;
// //   String? roomData;

// //   Options(
// //       {this.id,
// //       this.currCode,
// //       this.price,
// //       this.preDay,
// //       this.realPrice,
// //       this.b2cPrice,
// //       this.b2bPrice,
// //       this.b2ePrice,
// //       this.b2cMarkup,
// //       this.b2bMarkup,
// //       this.b2eMarkup,
// //       this.serviceFee,
// //       this.quantity,
// //       this.adults,
// //       this.child,
// //       this.childrenAges,
// //       this.bookingurl,
// //       this.bookingKey,
// //       this.extrabedsQuantity,
// //       this.extrabedPrice,
// //       this.roomAdultPrice,
// //       this.roomChildPrice,
// //       this.priceType,
// //       this.cancellationInfo,
// //       this.roomBooked,
// //       this.roomData});

// //   Options.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     currCode = json['currCode'];
// //     price = json['price'];
// //     preDay = json['pre_day'];
// //     realPrice = json['real_price'];
// //     b2cPrice = json['b2c_price'];
// //     b2bPrice = json['b2b_price'];
// //     b2ePrice = json['b2e_price'];
// //     b2cMarkup = json['b2c_markup'];
// //     b2bMarkup = json['b2b_markup'];
// //     b2eMarkup = json['b2e_markup'];
// //     serviceFee = json['service_fee'];
// //     quantity = json['quantity'];
// //     adults = json['adults'];
// //     child = json['child'];
// //     childrenAges = json['children_ages'];
// //     bookingurl = json['bookingurl'];
// //     bookingKey = json['bookingKey'];
// //     extrabedsQuantity = json['extrabeds_quantity'];
// //     extrabedPrice = json['extrabed_price'];
// //     roomAdultPrice = json['room_adult_price'];
// //     roomChildPrice = json['room_child_price'];
// //     priceType = json['price_type'];
// //     cancellationInfo = json['cancellation_info'];
// //     roomBooked = json['room_booked'];
// //     roomData = json['room_data'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['currCode'] = this.currCode;
// //     data['price'] = this.price;
// //     data['pre_day'] = this.preDay;
// //     data['real_price'] = this.realPrice;
// //     data['b2c_price'] = this.b2cPrice;
// //     data['b2b_price'] = this.b2bPrice;
// //     data['b2e_price'] = this.b2ePrice;
// //     data['b2c_markup'] = this.b2cMarkup;
// //     data['b2b_markup'] = this.b2bMarkup;
// //     data['b2e_markup'] = this.b2eMarkup;
// //     data['service_fee'] = this.serviceFee;
// //     data['quantity'] = this.quantity;
// //     data['adults'] = this.adults;
// //     data['child'] = this.child;
// //     data['children_ages'] = this.childrenAges;
// //     data['bookingurl'] = this.bookingurl;
// //     data['bookingKey'] = this.bookingKey;
// //     data['extrabeds_quantity'] = this.extrabedsQuantity;
// //     data['extrabed_price'] = this.extrabedPrice;
// //     data['room_adult_price'] = this.roomAdultPrice;
// //     data['room_child_price'] = this.roomChildPrice;
// //     data['price_type'] = this.priceType;
// //     data['cancellation_info'] = this.cancellationInfo;
// //     data['room_booked'] = this.roomBooked;
// //     data['room_data'] = this.roomData;
// //     return data;
// //   }
// // }
// /// id : "38"
// /// name : "Hyatt Regency Perth"
// /// location : "Dubai"
// /// stars : "3"
// /// rating : "3"
// /// longitude : "-31.95819269999999"
// /// latitude : "115.86670630000003"
// /// desc : "This 5-star luxury hotel offers a 25-metre heated pool and a tennis court minutes from the banks of Swan River and Perth’s city centre. A free city shuttle bus is provided. Hyatt Regency Perth Hotel provides large rooms that with views of the river or the city. Some rooms include free access the hotel’s fitness centre and sauna. Guests can enjoy superb cuisine at any of the 5 dining outlets at the property including Cafe Restaurant, Joe’s Oriental Diner with its spectacular open kitchen or the sumptuous Conservatory Lounge. Hyatt Regency Perth is 20 minutes' drive from Perth international and Domestic Airport."
// /// img : ["https://phptravels.net/api/uploads/images/hotels/slider/1.jpg","https://phptravels.net/api/uploads/images/hotels/slider/3.jpg","https://phptravels.net/api/uploads/images/hotels/slider/4.jpg","https://phptravels.net/api/uploads/images/hotels/slider/5.jpg","https://phptravels.net/api/uploads/images/hotels/slider/6.jpg","https://phptravels.net/api/uploads/images/hotels/slider/637176_3.jpg","https://phptravels.net/api/uploads/images/hotels/slider/7.jpg","https://phptravels.net/api/uploads/images/hotels/slider/8.jpg","https://phptravels.net/api/uploads/images/hotels/slider/2.jpg","https://phptravels.net/api/uploads/images/hotels/slider/9.jpg","https://phptravels.net/api/uploads/images/hotels/slider/10.jpg","https://phptravels.net/api/uploads/images/hotels/slider/11.jpg"]
// /// amenities : [{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/522827_airport.png","name":"Airport Transport"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/593292_receptionist.png","name":"Business Center"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/920288_wheelchar.png","name":"Disabled Facilities"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/78888_club.png","name":"Night Club"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/813018_laundry.png","name":"Laundry Service"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/79773_breakfast.png","name":"Restaurant"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/53193_858245_wifi.png","name":"Wi-Fi Internet"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/6348_541779_parking.png","name":"Inside Parking"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/117737_653168_busstation.png","name":"Shuttle Bus Service"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/403809_764557_fitness.png","name":"Fitness Center"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/308869_654419_spa.png","name":"SPA"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/7599_441834_children.png","name":"Children Activites"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/124634_ac.png","name":"Air Conditioner"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/524780_card.png","name":"Cards Accepted"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/999481_elevator.png","name":"Elevator"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/179352_pet.png","name":"Pets Allowed"}]
// /// supplier_name : "manual"
// /// supplier : 1
// /// rooms : [{"id":"44","name":"Executive Two-Bedrooms Apartment","price":277,"pre_day":277,"real_price":"276","b2c_price":0,"b2b_price":0,"b2e_price":0,"b2c_markup":"10","b2b_markup":"5","b2e_markup":"2","service_fee":"10","actual_currency":"EUR","currency":null,"refundable":"","refundable_date":"","img":["https://phptravels.net/api/uploads/images/hotels/rooms/photos/4.jpg","https://phptravels.net/api/uploads/images/hotels/rooms/photos/3.jpg","https://phptravels.net/api/uploads/images/hotels/rooms/photos/2.jpg","https://phptravels.net/api/uploads/images/hotels/rooms/photos/1.jpg"],"amenities":[{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Bathroom phone"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Climate control"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Courtyard view"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Extra towels/bedding"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Hair dryer"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Makeup/shaving mirror"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Refrigerator"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Shower/tub combination"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Air conditioning"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Free Wi-Fi"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Individually furnished"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Iron/ironing board (on request)"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Minibar"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Satellite TV service"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Slippers"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"City view"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Daily housekeeping"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"LCD TV"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Private bathroom"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Wake-up calls"}],"options":[{"id":"44","currCode":"EUR","price":277,"pre_day":277,"real_price":"276","b2c_price":0,"b2b_price":0,"b2e_price":0,"b2c_markup":"10","b2b_markup":"5","b2e_markup":"2","service_fee":"10","quantity":"3","adults":"3","child":"2","children_ages":0,"bookingurl":"","bookingKey":"","extrabeds_quantity":"0","extrabed_price":0,"room_adult_price":"0.00","room_child_price":"0.00","price_type":"0","cancellation_info":"","room_booked":0,"room_data":""}]},{"id":"42","name":"Standard Room","price":139,"pre_day":139,"real_price":"138","b2c_price":0,"b2b_price":0,"b2e_price":0,"b2c_markup":"10","b2b_markup":"5","b2e_markup":"2","service_fee":"10","actual_currency":"EUR","currency":null,"refundable":"","refundable_date":"","img":["https://phptravels.net/api/uploads/images/hotels/rooms/photos/4.jpg","https://phptravels.net/api/uploads/images/hotels/rooms/photos/3.jpg","https://phptravels.net/api/uploads/images/hotels/rooms/photos/2.jpg","https://phptravels.net/api/uploads/images/hotels/rooms/photos/1.jpg"],"amenities":[{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Bathroom phone"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Climate control"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Courtyard view"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Extra towels/bedding"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Hair dryer"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Makeup/shaving mirror"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Refrigerator"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Shower/tub combination"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Air conditioning"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Free Wi-Fi"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Individually furnished"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Iron/ironing board (on request)"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Minibar"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Satellite TV service"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Slippers"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"City view"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Daily housekeeping"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"LCD TV"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Private bathroom"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Wake-up calls"}],"options":[{"id":"42","currCode":"EUR","price":139,"pre_day":139,"real_price":"138","b2c_price":0,"b2b_price":0,"b2e_price":0,"b2c_markup":"10","b2b_markup":"5","b2e_markup":"2","service_fee":"10","quantity":"4","adults":"2","child":"2","children_ages":0,"bookingurl":"","bookingKey":"","extrabeds_quantity":"0","extrabed_price":0,"room_adult_price":"150.00","room_child_price":"50.00","price_type":"1","cancellation_info":"","room_booked":0,"room_data":""}]}]
// /// policy : "When booking more than 9 rooms, different policies and additional supplements may apply. All children are welcome. Free! One child under 4 years stays free of charge when using existing beds.  \r\nThe maximum number of extra beds/children's cots permitted in a room is 1. Cancellation and prepayment policies vary according to room type. Please enter the dates of your stay and check the conditions of your required room."
// /// address : "Hyatt Regency Perth, Adelaide Terrace, Perth, Western Australia, Australia"
// /// tax_type : "percentage"
// /// tax_amount : "2"
// /// deposit_type : "percentage"
// /// deposit_amount : "100"
// /// payment_option : [{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Credit Card"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Wire Transfer"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"American Express"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Master/ Visa Card"}]
// /// hotel_phone : "012345678"
// /// hotel_email : "hayyat@gmail.com"
// /// hotel_website : "www.hayyatregency.com"
// /// discount : ""

// class PosterResponseTesterModel {
//   PosterResponseTesterModel({
//     String? id,
//     String? name,
//     String? location,
//     String? stars,
//     String? rating,
//     String? longitude,
//     String? latitude,
//     String? desc,
//     List<String>? img,
//     List<Amenities>? amenities,
//     String? supplierName,
//     int? supplier,
//     List<Rooms>? rooms,
//     String? policy,
//     String? address,
//     String? taxType,
//     String? taxAmount,
//     String? depositType,
//     String? depositAmount,
//     List<PaymentOption>? paymentOption,
//     String? hotelPhone,
//     String? hotelEmail,
//     String? hotelWebsite,
//     String? discount,
//   }) {
//     _id = id;
//     _name = name;
//     _location = location;
//     _stars = stars;
//     _rating = rating;
//     _longitude = longitude;
//     _latitude = latitude;
//     _desc = desc;
//     _img = img;
//     _amenities = amenities;
//     _supplierName = supplierName;
//     _supplier = supplier;
//     _rooms = rooms;
//     _policy = policy;
//     _address = address;
//     _taxType = taxType;
//     _taxAmount = taxAmount;
//     _depositType = depositType;
//     _depositAmount = depositAmount;
//     _paymentOption = paymentOption;
//     _hotelPhone = hotelPhone;
//     _hotelEmail = hotelEmail;
//     _hotelWebsite = hotelWebsite;
//     _discount = discount;
//   }

//   PosterResponseTesterModel.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _location = json['location'];
//     _stars = json['stars'];
//     _rating = json['rating'];
//     _longitude = json['longitude'];
//     _latitude = json['latitude'];
//     _desc = json['desc'];
//     _img = json['img'] != null ? json['img'].cast<String>() : [];
//     if (json['amenities'] != null) {
//       _amenities = [];
//       json['amenities'].forEach((v) {
//         _amenities?.add(Amenities.fromJson(v));
//       });
//     }
//     _supplierName = json['supplier_name'];
//     _supplier = json['supplier'];
//     if (json['rooms'] != null) {
//       _rooms = [];
//       json['rooms'].forEach((v) {
//         _rooms?.add(Rooms.fromJson(v));
//       });
//     }
//     _policy = json['policy'];
//     _address = json['address'];
//     _taxType = json['tax_type'];
//     _taxAmount = json['tax_amount'];
//     _depositType = json['deposit_type'];
//     _depositAmount = json['deposit_amount'];
//     if (json['payment_option'] != null) {
//       _paymentOption = [];
//       json['payment_option'].forEach((v) {
//         _paymentOption?.add(PaymentOption.fromJson(v));
//       });
//     }
//     _hotelPhone = json['hotel_phone'];
//     _hotelEmail = json['hotel_email'];
//     _hotelWebsite = json['hotel_website'];
//     _discount = json['discount'];
//   }
//   String? _id;
//   String? _name;
//   String? _location;
//   String? _stars;
//   String? _rating;
//   String? _longitude;
//   String? _latitude;
//   String? _desc;
//   List<String>? _img;
//   List<Amenities>? _amenities;
//   String? _supplierName;
//   int? _supplier;
//   List<Rooms>? _rooms;
//   String? _policy;
//   String? _address;
//   String? _taxType;
//   String? _taxAmount;
//   String? _depositType;
//   String? _depositAmount;
//   List<PaymentOption>? _paymentOption;
//   String? _hotelPhone;
//   String? _hotelEmail;
//   String? _hotelWebsite;
//   String? _discount;
//   PosterResponseTesterModel copyWith({
//     String? id,
//     String? name,
//     String? location,
//     String? stars,
//     String? rating,
//     String? longitude,
//     String? latitude,
//     String? desc,
//     List<String>? img,
//     List<Amenities>? amenities,
//     String? supplierName,
//     int? supplier,
//     List<Rooms>? rooms,
//     String? policy,
//     String? address,
//     String? taxType,
//     String? taxAmount,
//     String? depositType,
//     String? depositAmount,
//     List<PaymentOption>? paymentOption,
//     String? hotelPhone,
//     String? hotelEmail,
//     String? hotelWebsite,
//     String? discount,
//   }) =>
//       PosterResponseTesterModel(
//         id: id ?? _id,
//         name: name ?? _name,
//         location: location ?? _location,
//         stars: stars ?? _stars,
//         rating: rating ?? _rating,
//         longitude: longitude ?? _longitude,
//         latitude: latitude ?? _latitude,
//         desc: desc ?? _desc,
//         img: img ?? _img,
//         amenities: amenities ?? _amenities,
//         supplierName: supplierName ?? _supplierName,
//         supplier: supplier ?? _supplier,
//         rooms: rooms ?? _rooms,
//         policy: policy ?? _policy,
//         address: address ?? _address,
//         taxType: taxType ?? _taxType,
//         taxAmount: taxAmount ?? _taxAmount,
//         depositType: depositType ?? _depositType,
//         depositAmount: depositAmount ?? _depositAmount,
//         paymentOption: paymentOption ?? _paymentOption,
//         hotelPhone: hotelPhone ?? _hotelPhone,
//         hotelEmail: hotelEmail ?? _hotelEmail,
//         hotelWebsite: hotelWebsite ?? _hotelWebsite,
//         discount: discount ?? _discount,
//       );
//   String? get id => _id;
//   String? get name => _name;
//   String? get location => _location;
//   String? get stars => _stars;
//   String? get rating => _rating;
//   String? get longitude => _longitude;
//   String? get latitude => _latitude;
//   String? get desc => _desc;
//   List<String>? get img => _img;
//   List<Amenities>? get amenities => _amenities;
//   String? get supplierName => _supplierName;
//   int? get supplier => _supplier;
//   List<Rooms>? get rooms => _rooms;
//   String? get policy => _policy;
//   String? get address => _address;
//   String? get taxType => _taxType;
//   String? get taxAmount => _taxAmount;
//   String? get depositType => _depositType;
//   String? get depositAmount => _depositAmount;
//   List<PaymentOption>? get paymentOption => _paymentOption;
//   String? get hotelPhone => _hotelPhone;
//   String? get hotelEmail => _hotelEmail;
//   String? get hotelWebsite => _hotelWebsite;
//   String? get discount => _discount;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['location'] = _location;
//     map['stars'] = _stars;
//     map['rating'] = _rating;
//     map['longitude'] = _longitude;
//     map['latitude'] = _latitude;
//     map['desc'] = _desc;
//     map['img'] = _img;
//     if (_amenities != null) {
//       map['amenities'] = _amenities?.map((v) => v.toJson()).toList();
//     }
//     map['supplier_name'] = _supplierName;
//     map['supplier'] = _supplier;
//     if (_rooms != null) {
//       map['rooms'] = _rooms?.map((v) => v.toJson()).toList();
//     }
//     map['policy'] = _policy;
//     map['address'] = _address;
//     map['tax_type'] = _taxType;
//     map['tax_amount'] = _taxAmount;
//     map['deposit_type'] = _depositType;
//     map['deposit_amount'] = _depositAmount;
//     if (_paymentOption != null) {
//       map['payment_option'] = _paymentOption?.map((v) => v.toJson()).toList();
//     }
//     map['hotel_phone'] = _hotelPhone;
//     map['hotel_email'] = _hotelEmail;
//     map['hotel_website'] = _hotelWebsite;
//     map['discount'] = _discount;
//     return map;
//   }
// }

// /// icon : "https://phptravels.net/api/uploads/images/hotels/amenities/"
// /// name : "Credit Card"

// class PaymentOption {
//   PaymentOption({
//     String? icon,
//     String? name,
//   }) {
//     _icon = icon;
//     _name = name;
//   }

//   PaymentOption.fromJson(dynamic json) {
//     _icon = json['icon'];
//     _name = json['name'];
//   }
//   String? _icon;
//   String? _name;
//   PaymentOption copyWith({
//     String? icon,
//     String? name,
//   }) =>
//       PaymentOption(
//         icon: icon ?? _icon,
//         name: name ?? _name,
//       );
//   String? get icon => _icon;
//   String? get name => _name;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['icon'] = _icon;
//     map['name'] = _name;
//     return map;
//   }
// }

// /// id : "44"
// /// name : "Executive Two-Bedrooms Apartment"
// /// price : 277
// /// pre_day : 277
// /// real_price : "276"
// /// b2c_price : 0
// /// b2b_price : 0
// /// b2e_price : 0
// /// b2c_markup : "10"
// /// b2b_markup : "5"
// /// b2e_markup : "2"
// /// service_fee : "10"
// /// actual_currency : "EUR"
// /// currency : null
// /// refundable : ""
// /// refundable_date : ""
// /// img : ["https://phptravels.net/api/uploads/images/hotels/rooms/photos/4.jpg","https://phptravels.net/api/uploads/images/hotels/rooms/photos/3.jpg","https://phptravels.net/api/uploads/images/hotels/rooms/photos/2.jpg","https://phptravels.net/api/uploads/images/hotels/rooms/photos/1.jpg"]
// /// amenities : [{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Bathroom phone"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Climate control"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Courtyard view"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Extra towels/bedding"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Hair dryer"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Makeup/shaving mirror"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Refrigerator"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Shower/tub combination"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Air conditioning"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Free Wi-Fi"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Individually furnished"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Iron/ironing board (on request)"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Minibar"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Satellite TV service"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Slippers"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"City view"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Daily housekeeping"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"LCD TV"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Private bathroom"},{"icon":"https://phptravels.net/api/uploads/images/hotels/amenities/","name":"Wake-up calls"}]
// /// options : [{"id":"44","currCode":"EUR","price":277,"pre_day":277,"real_price":"276","b2c_price":0,"b2b_price":0,"b2e_price":0,"b2c_markup":"10","b2b_markup":"5","b2e_markup":"2","service_fee":"10","quantity":"3","adults":"3","child":"2","children_ages":0,"bookingurl":"","bookingKey":"","extrabeds_quantity":"0","extrabed_price":0,"room_adult_price":"0.00","room_child_price":"0.00","price_type":"0","cancellation_info":"","room_booked":0,"room_data":""}]

// class Rooms {
//   Rooms({
//     String? id,
//     String? name,
//     int? price,
//     int? preDay,
//     String? realPrice,
//     int? b2cPrice,
//     int? b2bPrice,
//     int? b2ePrice,
//     String? b2cMarkup,
//     String? b2bMarkup,
//     String? b2eMarkup,
//     String? serviceFee,
//     String? actualCurrency,
//     dynamic currency,
//     String? refundable,
//     String? refundableDate,
//     List<String>? img,
//     List<Amenities>? amenities,
//     List<Options>? options,
//   }) {
//     _id = id;
//     _name = name;
//     _price = price;
//     _preDay = preDay;
//     _realPrice = realPrice;
//     _b2cPrice = b2cPrice;
//     _b2bPrice = b2bPrice;
//     _b2ePrice = b2ePrice;
//     _b2cMarkup = b2cMarkup;
//     _b2bMarkup = b2bMarkup;
//     _b2eMarkup = b2eMarkup;
//     _serviceFee = serviceFee;
//     _actualCurrency = actualCurrency;
//     _currency = currency;
//     _refundable = refundable;
//     _refundableDate = refundableDate;
//     _img = img;
//     _amenities = amenities;
//     _options = options;
//   }

//   Rooms.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _price = json['price'];
//     _preDay = json['pre_day'];
//     _realPrice = json['real_price'];
//     _b2cPrice = json['b2c_price'];
//     _b2bPrice = json['b2b_price'];
//     _b2ePrice = json['b2e_price'];
//     _b2cMarkup = json['b2c_markup'];
//     _b2bMarkup = json['b2b_markup'];
//     _b2eMarkup = json['b2e_markup'];
//     _serviceFee = json['service_fee'];
//     _actualCurrency = json['actual_currency'];
//     _currency = json['currency'];
//     _refundable = json['refundable'];
//     _refundableDate = json['refundable_date'];
//     _img = json['img'] != null ? json['img'].cast<String>() : [];
//     if (json['amenities'] != null) {
//       _amenities = [];
//       json['amenities'].forEach((v) {
//         _amenities?.add(Amenities.fromJson(v));
//       });
//     }
//     if (json['options'] != null) {
//       _options = [];
//       json['options'].forEach((v) {
//         _options?.add(Options.fromJson(v));
//       });
//     }
//   }
//   String? _id;
//   String? _name;
//   int? _price;
//   int? _preDay;
//   String? _realPrice;
//   int? _b2cPrice;
//   int? _b2bPrice;
//   int? _b2ePrice;
//   String? _b2cMarkup;
//   String? _b2bMarkup;
//   String? _b2eMarkup;
//   String? _serviceFee;
//   String? _actualCurrency;
//   dynamic _currency;
//   String? _refundable;
//   String? _refundableDate;
//   List<String>? _img;
//   List<Amenities>? _amenities;
//   List<Options>? _options;
//   Rooms copyWith({
//     String? id,
//     String? name,
//     int? price,
//     int? preDay,
//     String? realPrice,
//     int? b2cPrice,
//     int? b2bPrice,
//     int? b2ePrice,
//     String? b2cMarkup,
//     String? b2bMarkup,
//     String? b2eMarkup,
//     String? serviceFee,
//     String? actualCurrency,
//     dynamic currency,
//     String? refundable,
//     String? refundableDate,
//     List<String>? img,
//     List<Amenities>? amenities,
//     List<Options>? options,
//   }) =>
//       Rooms(
//         id: id ?? _id,
//         name: name ?? _name,
//         price: price ?? _price,
//         preDay: preDay ?? _preDay,
//         realPrice: realPrice ?? _realPrice,
//         b2cPrice: b2cPrice ?? _b2cPrice,
//         b2bPrice: b2bPrice ?? _b2bPrice,
//         b2ePrice: b2ePrice ?? _b2ePrice,
//         b2cMarkup: b2cMarkup ?? _b2cMarkup,
//         b2bMarkup: b2bMarkup ?? _b2bMarkup,
//         b2eMarkup: b2eMarkup ?? _b2eMarkup,
//         serviceFee: serviceFee ?? _serviceFee,
//         actualCurrency: actualCurrency ?? _actualCurrency,
//         currency: currency ?? _currency,
//         refundable: refundable ?? _refundable,
//         refundableDate: refundableDate ?? _refundableDate,
//         img: img ?? _img,
//         amenities: amenities ?? _amenities,
//         options: options ?? _options,
//       );
//   String? get id => _id;
//   String? get name => _name;
//   int? get price => _price;
//   int? get preDay => _preDay;
//   String? get realPrice => _realPrice;
//   int? get b2cPrice => _b2cPrice;
//   int? get b2bPrice => _b2bPrice;
//   int? get b2ePrice => _b2ePrice;
//   String? get b2cMarkup => _b2cMarkup;
//   String? get b2bMarkup => _b2bMarkup;
//   String? get b2eMarkup => _b2eMarkup;
//   String? get serviceFee => _serviceFee;
//   String? get actualCurrency => _actualCurrency;
//   dynamic get currency => _currency;
//   String? get refundable => _refundable;
//   String? get refundableDate => _refundableDate;
//   List<String>? get img => _img;
//   List<Amenities>? get amenities => _amenities;
//   List<Options>? get options => _options;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['price'] = _price;
//     map['pre_day'] = _preDay;
//     map['real_price'] = _realPrice;
//     map['b2c_price'] = _b2cPrice;
//     map['b2b_price'] = _b2bPrice;
//     map['b2e_price'] = _b2ePrice;
//     map['b2c_markup'] = _b2cMarkup;
//     map['b2b_markup'] = _b2bMarkup;
//     map['b2e_markup'] = _b2eMarkup;
//     map['service_fee'] = _serviceFee;
//     map['actual_currency'] = _actualCurrency;
//     map['currency'] = _currency;
//     map['refundable'] = _refundable;
//     map['refundable_date'] = _refundableDate;
//     map['img'] = _img;
//     if (_amenities != null) {
//       map['amenities'] = _amenities?.map((v) => v.toJson()).toList();
//     }
//     if (_options != null) {
//       map['options'] = _options?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }

// /// id : "44"
// /// currCode : "EUR"
// /// price : 277
// /// pre_day : 277
// /// real_price : "276"
// /// b2c_price : 0
// /// b2b_price : 0
// /// b2e_price : 0
// /// b2c_markup : "10"
// /// b2b_markup : "5"
// /// b2e_markup : "2"
// /// service_fee : "10"
// /// quantity : "3"
// /// adults : "3"
// /// child : "2"
// /// children_ages : 0
// /// bookingurl : ""
// /// bookingKey : ""
// /// extrabeds_quantity : "0"
// /// extrabed_price : 0
// /// room_adult_price : "0.00"
// /// room_child_price : "0.00"
// /// price_type : "0"
// /// cancellation_info : ""
// /// room_booked : 0
// /// room_data : ""

// class Options {
//   Options({
//     String? id,
//     String? currCode,
//     int? price,
//     int? preDay,
//     String? realPrice,
//     int? b2cPrice,
//     int? b2bPrice,
//     int? b2ePrice,
//     String? b2cMarkup,
//     String? b2bMarkup,
//     String? b2eMarkup,
//     String? serviceFee,
//     String? quantity,
//     String? adults,
//     String? child,
//     int? childrenAges,
//     String? bookingurl,
//     String? bookingKey,
//     String? extrabedsQuantity,
//     int? extrabedPrice,
//     String? roomAdultPrice,
//     String? roomChildPrice,
//     String? priceType,
//     String? cancellationInfo,
//     int? roomBooked,
//     String? roomData,
//   }) {
//     _id = id;
//     _currCode = currCode;
//     _price = price;
//     _preDay = preDay;
//     _realPrice = realPrice;
//     _b2cPrice = b2cPrice;
//     _b2bPrice = b2bPrice;
//     _b2ePrice = b2ePrice;
//     _b2cMarkup = b2cMarkup;
//     _b2bMarkup = b2bMarkup;
//     _b2eMarkup = b2eMarkup;
//     _serviceFee = serviceFee;
//     _quantity = quantity;
//     _adults = adults;
//     _child = child;
//     _childrenAges = childrenAges;
//     _bookingurl = bookingurl;
//     _bookingKey = bookingKey;
//     _extrabedsQuantity = extrabedsQuantity;
//     _extrabedPrice = extrabedPrice;
//     _roomAdultPrice = roomAdultPrice;
//     _roomChildPrice = roomChildPrice;
//     _priceType = priceType;
//     _cancellationInfo = cancellationInfo;
//     _roomBooked = roomBooked;
//     _roomData = roomData;
//   }

//   Options.fromJson(dynamic json) {
//     _id = json['id'];
//     _currCode = json['currCode'];
//     _price = json['price'];
//     _preDay = json['pre_day'];
//     _realPrice = json['real_price'];
//     _b2cPrice = json['b2c_price'];
//     _b2bPrice = json['b2b_price'];
//     _b2ePrice = json['b2e_price'];
//     _b2cMarkup = json['b2c_markup'];
//     _b2bMarkup = json['b2b_markup'];
//     _b2eMarkup = json['b2e_markup'];
//     _serviceFee = json['service_fee'];
//     _quantity = json['quantity'];
//     _adults = json['adults'];
//     _child = json['child'];
//     _childrenAges = json['children_ages'];
//     _bookingurl = json['bookingurl'];
//     _bookingKey = json['bookingKey'];
//     _extrabedsQuantity = json['extrabeds_quantity'];
//     _extrabedPrice = json['extrabed_price'];
//     _roomAdultPrice = json['room_adult_price'];
//     _roomChildPrice = json['room_child_price'];
//     _priceType = json['price_type'];
//     _cancellationInfo = json['cancellation_info'];
//     _roomBooked = json['room_booked'];
//     _roomData = json['room_data'];
//   }
//   String? _id;
//   String? _currCode;
//   int? _price;
//   int? _preDay;
//   String? _realPrice;
//   int? _b2cPrice;
//   int? _b2bPrice;
//   int? _b2ePrice;
//   String? _b2cMarkup;
//   String? _b2bMarkup;
//   String? _b2eMarkup;
//   String? _serviceFee;
//   String? _quantity;
//   String? _adults;
//   String? _child;
//   int? _childrenAges;
//   String? _bookingurl;
//   String? _bookingKey;
//   String? _extrabedsQuantity;
//   int? _extrabedPrice;
//   String? _roomAdultPrice;
//   String? _roomChildPrice;
//   String? _priceType;
//   String? _cancellationInfo;
//   int? _roomBooked;
//   String? _roomData;
//   Options copyWith({
//     String? id,
//     String? currCode,
//     int? price,
//     int? preDay,
//     String? realPrice,
//     int? b2cPrice,
//     int? b2bPrice,
//     int? b2ePrice,
//     String? b2cMarkup,
//     String? b2bMarkup,
//     String? b2eMarkup,
//     String? serviceFee,
//     String? quantity,
//     String? adults,
//     String? child,
//     int? childrenAges,
//     String? bookingurl,
//     String? bookingKey,
//     String? extrabedsQuantity,
//     int? extrabedPrice,
//     String? roomAdultPrice,
//     String? roomChildPrice,
//     String? priceType,
//     String? cancellationInfo,
//     int? roomBooked,
//     String? roomData,
//   }) =>
//       Options(
//         id: id ?? _id,
//         currCode: currCode ?? _currCode,
//         price: price ?? _price,
//         preDay: preDay ?? _preDay,
//         realPrice: realPrice ?? _realPrice,
//         b2cPrice: b2cPrice ?? _b2cPrice,
//         b2bPrice: b2bPrice ?? _b2bPrice,
//         b2ePrice: b2ePrice ?? _b2ePrice,
//         b2cMarkup: b2cMarkup ?? _b2cMarkup,
//         b2bMarkup: b2bMarkup ?? _b2bMarkup,
//         b2eMarkup: b2eMarkup ?? _b2eMarkup,
//         serviceFee: serviceFee ?? _serviceFee,
//         quantity: quantity ?? _quantity,
//         adults: adults ?? _adults,
//         child: child ?? _child,
//         childrenAges: childrenAges ?? _childrenAges,
//         bookingurl: bookingurl ?? _bookingurl,
//         bookingKey: bookingKey ?? _bookingKey,
//         extrabedsQuantity: extrabedsQuantity ?? _extrabedsQuantity,
//         extrabedPrice: extrabedPrice ?? _extrabedPrice,
//         roomAdultPrice: roomAdultPrice ?? _roomAdultPrice,
//         roomChildPrice: roomChildPrice ?? _roomChildPrice,
//         priceType: priceType ?? _priceType,
//         cancellationInfo: cancellationInfo ?? _cancellationInfo,
//         roomBooked: roomBooked ?? _roomBooked,
//         roomData: roomData ?? _roomData,
//       );
//   String? get id => _id;
//   String? get currCode => _currCode;
//   int? get price => _price;
//   int? get preDay => _preDay;
//   String? get realPrice => _realPrice;
//   int? get b2cPrice => _b2cPrice;
//   int? get b2bPrice => _b2bPrice;
//   int? get b2ePrice => _b2ePrice;
//   String? get b2cMarkup => _b2cMarkup;
//   String? get b2bMarkup => _b2bMarkup;
//   String? get b2eMarkup => _b2eMarkup;
//   String? get serviceFee => _serviceFee;
//   String? get quantity => _quantity;
//   String? get adults => _adults;
//   String? get child => _child;
//   int? get childrenAges => _childrenAges;
//   String? get bookingurl => _bookingurl;
//   String? get bookingKey => _bookingKey;
//   String? get extrabedsQuantity => _extrabedsQuantity;
//   int? get extrabedPrice => _extrabedPrice;
//   String? get roomAdultPrice => _roomAdultPrice;
//   String? get roomChildPrice => _roomChildPrice;
//   String? get priceType => _priceType;
//   String? get cancellationInfo => _cancellationInfo;
//   int? get roomBooked => _roomBooked;
//   String? get roomData => _roomData;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['currCode'] = _currCode;
//     map['price'] = _price;
//     map['pre_day'] = _preDay;
//     map['real_price'] = _realPrice;
//     map['b2c_price'] = _b2cPrice;
//     map['b2b_price'] = _b2bPrice;
//     map['b2e_price'] = _b2ePrice;
//     map['b2c_markup'] = _b2cMarkup;
//     map['b2b_markup'] = _b2bMarkup;
//     map['b2e_markup'] = _b2eMarkup;
//     map['service_fee'] = _serviceFee;
//     map['quantity'] = _quantity;
//     map['adults'] = _adults;
//     map['child'] = _child;
//     map['children_ages'] = _childrenAges;
//     map['bookingurl'] = _bookingurl;
//     map['bookingKey'] = _bookingKey;
//     map['extrabeds_quantity'] = _extrabedsQuantity;
//     map['extrabed_price'] = _extrabedPrice;
//     map['room_adult_price'] = _roomAdultPrice;
//     map['room_child_price'] = _roomChildPrice;
//     map['price_type'] = _priceType;
//     map['cancellation_info'] = _cancellationInfo;
//     map['room_booked'] = _roomBooked;
//     map['room_data'] = _roomData;
//     return map;
//   }
// }

// /// icon : "https://phptravels.net/api/uploads/images/hotels/amenities/"
// /// name : "Bathroom phone"

// class AmenitiesOne {
//   Amenities({
//     String? icon,
//     String? name,
//   }) {
//     _icon = icon;
//     _name = name;
//   }

//   AmenitiesOne.fromJson(dynamic json) {
//     _icon = json['icon'];
//     _name = json['name'];
//   }
//   String? _icon;
//   String? _name;
//   AmenitiesOne copyWith({
//     String? icon,
//     String? name,
//   }) =>
//       Amenities(
//         icon: icon ?? _icon,
//         name: name ?? _name,
//       );
//   String? get icon => _icon;
//   String? get name => _name;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['icon'] = _icon;
//     map['name'] = _name;
//     return map;
//   }
// }

// /// icon : "https://phptravels.net/api/uploads/images/hotels/amenities/522827_airport.png"
// /// name : "Airport Transport"

// class Amenities {
//   Amenities({
//     String? icon,
//     String? name,
//   }) {
//     _icon = icon;
//     _name = name;
//   }

//   Amenities.fromJson(dynamic json) {
//     _icon = json['icon'];
//     _name = json['name'];
//   }
//   String? _icon;
//   String? _name;
//   Amenities copyWith({
//     String? icon,
//     String? name,
//   }) =>
//       Amenities(
//         icon: icon ?? _icon,
//         name: name ?? _name,
//       );
//   String? get icon => _icon;
//   String? get name => _name;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['icon'] = _icon;
//     map['name'] = _name;
//     return map;
//   }
// }
