import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:phptravelapp/app/mobules/services/model/HotelDetailModelCalass.dart';

class ApiProvider {
  // var response=
  final String url2 = "https://randomuser.me/api/?results=10";
  final String url =
      'https://phptravels.net/api/api/hotel/detail?appKey=phptravels';

  // Box? box;
  //
  // Future openBox() async{
  //   var dir=await getApplicationDocumentsDirectory();
  //   Hive.init(dir.path);
  //   box=await Hive.openBox('data');
  //   return;
  // }
  // getAllData() async {
  //   // await openBox();
  //   String url='http://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd';
  // }

  static Future<HotelDetailModelCalass?> getUserData() async {
    // var url2=Uri.parse("https://randomuser.me/api/?results=10");
    // var url = Uri.parse("https://demotravels.com/api/api/main/app?appKey=phptravels&lang=en&currency=usd");
    var response = await http.get(
      Uri.parse(
          'https://phptravels.net/api/api/hotel/detail?appKey=phptravels'),
      // headers: headers,
    );
    print(response.body);
    // final requestbody = json.decode(response.body);
    // print(requestbody.runtimeType);
    // print(response.headers);
    // try {
    if (response.body == 200) {
      print('yaha tak to tike he ');
      return hotelDetailModelCalassFromJson(response.body);
    } else if (response.body.isNotEmpty) {
      print('yaha b tik he pir error kaha he');
      return hotelDetailModelCalassFromJson(response.body);
      // return homeOfferListModelClassFromJson(requestbody);
    } else {
      // show_snackBarError(title: "Error", description: "Oops, server is down");
      Get.snackbar('error', 'oop connection error');
      print('yaha par data nhe he ');
      // return null;
      return hotelDetailModelCalassFromJson(response.body);
    }
    // } on PlatformException catch (e) {
    //   // print(e);
    //   // show_snackBarError(title: "Error", description: e.message.toString());
    //   // print('dirct yaha par q ata he$e');
    //   Get.snackbar('Error', 'yaha par error he ${e.toString()}');
    // } catch (e) {
    //   print('dirct yaha par q ata he :$e');
    //   // print('yaha catch me error he ${e}');
    // }
  }
}
