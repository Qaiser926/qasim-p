import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/services/controller/tourDetailController.dart';
import 'package:phptravelapp/app/mobules/services/data/api/tourDetail_apiClient.dart';
import 'package:phptravelapp/app/mobules/services/model/tourDetailModelclass.dart';
import 'package:phptravelapp/reusableText/commonText.dart';
import 'package:phptravelapp/reusableText/dimensions.dart';
import 'package:http/http.dart' as http;
import 'package:phptravelapp/reusableText/iconText.dart';

class TourDetailPage extends StatefulWidget {
  String? thumbnail;
  String? title;
  String? starsCount;
  String? tourType;
  int? price;
  String? location;
  String? desc;
  // String? policy;
  // String? currCode;
  TourDetailPage({this.thumbnail,this.title,this.price,this.starsCount,this.tourType,this.location,this.desc});

  @override
  State<TourDetailPage> createState() => _TourDetailPageState();
}

class _TourDetailPageState extends State<TourDetailPage> with SingleTickerProviderStateMixin{
  TabController? tabController;
int currentIndex = 0;
  bool isShowAllImage=false;
  int index=0;
final PageController pageController = PageController();
  void _tabListener(){

    setState((){
index=tabController!.index;
    });
  }

  @override
  initState(){
    super.initState();
    tabController=TabController(length: 4, vsync: this);
    tabController!.addListener(_tabListener);
  }

  @override
  void dispose(){
    tabController!.removeListener(_tabListener);
    tabController!.dispose();
    super.dispose();
  }

