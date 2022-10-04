// import 'package:get/get.dart';

// class FlightDetailApiClient extends GetConnect implements GetxService {
//   late String token;
//   final String appBaseUrl;

//   late Map<String, String> _mainHeader;

//   FlightDetailApiClient({required this.appBaseUrl}) {
//     baseUrl = appBaseUrl;
//     timeout = Duration(seconds: 30);

//     _mainHeader = {
//       "Content-type": "Application/json, charset=UTF-8",
//       "Authorization": "Bearer $token",
//     };
//   }
//   Future<Response> getFlightDetailData(String url) async {
//     try {
//       var response = await get(url);
//       return response;
//     } catch (e) {
//       return Response(statusCode: 1, statusText: e.toString());
//     }
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:phptravelapp/app/mobules/services/model/FlightDetailModelClass.dart';
import 'package:phptravelapp/app/mobules/services/model/HotelDetailModelCalass.dart';
import 'package:phptravelapp/app/mobules/services/model/HotelDetail_ModelClass.dart';
import 'dart:convert' as convert;

// var flightData;

class FlightDetailApiClientProvider {
//
//   // Future<FlightDetailModelClass?> getFlightDetailData(String id) async {
//   Future<Controllers> getFlightDetailData() async {
//     var response = await http.post(
//         Uri.parse(
//             'https://phptravels.net/api/api/flight/search?appKey=phptravels'),
//         body: {'origin':"LHE",'destination':"DXB","type":"oneway",
//           "departure_date":"29-09-2022","class_type":"economy","adults":"1",
//           "childrens":"0",'infants':"0","currency":"USD",'ip':"::1","browser_version":"chrome","request_type":"postman","os":'windows',
//
//         }
//     );
//     print(response.body);
//     try {
//       if (response.body == 200) {
//         print('yaha tak to tike he ');
//         return controllersFromJson(response.body);
//       } else if (response.body.isNotEmpty) {
//         print('yaha b tik he pir error kaha he');
//         return controllersFromJson(response.body);
//       } else {
//         Get.snackbar('error', 'oop connection error');
//         print('yaha par data nhe he ');
//         // return null;
//         return controllersFromJson(response.body);
//       }
//     }
//     on PlatformException catch (e) {
//       Get.snackbar('Error', 'yaha par error he ${e.toString()}');
//     } catch (e) {
//       print('dirct yaha par q ata he :$e');
//     }
//     return Controllers();
//   }

  Future<Controllers> getDate() async {
    var respons;
    try {
      respons = await http.post(
          Uri.parse(
              'https://phptravels.net/api/api/flight/search?appKey=phptravels'),
          body: {'origin':"LHE",'destination':"DXB","type":"oneway",
          "departure_date":"29-09-2022","class_type":"economy","adults":"1",
            "childrens":"0",'infants':"0","currency":"USD",'ip':"::1","browser_version":"chrome","request_type":"postman","os":'windows',
          }
        // headers: headers,
      );
      // print('hello ');
      // print(respons.body);
      if (respons.statusCode == 200) {
        print('hello');
        var parsed = jsonDecode(respons.body.toString());
       var flightData = Controllers.fromJson(parsed);
        print(flightData);
        print(flightData.segments.toString());
        return flightData;
      }
// return filterData;
    } catch (e) {
      log("error occurs hahahahhahah : $e");
    }

    return Controllers();
  }
}
