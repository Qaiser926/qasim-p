// import 'package:get/get.dart';
// import 'package:phptravelapp/app/mobules/services/data/repository/flightDetail_repository.dart';
// import 'package:phptravelapp/app/mobules/services/model/HotelDetail_ModelClass.dart';
// import 'package:phptravelapp/testingPage/HotelDetail_ModelClass.dart';

// class FlightDetailController extends GetxController {
//   final FlightDetailRepository flightDetailRepository;
//   FlightDetailController({required this.flightDetailRepository});

//   List _FlightDetailFullDataList = [];
//   List<dynamic> get FlightDetailFullDataList => _FlightDetailFullDataList;

//   Future<void> getFligghtDetailDataList() async {
//     Response response = await flightDetailRepository.getFlightDetailRepoList();

//     if (response == 200) {
//       _FlightDetailFullDataList = [];

//       _FlightDetailFullDataList.addAll(flightDetailModelClassFromJson(response.body));
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/modelClass.dart';
import 'package:phptravelapp/app/mobules/services/data/api/flightDetail_apiClient.dart';
import 'package:phptravelapp/app/mobules/services/main_apiProvider.dart';
import 'package:phptravelapp/app/mobules/homePage/bottomNav/bottomNavigation.dart';
import 'package:phptravelapp/app/mobules/services/data/api/hotelDetail_ApiClient.dart';
import 'package:phptravelapp/app/mobules/services/model/FlightDetailModelClass.dart';
import 'package:phptravelapp/app/mobules/services/model/HotelDetailModelCalass.dart';
import 'package:phptravelapp/app/mobules/services/model/HotelDetail_ModelClass.dart';

// class HomeController extends GetxController with StateMixin<List<dynamic>> {
// class HomeController extends GetxController with StateMixin<List<dynamic>>{

class FlightDetailController extends GetxController {
  RxInt currentIndex = 0.obs;

  var name = "".obs;
  var isLoading = false.obs;
  var modal = Controllers().obs;
  var isEmptyData = false.obs;
  // List<TourAppModel> modelDataList=List<TourAppModel>.empty().obs;

  List<Controllers> flightDetailmodelClass =
      <Controllers>[].obs;

  // List<HomeOfferListModelClass> _productModelListData =
  //     List<HomeOfferListModelClass>.empty().obs;
  // List<HomeOfferListModelClass> get productModelListData =>
  //     _productModelListData;

  List<Widget> homeViewWidget = [BottomNavigationBarPage()];
  @override
  void onInit() {
    super.onInit();
    // FlightDetailApiClientProvider().getFlightDetailData();
    HotelDetailApiClientProvider().getDate();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

// original data
  fatchProductList() async {
    // print("tapped $id");
    try {
      isLoading(true);
      var product = await FlightDetailApiClientProvider().getDate();

      if (product is Controllers) {
        print("data not null");
        modal.value = product as Controllers;
        update();
      } else {
        isEmptyData(true);
        update();
      }
    } finally {
      isLoading(false);
    }
  }

  void cleanUpTask() {
    print('clean up task');
  }
}
