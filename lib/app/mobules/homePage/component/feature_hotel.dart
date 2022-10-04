// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:phptravelapp/app/colors.dart';
// import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
// import 'package:phptravelapp/app/mobules/hotelPage/hotelView/featureHotelDetail/featureHotelDetail.dart';
// import 'package:phptravelapp/reusableText/dimensions.dart';
//
// class FeatureHotel extends StatefulWidget {
//   @override
//   State<FeatureHotel> createState() => _FeatureHotelState();
// }
//
// class _FeatureHotelState extends State<FeatureHotel> {
//   final controller = Get.find<HomeController>();
//   int currentIndex = 0;
//   final PageController pageController = PageController();
//   double height = 0;
//   double width = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Column(
//           children: [
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingLeft10),
//               child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.grey.shade200, width: 0.7),
//                     borderRadius: BorderRadius.circular(8.0),
//                     // color: Colors.grey.shade200.withOpacity(0.99),
//
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.transparent,
//                         blurRadius: 0,
//                         spreadRadius: 0.0,
//                         offset: Offset(0, 0), // shadow direction: bottom right
//                       )
//                     ],
//                   ),
//                   width: Get.size.width,
//                   height: Get.size.height * 0.413,
//                   child: GetBuilder<HomeController>(
//                     builder: (controller) {
//                       return
//                         PageView.builder(
//                         controller: pageController,
//                         onPageChanged: (index) {
//                           setState(() {
//                             currentIndex = index %
//                                 controller.modal.value.featuredHotels!.length;
//                           });
//                         },
//                         // itemCount:controller.modal.value.featuredFlights.length ,
//                         itemBuilder: (context, index) {
//                           if (controller.isLoading.value) {
//                             return const Center(
//                                 child: const CircularProgressIndicator());
//                           }
//                           if (controller.isEmptyData.value) {
//                             return Center(
//                                 child: InkWell(
//                               onTap: () {},
//                               child: Text("nodatafoundtext".tr),
//                             ));
//                           }
//                           final item = controller.modal.value.featuredHotels;
//
//                           return GestureDetector(
//                             onTap: () {
//                               // int a = int.parse(item![index].id.toString());
//
//                               Get.to(FeatureHotelDetailPage(
//                                 // id: a,
//                                 title: item![index %
//                                         controller
//                                             .modal.value.featuredHotels!.length]
//                                     .title,
//                                 des: item[index %
//                                         controller
//                                             .modal.value.featuredHotels!.length]
//                                     .desc,
//                                 location: item[index %
//                                         controller
//                                             .modal.value.featuredHotels!.length]
//                                     .location,
//                                 review: item[index %
//                                         controller
//                                             .modal.value.featuredHotels!.length]
//                                     .avgReviews
//                                     ?.totalReviews,
//                                 //   icon: item[index %
//                                 //           controller
//                                 //               .modal.value.featuredHotels!.length]
//                                 //       .toString(),
//                                 //   name: item[index %
//                                 //           controller
//                                 //               .modal.value.featuredHotels!.length]
//                                 //       .toString(),
//                                 //   // pic=item[index].thumbnail![index],
//                                 discoun: int.parse(item[index %
//                                         controller
//                                             .modal.value.featuredHotels!.length]
//                                     .discount
//                                     .toString()),
//                                         lat: double.parse(item[index %
//                                         controller
//                                             .modal.value.featuredHotels!.length]
//                                     .latitude
//                                     .toString()),
//                                 lang: double.parse(item[index %
//                                         controller
//                                             .modal.value.featuredHotels!.length]
//                                     .longitude
//                                     .toString()),
//                                 //   discoun: int.parse(item[index %
//                                 //     controller
//                                 //         .modal.value.featuredHotels!.length]
//                                 // .discount.toString()
//                                 // ),
//
//                                 pic: item[index %
//                                         controller
//                                             .modal.value.featuredHotels!.length]
//                                     .thumbnail
//                                     .toString(),
//                                 startCount: int.parse(item[index %
//                                         controller
//                                             .modal.value.featuredHotels!.length]
//                                     .starsCount
//                                     .toString()),
//                               ));
//                             },
//                             child: Container(
//                               child: Column(
//                                 children: [
//                                   Stack(
//                                     children: [
//                                       SizedBox(
//                                         width: Get.size.width,
//                                         height: Get.size.height * 0.23,
//                                         child: Image.network(
//                                           item?[index %
//                                                       controller
//                                                           .modal
//                                                           .value
//                                                           .featuredHotels!
//                                                           .length]
//                                                   .thumbnail ??
//                                               "value",
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Padding(
//                                     padding:  EdgeInsets.only(
//                                         left: Dimensions.paddingLeft10, right: Dimensions.paddingLeft10, top: Dimensions.paddingLeft10),
//                                     child: Container(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Text(
//                                                 item?[index %
//                                                             controller
//                                                                 .modal
//                                                                 .value
//                                                                 .featuredHotels!
//                                                                 .length]
//                                                         .title ??
//                                                     "title",
//                                                 style: const TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.w700),
//                                               )),
//
//                                           Text(
//                                             item?[index %
//                                                         controller
//                                                             .modal
//                                                             .value
//                                                             .featuredHotels!
//                                                             .length]
//                                                     .location ??
//                                                 "location",
//                                             style: const TextStyle(),
//                                           ),
//                                           const SizedBox(
//                                             height: 8,
//                                           ),
//
//                                           RatingBarIndicator(
//                                             // rating: 3.3,
//                                             rating: double.parse(item?[index %
//                                                         controller
//                                                             .modal
//                                                             .value
//                                                             .featuredHotels!
//                                                             .length]
//                                                     .avgReviews!
//                                                     .totalReviews ??
//                                                 "totalReview"),
//                                             itemBuilder: (context, index) =>
//                                                 const Icon(Icons.star,
//                                                     color: Colors.red),
//                                             itemCount: 5,
//
//                                             itemSize: Dimensions.fontSize17and5,
//                                             direction: Axis.horizontal,
//                                           ),
//
//                                           const SizedBox(
//                                             width: 6,
//                                           ),
//                                           // Text("${item[index%controller.modal.value.featuredHotels!.length].stars.toString()} Reviews"),
//
//                                            SizedBox(
//                                             height: Dimensions.paddingLeft10,
//                                           ),
//                                           RichText(
//                                               text: TextSpan(children: [
//                                              TextSpan(
//                                                 text: 'USD',
//                                                 style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: Dimensions.fontSize16)),
//                                             const TextSpan(text: '  '),
//                                             TextSpan(
//                                                 text: item![index %
//                                                         controller
//                                                             .modal
//                                                             .value
//                                                             .featuredHotels!
//                                                             .length]
//                                                     .price
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                     fontSize: Dimensions.fontSize17,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.black)),
//                                           ])),
//                                           SizedBox(
//                                             height: Get.size.height * 0.01,
//                                           ),
//                                           Row(
//                                             children: [
//                                               Text(
//                                                 'featurehotelDetailText'.tr,
//                                                 style: TextStyle(fontSize: Dimensions.fontSize12),
//                                               ),
//                                               const SizedBox(
//                                                 width: 6,
//                                               ),
//                                                Icon(
//                                                 Icons.arrow_forward_ios,
//                                                 size: Dimensions.iconSize12,
//                                               )
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   )),
//             ),
//              SizedBox(
//               height: Dimensions.sizedboxWidth20,
//             ),
//             // GetBuilder<HomeController>(builder: (controller) {
//             //   final listOfData=controller.modal.value.featuredHotels;
//             //   if (controller.isLoading.value) {
//             //     return Center(
//             //         child: Padding(
//             //       padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingvertical5),
//             //       child: const Text(''),
//             //     ));
//             //   }
//             //   return Padding(
//             //     padding:  EdgeInsets.all(Dimensions.paddingLeft10),
//             //     child: Row(
//             //       mainAxisAlignment: MainAxisAlignment.center,
//             //       children: [
//             //         for (var i = 0;
//             //             i < controller.modal.value.featuredHotels!.length;
//             //             i++)
//             //           biuldIndicator(currentIndex == i)
//             //       ],
//             //     ),
//             //   );
//             // })
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget biuldIndicator(bool isSelected) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 2),
//       child: Container(
//         height: isSelected ? 15 : 12,
//         width: isSelected ? 15 : 12,
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(
//                 width: isSelected ? 0 : 2,
//                 color:
//                     isSelected ? Colors.grey : Colors.grey.withOpacity(0.35)),
//             color:
//                 isSelected ? Colors.black : PColor.mainColor.withOpacity(0.1)),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/phptravele_all_module/services/api_client/main_apiClient.dart';
import 'package:phptravelapp/reusableText/commonText.dart';
import 'package:phptravelapp/reusableText/dimensions.dart';

import '../../hotelPage/hotelView/featureHotelDetail/featureHotelDetail.dart';

class FeatureHotel extends StatefulWidget {
  const FeatureHotel({Key? key}) : super(key: key);

  @override
  State<FeatureHotel> createState() => _FeatureHotelState();
}

class _FeatureHotelState extends State<FeatureHotel> {
  // final controller = Get.find<HomeController>();
  int currentIndex = 0;
  final PageController pageController = PageController();
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingLeft10,
                vertical: Dimensions.padding8),
            child: Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    // border: Border.all(color: Colors.grey.shade200, width: 0.7),
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
                  // width: Get.size.width,
                  // height: Get.size.height ,
                  child: FutureBuilder<HomeOfferListModelClass>(
                    future: HomeOffListApiProvider().mainEndPointGetData(),
                    builder: (context, snapshot) {
                      final item = snapshot.data?.featuredHotels;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData) {
                        return Text('No Data Exit');
                      }
                      return Container(
                        height: Dimensions.height300,
                        // width: Get.size.width*0.4,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  // childAspectRatio: 2/3.2,
                                  // crossAxisCount: 2,
                                  // crossAxisSpacing: Dimensions.border13,
                                  // mainAxisSpacing: Dimensions.border13,
                                  maxCrossAxisExtent: Dimensions.height300,
                                  childAspectRatio: 4 / 2.4,
                                  crossAxisSpacing: Dimensions.textsize15,
                                  mainAxisSpacing: Dimensions.textsize15),
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          // itemCount: snapshot.data?.featuredHotels?.length,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
// int a = int.parse(item![index].id.toString());

                                Get.to(FeatureHotelDetailPage(
// id: a,
                                  title: item![index
                                          // %
                                          // controller
                                          //     .modal.value.featuredHotels!.length
                                          ]
                                      .title,
                                  des: item[index
                                          // %
                                          //   controller
                                          //       .modal.value.featuredHotels!.length
                                          ]
                                      .desc,
                                  location: item[index].location,
                                  review: item[index].starsCount.toString(),
//   icon: item[index %
//           controller
//               .modal.value.featuredHotels!.length]
//       .toString(),
//   name: item[index %
//           controller
//               .modal.value.featuredHotels!.length]
//       .toString(),
//   // pic=item[index].thumbnail![index],
                                  discoun: int.parse(
                                      item[index].discount.toString()),
                                  lat: double.parse(
                                      item[index].latitude.toString()),
                                  lang: double.parse(
                                      item[index].longitude.toString()),
//   discoun: int.parse(item[index %
//     controller
//         .modal.value.featuredHotels!.length]
// .discount.toString()
// ),

                                  pic: item[index].thumbnail.toString(),
                                  startCount: int.parse(
                                      item[index].starsCount.toString()),
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
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
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          width: Get.size.width,
                                          height: Dimensions.height135,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.height4),
                                            child: Image.network(
                                              item?[index].thumbnail ?? "",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.paddingLeft10,
                                          right: Dimensions.paddingLeft10,
                                          top: Dimensions.paddingLeft10),
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: commonText(
                                                  title:
                                                      item?[index].title ?? "",
                                                  fontWeight: FontWeight.w700,
                                                  size: Dimensions.fontSize16,
                                                )),

                                            commonText(
                                              title:
                                                  item?[index].location ?? "",
                                              size: Dimensions.fontSize14,
                                            ),
                                            SizedBox(
                                              height: Dimensions.padding8,
                                            ),

                                            RatingBarIndicator(
// rating: 3.3,
                                              rating: double.parse(
                                                  item?[index].starsCount ??
                                                      ""),
                                              itemBuilder: (context, index) =>
                                                  const Icon(Icons.star,
                                                      color: Colors.red),
                                              itemCount: 5,

                                              itemSize:
                                                  Dimensions.fontSize17and5,
                                              direction: Axis.horizontal,
                                            ),

                                            SizedBox(
                                              width: Dimensions.height6,
                                            ),
// Text("${item[index%controller.modal.value.featuredHotels!.length].stars.toString()} Reviews"),

                                            SizedBox(
                                              height: Dimensions.paddingLeft10,
                                            ),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  text: 'USD',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Dimensions
                                                          .fontSize16)),
                                              const TextSpan(text: '  '),
                                              TextSpan(
                                                  text: item![index]
                                                      .price
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          Dimensions.fontSize17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                            ])),
                                            SizedBox(
                                              height: Dimensions.height2,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '',
                                                  style: TextStyle(
                                                      fontSize: Dimensions
                                                          .fontSize12),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.height6,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )),
            ),
          ),
       
        ],
      ),
    
    );
  }
}
