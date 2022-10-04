// // import 'package:dropdown_button2/dropdown_button2.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// import 'package:currency_picker/currency_picker.dart';
// import 'package:dio/dio.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:phptravelapp/app/colors.dart';
// import 'package:phptravelapp/app/language_translation_string/languageTranslation.dart';
// import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
// import 'package:phptravelapp/app/mobules/homePage/component/drawer/drawer.dart';
// import 'package:phptravelapp/app/mobules/homePage/component/expandedListAnimation.dart';
// import 'package:phptravelapp/app/mobules/homePage/component/feature_car.dart';
// import 'package:phptravelapp/app/mobules/homePage/component/feature_hotel.dart';
// import 'package:phptravelapp/app/mobules/homePage/component/feature_tourData.dart';
// import 'package:phptravelapp/app/mobules/homePage/component/myScrollerBar.dart';
// import 'package:phptravelapp/app/mobules/homePage/component/topRowIcon.dart';
// import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
// import 'package:phptravelapp/app/mobules/services/data/api/flightDetail_apiClient.dart';
// import 'package:phptravelapp/app/mobules/services/data/api/hotelDetail_ApiClient.dart';
// import 'package:phptravelapp/app/mobules/services/main_apiProvider.dart';
// import 'package:phptravelapp/reusableText/commonText.dart';
// import 'package:phptravelapp/reusableText/dimensions.dart';
// import 'package:phptravelapp/reusableText/reusable_commonText.dart';
// import 'package:phptravelapp/testingPage/testingmodel.dart';
// import 'package:dropdown_search/dropdown_search.dart';
//
// import '../component/flightdestinationData.dart';
// // import 'package:phptravelapp/app/mobules/homePage/component/feature_hotel.dart';
// // import 'package:phptravelapp/app/reusableText/reusableText.dart';
// // import '../component/flightdestinationData.dart';
//
// class HomeViewPage extends GetView<HomeController> {
//   final homecontroller = Get.put(HomeController());
//
//   String lang = 'english';
//   @override
//   Widget build(BuildContext context) {
//     // print('the height is : ${MediaQuery.of(context).size.height}');
//     // print('then width is : ${MediaQuery.of(context).size.width}');
//     return Scaffold(
//       // drawer: drawer(),
//
//       body: DefaultTabController(
//         length: 4,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//
//               SizedBox(
//                 height: Get.size.height * 0.02,
//               ),
//               TopRowIcon(),
//               ElevatedButton(onPressed: (){
//                 // HotelDetailApiClientProvider().getDate();
//                 ApiProvider.getUserData();
//               }, child: Text('Hit me ')),
//               SizedBox(
//                 height: Get.size.height * 0.013,
//               ),
//               Align(
//                   alignment: Alignment.center,
//                   child: commonText(
//                     title: 'topflightdestination'.tr,
//                     size: Dimensions.fontSize25,
//                     fontWeight: FontWeight.bold,
//                   )),
//               SizedBox(
//                 height: Dimensions.textsize15,
//               ),
//               FeatureFlight(),
//               SizedBox(height: Get.size.height * 0.01),
//               Padding(
//                 padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingLeft10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 3),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(width: 1, color: Colors.grey),
//                           shape: BoxShape.circle,
//                         ),
//                         width: Dimensions.fontSize14,
//                         height: Dimensions.fontSize14,
//                         child: Icon(
//                           Icons.question_mark,
//                           size: 8,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Expanded(
//                         child: Text(
//                       'belowFlightdestinationText'.tr,
//                       style: TextStyle(fontSize: Dimensions.fontSize14),
//                     ))
//                   ],
//                 ),
//               ),
//               SizedBox(height: Get.size.height * 0.05),
//               Container(
//                 color: PColor.mainColor.withOpacity(0.6),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: Dimensions.border13,
//                     ),
//                     SizedBox(
//                       height: Get.size.height * 0.011,
//                     ),
//                     Align(
//                         alignment: Alignment.center,
//                         child: commonText(
//                           title: 'featurehotel'.tr,
//                           size: Dimensions.fontSize25,
//                           fontWeight: FontWeight.bold,
//                         )),
//                     SizedBox(
//                       height: Get.size.height * 0.012,
//                     ),
//                     FeatureHotel(),
//                     SizedBox(
//                       height: Dimensions.fontSize20,
//                     ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(
//                 height: Dimensions.border13,
//               ),
//               Align(
//                   alignment: Alignment.center,
//                   child: commonText(
//                     title: 'featuretour'.tr,
//                     size: 25,
//                     fontWeight: FontWeight.bold,
//                   )),
//               SizedBox(
//                 height: 12,
//               ),
//               FeatureTourData(),
//               SizedBox(
//                 height: Dimensions.border13,
//               ),
//               Align(
//                   alignment: Alignment.center,
//                   child: commonText(
//                     title: 'Featured Cars',
//                     size: Dimensions.fontSize25,
//                     fontWeight: FontWeight.bold,
//                   )),
//               SizedBox(
//                 height: Dimensions.border13,
//               ),
//               FeatureCar(),
//               ExpandableList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_car.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_hotel.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_tourData.dart';
import 'package:phptravelapp/app/mobules/homePage/component/flightdestinationData.dart';
import 'package:phptravelapp/app/mobules/homePage/component/topRowIcon.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/mobules/services/controller/flightDetailController.dart';
import 'package:phptravelapp/app/mobules/services/controller/hotelDetail_controller.dart';
import 'package:phptravelapp/app/mobules/tourPage/tourView/tour_all_data.dart';
import 'package:phptravelapp/phptravele_all_module/controller/flightDateRangeController.dart';
import 'package:phptravelapp/phptravele_all_module/services/api_client/main_apiClient.dart';
import 'package:phptravelapp/phptravele_all_module/travelHome/component/destinationSearchPage.dart';
import 'package:phptravelapp/phptravele_all_module/travelHome/component/hotelroomDetail.dart';
import 'package:phptravelapp/reusableText/commonText.dart';
import 'package:phptravelapp/reusableText/dimensions.dart';
import 'package:phptravelapp/testingPage/TravleHomePageTester.dart';
import 'package:phptravelapp/app/mobules/hotelPage/featureHotel_allData.dart';