  Future<TourDetailModelClass> getDate() async {
    var respons;

    try {
      respons = await http.post(
          Uri.parse(
              'https://phptravels.net/api/api/tour/detail?appKey=phptravels'),
          body: {"tour_id": 36.toString(), "currency": "USD","supplier":1.toString()}
        // headers: headers,
      );
      // print('hello ');
      // print(respons.body);
      if (respons.statusCode == 200) {
        var parsed = jsonDecode(respons.body.toString());
        filterData = TourDetailModelClass.fromJson(parsed);
        print(filterData);

        print(filterData.name.toString());
        return filterData;
      }
// return filterData;

    } catch (e) {
      log("error occurs hahahahhahah : $e");
    }

    return TourDetailModelClass();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(

                  pinned: false,
                  elevation: 0.0,
                  surfaceTintColor: Colors.white,
                  backgroundColor: Colors.white,
                  expandedHeight: 270,
                  flexibleSpace: FlexibleSpaceBar(

                    // title: commonText(title: widget.title.toString(),Textcolor: Colors.black),
                    background:

                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                                width: double.infinity,
                                child:
                                    Image.network(widget.thumbnail.toString(),fit: BoxFit.cover),
                                  ),
                            Container(
                              margin: EdgeInsets.only(bottom:  Dimensions.paddingSymentic8*3,left:  Dimensions.padding8*2),
                              height:  Dimensions.fontSize25*2,
                              width: Dimensions.width160,
                              child: MaterialButton(
                                color: Colors.white,

                                  onPressed: (){
                                  setState((){
                                    isShowAllImage=!isShowAllImage;
                                  });
                                  }, child: Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(right: Dimensions.sizedbox5),
                                    child: Icon(Icons.image,size: 18,),
                                  ),
                                  commonText(title: 'More Photos',),
                                ],
                              )),
                            ),
                          ],
                        ),


                  ),
                ),

                SliverAppBar(
                  automaticallyImplyLeading: false,
                  surfaceTintColor: Colors.white,
                  pinned: true,
                  primary: false,
                  elevation: 8,
                  backgroundColor: Colors.transparent,
                  title: Align(
                    alignment: AlignmentDirectional.center,
                    child: TabBar(
                      controller: tabController,
                      indicatorColor: Colors.blueAccent,
                      // indicatorSize:TabBarIndicatorSize.label,
                      indicatorWeight: 3.5,
                      padding: EdgeInsets.only(top: 15,bottom: 15),
                      isScrollable: true,
                      tabs: [
                       commonText(title: 'Tour Detail',Textcolor: Colors.black,),
                       commonText(title: 'Inclusions',Textcolor: Colors.black,),
                       commonText(title: 'Policy',Textcolor: Colors.black,),
                       commonText(title: 'Map',Textcolor: Colors.black,),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(

                  child: SizedBox(
                    height: Get.size.height,
                    child: Padding(
                      padding: EdgeInsets.all(Dimensions.sizedboxWidth20),
                      child: Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            _tourDetail(),
                            Text('asdf 2'),
                            Text('asdf 3'),
                            Text('asdf 4'),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Visibility(
                visible: isShowAllImage,
                child:Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                        children: [
                          Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState((){
                                    isShowAllImage=false;
                                  });
                                },
                                child: Container(
                                    color: Colors.black.withOpacity(0.8),
                                    // child: FutureBuilder<FlightDetailModelClass>(
                                    //   future: FlightDetailApiClientProvider().getDate(),
                                    //   builder: (context,snapshot){
                                    //     return ListView.builder(
                                    //
                                    //       itemCount: snapshot.data?.img?.length,
                                    //       itemBuilder: (context,index){
                                    //         return Row(
                                    //           children: [
                                    //             for (var i = 0;
                                    //             i < ?.img?.length;
                                    //             i++)
                                    //               biuldIndicator(currentIndex == i),
                                    //             Container(),
                                    //           ],
                                    //         );
                                    //       },
                                    //     );
                                    //   },
                                    // )
                                    child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(),
                                          InkWell(
                                              onTap: (){
                                                setState((){
                                                  isShowAllImage=true;
                                                });
                                              },
                                              child: Container(
                                                  color: Colors.black,
                                                  child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:  EdgeInsets.symmetric(horizontal:  Dimensions.paddingSymentic8),
                                                          child: InkWell(
                                                              onTap: () {

                                                              },
                                                              child: Icon(Icons.share_rounded,color: Colors.white)),
                                                        ),
                                                        Padding(
                                                          padding:  EdgeInsets.symmetric(horizontal:  Dimensions.paddingSymentic8),
                                                          child: Icon(Icons.play_arrow,color: Colors.white,),
                                                        ),
                                                        Padding(
                                                          padding:  EdgeInsets.symmetric(horizontal:  Dimensions.paddingSymentic8),
                                                          child: InkWell(
                                                              onTap: (){
                                                                setState((){

                                                                });
                                                              },
                                                              child: Icon(Icons.fullscreen,color: Colors.white,)),
                                                        ),
                                                        Padding(
                                                          padding:  EdgeInsets.symmetric(horizontal:  Dimensions.paddingSymentic8,vertical:  Dimensions.paddingvertical5),
                                                          child: Icon(Icons.download,color: Colors.white,),
                                                        ),
                                                        Padding(
                                                            padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSymentic8),
                                                            child: InkWell(
                                                                onTap: (){
                                                                  setState((){
                                                                    isShowAllImage=false;
                                                                  });
                                                                },
                                                                child: Icon(Icons.clear,color: Colors.white,)))])))
                                        ]
                                    )),
                              )),
                        Expanded(
                         child:Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                          decoration: BoxDecoration(
                          // color: Colors.black,
                          border: Border.all(color: Colors.grey.shade200, width: 0.7),
                          borderRadius: BorderRadius.circular(8.0),
                    // color: Colors.grey.shade200.withOpacity(0.99),
                    boxShadow: [
                      BoxShadow(
                        // color: Colors.transparent,
                        blurRadius: 0,
                        spreadRadius: 0.0,
                        offset: Offset(0, 0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  width: Get.size.width,
                  height: Get.size.height * 0.4,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context,index){
                      return Container(
                        color: index.isEven?Colors.black:Colors.deepPurple,
                      );
                    },
                  )
                  ),
                  // child:
                  // GetBuilder<TourDetailController>(
                  //   builder: (controller) {
                  //     return PageView.builder(
                  //       controller: pageController,
                  //       onPageChanged: (index) {
                  //         setState(() {
                  //           currentIndex = index %
                  //               controller.modal.value.img!.length;
                  //         });
                  //       },
                  //       // itemCount:controller.modal.value.featuredFlights!.length ,
                  //       itemBuilder: (context, index) {
                  //         if (controller.isLoading.value) {
                  //           return Center(
                  //               child: const CircularProgressIndicator());
                  //         }
                  //         if (controller.isEmptyData.value) {
                  //           return Center(
                  //               child: Text("nodatafoundtext".tr));
                  //         }
                  //         final item = controller.modal.value;
                  //
                  //         return Stack(
                  //           alignment: Alignment.center,
                  //           children: [
                  //             ClipRRect(
                  //               borderRadius: BorderRadius.circular(5),
                  //               child: Container(
                  //                 width: Get.size.width,
                  //                 height: Get.size.height * 0.395,
                  //                 child: Image.network(
                  //                   controller.modal.value.img?[index].toString()??"image",
                  //                   fit: BoxFit.cover,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //     );
                  //   },
                  // )
                  //
              // ),
            ),

                        ),
                      
                          Expanded(
                              child:InkWell(
                                  onTap: (){
                                    setState((){
                                      isShowAllImage=false;
                                    });
                                  },
                                  child: Container(
                                    color: Colors.black.withOpacity(0.8),)))]))),
          ],
        )
      ),
    );
  }
  
  Widget _tourDetail(){
    return Container(
      height: Get.size.height,
      child: Column(
        children: [
          SizedBox(height: Dimensions.padding8,),
          Align(
            alignment:Alignment.topLeft,
            child: commonText(title: widget.title.toString(),
              size: Dimensions.fontSize25,fontWeight: FontWeight.w600,),
          ),
          SizedBox(height: Dimensions.paddingLeft10,),
          Align(
              alignment: Alignment.topLeft,
              child: commonText(title: widget.location.toString())),
          SizedBox(height: Dimensions.paddingLeft10,),
          Align(
            alignment: Alignment.topLeft,
            child:  RatingBarIndicator(
              // rating: 3.3,
              rating: double.parse(widget.starsCount.toString()),
              itemBuilder: (context, index) =>
                  Icon(Icons.star,
                      color: PColor.starColor),
              itemCount: 5,
              itemSize: Dimensions.fontSize22,
              direction: Axis.horizontal,
            ),
          ),
          SizedBox(height: Dimensions.paddingLeft10,),
          Align(
            alignment: Alignment.topLeft,
            child: IconTextSubText(
              title: "Tour Type",backgroundColor: PColor.mainTextColor,
              subText:  widget.tourType.toString(),
              subTextSize: Dimensions.textsize15,
              fontWeight: FontWeight.w500,

              textSize: Dimensions.fontSize20,
              icon: Icons.public, iconSize: Dimensions.textsize15*2,

            ),
          ),Align(
            alignment: Alignment.topLeft,
            child: IconTextSubText(
              title: "Date",backgroundColor: PColor.mainTextColor,
              subText:  'Sun 02 10 2022',textSize: Dimensions.fontSize20,
              subTextSize: Dimensions.textsize15,
              fontWeight: FontWeight.w500,
              icon: Icons.calendar_month_outlined, iconSize: Dimensions.textsize15*2,
            ),
          ),Align(
            alignment: Alignment.topLeft,
            child: IconTextSubText(
              title: "Rating",backgroundColor: PColor.mainTextColor,
              subText: "${ widget.starsCount} / 5",
              subTextSize: Dimensions.textsize15,
              fontWeight: FontWeight.w500,textSize: Dimensions.fontSize20,
              icon: Icons.rate_review_rounded,
              iconSize: Dimensions.textsize15*2,
            ),
          ),Align(
            alignment: Alignment.topLeft,
            child: IconTextSubText(
              title: "Extra People",backgroundColor: PColor.mainTextColor,
              subText: "${widget.price}",textSize: Dimensions.fontSize20,
              subTextSize: Dimensions.textsize15,
              fontWeight: FontWeight.w500, iconSize: Dimensions.textsize15*2,
              icon: Icons.public,
            ),
          ),
          SizedBox(
            height: Dimensions.paddingLeft10*2,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: commonText(title: 'Description',fontWeight: FontWeight.w600,size: Dimensions.fontSize12*2)),
          SizedBox(
            height: Dimensions.paddingLeft10*2,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: commonText(title: widget.desc.toString(),),
          )


        ],
      ),
    );
  }

}
