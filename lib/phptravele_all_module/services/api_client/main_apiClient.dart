
import 'dart:convert';
import 'dart:developer';

import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:http/http.dart' as http;
import 'package:phptravelapp/app/mobules/services/data/api/tourDetail_apiClient.dart';
class HomeOffListApiProvider {


  Future<HomeOfferListModelClass> mainEndPointGetData() async {
    var respons;

    try {
      respons = await http.get(
          Uri.parse(
              'http://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd'),
        // headers: headers,
      );
      // print('hello ');
      // print(respons.body);
      if (respons.statusCode == 200) {
        var parsed = jsonDecode(respons.body.toString());
       var filterData = HomeOfferListModelClass.fromJson(parsed);
        print(filterData.modules![0].name);

        // print(filterData.modules.toString());
        return filterData;
      }
       return filterData;

    } catch (e) {
      log("error occurs hahahahhahah : $e");
    }

    return HomeOfferListModelClass();
  }
}