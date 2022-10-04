import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/flightPage/flightView/flightDetailPages/flightDetailPage.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/component/drawer/drawer.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/phptravele_all_module/services/api_client/main_apiClient.dart';
import 'package:phptravelapp/reusableText/dimensions.dart';
import 'package:phptravelapp/routes/app_pages/app_pages.dart';
import 'package:phptravelapp/routes/app_routes/app_route.dart';
import 'package:http/http.dart' as http;

import '../../services/main_apiProvider.dart';

class FeatureFlight extends StatefulWidget {
  @override
  State<FeatureFlight> createState() => _FeatureFlightState();
}

class _FeatureFlightState extends State<FeatureFlight> {
  // HomeController controller = Get.find<HomeController>();
  int currentIndex = 0;
  final PageController pageController = PageController();
  double height = 0;
  double width = 0;
  late List flightDetailList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiProvider.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingLeft10),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(color: Colors.grey.shade200, width: 0.8),
                borderRadius: BorderRadius.circular(Dimensions.padding8),
                // color: Colors.grey.shade200.withOpacity(0.99),

                boxShadow: const [
                  BoxShadow(
                    color: Colors.transparent,
                    blurRadius: 0,
                    spreadRadius: 4.0,
                    offset: Offset(3, 3), // shadow direction: bottom right
                  ),
                ],
              ),
              width: Get.size.width,
              height: Dimensions.height120,
              child: FutureBuilder<HomeOfferListModelClass>(
                future: HomeOffListApiProvider().mainEndPointGetData(),
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState) {
                  //   Center(
                  //     child: CircularProgressIndicator(),
                  //   );
                  // }
                  if (!snapshot.hasData) {
                    Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.featuredFlights?.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data?.featuredFlights;
                        // var item = index as  List<HomeOfferListModelClass>;

                        /// yaha niche data ko spit kia he first wala show nhe karna chahta our second show karo
                        String from = item?[index].from ?? "";
                        var fromResult =
                            from.substring(4, from.lastIndexOf(''));

                        String to = item?[index].to ?? "";
                        String toResult = to.substring(4, to.lastIndexOf(''));
                        // print(toResult);
                        return InkWell(
                            onTap: () async {
                              // var url = Uri.parse(
                              //     'https://phptravels.net/api/api/hotel/detail?appKey=phptravels');
                              // var mainUrl =
                              //     ('https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd');

                              // Future<String?> _getdata() async {
                              //   await http.post(url, body: {'hotel_id': 38}).then(
                              //       (response) {
                              //     var data = json.decode(response.body);
                              //     setState(() {
                              //       flightDetailList = data['featured_hotels'];
                              //     });
                              //     print(response.body);
                              //   });
                              // }

                              // var response = await http
                              //     .post(mainUrl, body: {'hotel_id': 38.toString()});
                              // print('Response status: ${response.statusCode}');
                              // print('Response body: ${response.body}');
                              Get.to(
                                FlightDetailPage(
                                  from: item?[index].from,
                                  to: item?[index].to,
                                ),
                              );
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(right: Dimensions.height6),
                              decoration: BoxDecoration(
                                //  color: PColor.mainColor,
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.grey.shade200, width: 0.7),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height6),
                                // color: Colors.grey.shade200.withOpacity(0.99),

                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 3,
                                    spreadRadius: 0.8,
                                    offset: Offset(0.4,
                                        -0.6), // shadow direction: bottom right
                                  )
                                ],
                              ),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: Dimensions.width160,
                                        height: Get.size.height,
                                        child: Image.network(
                                            item?[index].thumbnail ?? "value")),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Dimensions.paddingLeft10,
                                            vertical:
                                                Dimensions.paddingvertical5),
                                        child: Container(
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              SizedBox(
                                                height: Dimensions.height4,
                                              ),
                                              Text(
                                                item?[index].title ??
                                                    'title not show ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        Dimensions.textsize15),
                                              ),
                                              SizedBox(
                                                height: Dimensions.height2,
                                              ),
                                              Text(
                                                "-------------------",
                                                style: TextStyle(
                                                    letterSpacing: 3,
                                                    color:
                                                        Colors.grey.shade400),
                                              ),
                                              SizedBox(
                                                height: Dimensions.height2,
                                              ),
                                              Container(
                                                  width: Dimensions.width190,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          // item[index %
                                                          //             controller
                                                          //                 .modal
                                                          //                 .value
                                                          //                 .featuredFlights!
                                                          //                 .length]
                                                          //         .from ??
                                                          fromResult,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black87,
                                                              fontSize:
                                                                  Dimensions
                                                                      .border13),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              Dimensions.width8,
                                                        ),
                                                        Icon(
                                                          Icons.arrow_forward,
                                                          size: Dimensions
                                                              .textsize15,
                                                          color: Colors
                                                              .grey.shade600,
                                                        ),
                                                        SizedBox(
                                                          width: Dimensions
                                                              .paddingLeft10,
                                                        ),
                                                        Expanded(
                                                            child: Text(
                                                          toResult,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black87,
                                                              fontSize:
                                                                  Dimensions
                                                                      .border13),
                                                        ))
                                                      ])),
                                              SizedBox(
                                                height:
                                                    Dimensions.paddingLeft10,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: 'From'.tr,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: Dimensions
                                                            .textsize15)),
                                                TextSpan(text: '    '),
                                                TextSpan(
                                                    text: "USD",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize: Dimensions
                                                            .fontSize16)),
                                                TextSpan(text: '  '),
                                                TextSpan(
                                                    text: item?[index]
                                                        .price
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: Dimensions
                                                            .fontSize16,
                                                        color: Colors.black)),
                                              ]))
                                            ])))
                                  ]),
                            ));
                      },
                    ),
                  );
                },
              )
              /* GetBuilder<HomeController>(
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const CircularProgressIndicator(),
                    ));
                  }
                  if (controller.isEmptyData.value) {
                    return Center(
                        child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text("nodatafoundText".tr),
                      ),
                    ));
                  }
                  return
                    PageView.builder(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index %
                            controller.modal.value.featuredFlights!.length;
                      });
                    },
                    // itemCount:controller.modal.value.featuredFlights!.length ,
                    itemBuilder: (context, index) {
                      if (controller.isLoading.value) {
                        return Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: const CircularProgressIndicator(),
                        ));
                      }
                      if (controller.isEmptyData.value) {
                        return Center(
                            child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text("nodatafoundText".tr),
                          ),
                        ));
                      }
                      final item = controller.modal.value.featuredFlights;
                      // var item = index as  List<HomeOfferListModelClass>;

                      /// yaha niche data ko spit kia he first wala show nhe karna chahta our second show karo
                      String from = item![index %
                              controller.modal.value.featuredFlights!.length]
                          .from
                          .toString();
                      String fromResult =
                          from.substring(4, from.lastIndexOf(''));

                      String to = item[index %
                              controller.modal.value.featuredFlights!.length]
                          .to
                          .toString();
                      String toResult = to.substring(4, to.lastIndexOf(''));
                      // print(toResult);
                      return InkWell(
                        onTap: () async {
                          // var url = Uri.parse(
                          //     'https://phptravels.net/api/api/hotel/detail?appKey=phptravels');
                          // var mainUrl =
                          //     ('https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd');

                          // Future<String?> _getdata() async {
                          //   await http.post(url, body: {'hotel_id': 38}).then(
                          //       (response) {
                          //     var data = json.decode(response.body);
                          //     setState(() {
                          //       flightDetailList = data['featured_hotels'];
                          //     });
                          //     print(response.body);
                          //   });
                          // }

                          // var response = await http
                          //     .post(mainUrl, body: {'hotel_id': 38.toString()});
                          // print('Response status: ${response.statusCode}');
                          // print('Response body: ${response.body}');
                          Get.to(
                            FlightDetailPage(
                              from: item[index %
                                      controller
                                          .modal.value.featuredFlights!.length]
                                  .from,
                              to: item[index %
                                      controller
                                          .modal.value.featuredFlights!.length]
                                  .to,
                            ),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: PColor.mainColor,
                              width: Get.size.width * 0.4,
                              height: Get.size.height,
                              child: Image.network(
                                item[index %
                                            controller.modal.value
                                                .featuredFlights!.length]
                                        .thumbnail ??
                                    "value")),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      item[index %
                                                  controller.modal.value
                                                      .featuredFlights!.length]
                                              .title ??
                                          'title not show ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),

                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                    "-------------------",style: TextStyle(letterSpacing: 3,color: Colors.grey.shade400),
                                    ), SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      width: Get.size.width * 0.45,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            // item[index %
                                            //             controller
                                            //                 .modal
                                            //                 .value
                                            //                 .featuredFlights!
                                            //                 .length]
                                            //         .from ??
                                            fromResult,
                                            style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87,
                                            fontSize: 13),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 15,
                                            color: Colors.grey.shade600,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Text(
                                            toResult,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                                fontSize: 13),))])),
                                    SizedBox(
                                      height: Get.size.height * 0.013,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: 'From'.tr,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                      TextSpan(text: '    '),
                                      TextSpan(
                                          text: "USD",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 16.5)),
                                      TextSpan(text: '  '),
                                      TextSpan(
                                          text: item[index %
                                                  controller.modal.value
                                                      .featuredFlights!.length]
                                              .price
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.5,
                                              color: Colors.black)),]))])))]));
                    }
                  );
                }

              )
         */
              )),
      SizedBox(
        height: 20,
      ),
      // GetBuilder<HomeController>(builder: (controller) {
      //   if (controller.isLoading.value) {
      //     return Center(
      //         child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 15),
      //       child: const Text(''),
      //     ));
      //   }
      //   return Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         for (var i = 0;
      //             i < controller.modal.value.featuredFlights!.length;
      //             i++)
      //           biuldIndicator(currentIndex == i),]));
      // }

      // )
    ]);
  }

  Widget biuldIndicator(bool isSelected) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Container(
          height: isSelected ? 15 : 12,
          width: isSelected ? 15 : 12,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: isSelected ? 0 : 2,
                  color:
                      isSelected ? Colors.grey : Colors.grey.withOpacity(0.35)),
              color: isSelected
                  ? Colors.black
                  : PColor.mainColor.withOpacity(0.1)),
        ));
  }
}