class HomeViewPage extends StatefulWidget {
  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int currentIndex = 0;
  bool isShowAllImage = false;
  int index = 0;
  final PageController pageController = PageController();

  void _tabListener() {
    setState(() {
      index = tabController!.index;
    });
  }

  final flightDetaildateRangeController = Get.put(FlightDateRangeController());
  @override
  initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(_tabListener);
  }

  @override
  void dispose() {
    tabController!.removeListener(_tabListener);
    tabController!.dispose();
    super.dispose();
  }

  final homecontroller = Get.put(HomeController());

  final flightdetailController = Get.put(HotelDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PColor.mainColor.withOpacity(0.1),
        body: Container(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*  Container(
                margin: EdgeInsets.only(left: Dimensions.paddingLeft10,right: Dimensions.paddingLeft10,bottom: Dimensions.paddingLeft10*2,top: Dimensions.paddingLeft10*2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400, width: 0.7),
                  borderRadius: BorderRadius.circular(4.0),
                  // color: Colors.grey.shade200.withOpacity(0.99),

                  boxShadow: const [
                    BoxShadow(
                      color: Colors.transparent,
                      blurRadius: 5,
                      spreadRadius: 5.0,
                      offset: Offset(5, 5), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 15,top: Dimensions.padding8),
                      child: commonText(title: "Destination",size: 10,Textcolor: PColor.mainColor),

                    ),
                    InkWell(
                      onTap: (){
                        Get.to(DestinationSearchPage());
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: Dimensions.textsize15,right: Dimensions.paddingLeft10*2,bottom: Dimensions.paddingLeft10,top: Dimensions.sizedbox5),
                        width: double.infinity,
                        height: 40,

                        decoration: BoxDecoration(
                            color: PColor.mainColor,
                            borderRadius: BorderRadius.circular(Dimensions.paddingvertical5)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: Dimensions.textsize15),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: commonText(title: 'London',Textcolor: Colors.black87)),
                        ),
                      ),
                    ),
                    rangeCalender(),
                  ],
                ),
              ),*/

              TopRowIcon(),
              SizedBox(
                height: Dimensions.paddingLeft10,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.paddingLeft10,
                    right: Dimensions.fontSize20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText(
                      title: 'Top Flight Destinations',
                      size: Dimensions.textsize15,
                      fontWeight: FontWeight.w500,
                    ),

                    // InkWell(
                    //     onTap: (){
                    //       Get.to(FeatureHotelAllList());
                    //     },
                    //     child: commonText(title: 'View all',size: 12,fontWeight: FontWeight.w700,Textcolor: PColor.mainTextColor,))
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.paddingvertical5,
              ),
              FeatureFlight(),
              SizedBox(
                height: Dimensions.paddingLeft10,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.paddingLeft10,
                    right: Dimensions.paddingLeft10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText(
                      title: 'Top Hotel Destinations',
                      size: Dimensions.fontSize20,
                      fontWeight: FontWeight.w500,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(FeatureHotelAllList());
                        },
                        child: commonText(
                          title: 'View all',
                          size: Dimensions.border13,
                          fontWeight: FontWeight.w700,
                          Textcolor: PColor.mainTextColor,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.paddingvertical5,
              ),
              FeatureHotel(),
              SizedBox(
                height: Dimensions.paddingvertical5 * 2,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.paddingLeft10,
                    right: Dimensions.paddingLeft10,
                    bottom: Dimensions.height4),
                child: commonText(
                  title: 'Get offers from top providers',
                  size: Dimensions.textsize15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              FeatureCar(),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.paddingLeft10,
                    right: Dimensions.paddingLeft10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText(
                      title: 'Feature Tours',
                      size: Dimensions.fontSize20,
                      fontWeight: FontWeight.w500,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(FeatureTourAllDataList());
                        },
                        child: commonText(
                          title: 'View all',
                          size: Dimensions.border13,
                          fontWeight: FontWeight.w700,
                          Textcolor: PColor.mainTextColor,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.paddingvertical5 * 2,
              ),
              FeatureTourData(),
            ],
          ),
        ));
  }

  Widget rangeCalender() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: Dimensions.paddingLeft10 * 2,
              right: Dimensions.paddingLeft10 * 2),
          child: Divider(color: PColor.mainColor),
        ),
        Container(
          height: Get.size.height * 0.06,
          child: Row(
            children: [
              Container(
                  width: Get.size.width * 0.4,
                  decoration: BoxDecoration(
                      // color: PColor.mainColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: InkWell(
                    onTap: () {
                      flightDetaildateRangeController.chooseDateRangePicker();
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonText(
                              title: 'Dates',
                              size: 9,
                              Textcolor: PColor.mainColor,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Obx(() => Text(
                                        DateFormat('dd-MM-yyyy')
                                            .format(
                                                flightDetaildateRangeController
                                                    .dateRange.value.start)
                                            .toString(),
                                        style: TextStyle(fontSize: 10),
                                      )),
                                  Obx(() => Text(
                                        " - " +
                                            DateFormat("dd-MM-yyyy")
                                                .format(
                                                    flightDetaildateRangeController
                                                        .dateRange.value.end)
                                                .toString(),
                                        style: TextStyle(fontSize: 10),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              VerticalDivider(
                color: PColor.mainColor,
              ),
              InkWell(
                onTap: () {
                  Get.to(HotelRoomDetail());
                },
                child: Container(
                  width: Get.size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText(
                        title: 'Rooms',
                        size: 9,
                        Textcolor: PColor.mainColor,
                      ),
                      commonText(title: '4 guests, 1 room', size: 11),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: Dimensions.paddingLeft10 * 2,
              right: Dimensions.paddingLeft10 * 2),
          child: Divider(color: PColor.mainColor),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: Dimensions.paddingLeft10 * 2,
              right: Dimensions.paddingLeft10 * 2),
          child: MaterialButton(
              onPressed: () {},
              child: commonText(title: 'Search', Textcolor: Colors.white),
              color: PColor.mainTextColor,
              minWidth: double.infinity),
        ),
        SizedBox(
          height: Dimensions.paddingvertical5,
        ),
      ],
    );
  }
}
