import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/mobules/hotelPage/hotelView/featureHotelDetail/featureHotelDetail.dart';
import 'package:phptravelapp/app/mobules/tourPage/tourView/searchTourDistination.dart';
import 'package:phptravelapp/app/mobules/tourPage/tourView/tourDetailPage.dart';
import 'package:phptravelapp/phptravele_all_module/services/api_client/main_apiClient.dart';
import 'package:phptravelapp/reusableText/commonText.dart';
import 'package:phptravelapp/reusableText/dimensions.dart';
import 'package:phptravelapp/testingPage/TravleHomePageTester.dart';

class FeatureTourAllDataList extends StatefulWidget {
  @override
  State<FeatureTourAllDataList> createState() => _FeatureTourAllDataListState();
}

class _FeatureTourAllDataListState extends State<FeatureTourAllDataList> {
  // final controller = Get.find<HomeController>();
  int currentIndex = 0;
  final PageController pageController = PageController();
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: Dimensions.containerHeight65,
          surfaceTintColor: PColor.mainColor.withOpacity(0.6),
          backgroundColor: PColor.mainColor.withOpacity(0.1),
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.only(top: Dimensions.paddingLeft10),
            child: Image.network(
              imgurl,
              width: Dimensions.containerHeight65 * 2,
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.padding8,
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
                          offset:
                              Offset(3, 3), // shadow direction: bottom right
                        ),
                      ],
                    ),
                    // width: Get.size.width,
                    // height: Get.size.height ,
                    child: FutureBuilder<HomeOfferListModelClass>(
                      future: HomeOffListApiProvider().mainEndPointGetData(),
                      builder: (context, snapshot) {
                        final item = snapshot.data?.featuredTours;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData) {
                          return Text('No Data Exit');
                        }
                        return Expanded(
                          child: Container(
                            // height: Dimensions.height300,
                            // width: Get.size.width*0.4,
                            child: GridView.builder(
                              // scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      // maxCrossAxisExtent: Dimensions.height300,
                                      childAspectRatio: 2 / 3.2,
                                      crossAxisSpacing: Dimensions.textsize15,
                                      mainAxisSpacing: Dimensions.textsize15),
                              shrinkWrap: true,
                              physics: AlwaysScrollableScrollPhysics(),
                              // itemCount: snapshot.data?.featuredHotels?.length,
                              itemCount: snapshot.data?.featuredTours?.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    // int a = int.parse(item![index].id.toString());

                                    Get.to(
                                      TourDetailPage(
                                        thumbnail: item![index].thumbnail,
                                        title: item[index].title,
                                        price: item[index].price,
                                        starsCount: item[index].starsCount,
                                        tourType: item[index].tourType,
                                        location: item[index].location,
                                        desc: item[index].desc,

                                        // currCode: item[index].currCode,
                                      ),
                                    );
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
                                    alignment: Alignment.topLeft,
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
                                      Positioned(
                                        left: -Dimensions.fontSize20,
                                        right: 0,
                                        top: -Dimensions.fontSize20,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                Dimensions.fontSize25),
                                            child: Container(
                                              width: Dimensions.height90,
                                              height: Dimensions.height30,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.height4),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                item![index %
                                                            snapshot
                                                                .data!
                                                                .featuredTours!
                                                                .length]
                                                        .location ??
                                                    "",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimensions.height6,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.padding8),
                                      child: RatingBarIndicator(
                                        // rating: 3.3,
                                        rating: double.parse(
                                            item[index].starsCount ?? ""),
                                        itemBuilder: (context, index) =>
                                            const Icon(Icons.star,
                                                color: Colors.red),
                                        itemCount: 5,

                                        itemSize: Dimensions.fontSize17and5,
                                        direction: Axis.horizontal,
                                      ),
                                    ),
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
                                                title: item[index].title ?? "",
                                                fontWeight: FontWeight.w700,
                                                size: Dimensions.fontSize16,
                                              )),

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
                                                text: 'Price  ',
                                                style: TextStyle(
                                                    color:
                                                        PColor.headingTextColor,
                                                    fontSize:
                                                        Dimensions.fontSize16)),
                                            TextSpan(
                                                text: 'USD',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Dimensions.fontSize16)),
                                            const TextSpan(text: '  '),
                                            TextSpan(
                                                text: item[index]
                                                    .price
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize:
                                                        Dimensions.fontSize17,
                                                    fontWeight: FontWeight.bold,
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
                                                    fontSize:
                                                        Dimensions.fontSize12),
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
                          ),
                        );
                      },
                    )),
              ),
            ),

            /* Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(left: 25, bottom: 35),
                width: Get.size.width * 0.12,
                height: Get.size.height * 0.12,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: PColor.mainColor.withOpacity(0.9)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        pageController.jumpToPage(currentIndex - 1);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                )),
            Container(
                margin: EdgeInsets.only(right: 25, bottom: 35),
                width: Get.size.width * 0.12,
                height: Get.size.height * 0.12,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: PColor.mainColor.withOpacity(0.9)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        pageController.jumpToPage(currentIndex + 1);
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                )),
          ],
        )*/
          ],
        ));
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
            color:
                isSelected ? Colors.black : PColor.mainColor.withOpacity(0.1)),
      ),
    );
  }
}
