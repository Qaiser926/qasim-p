import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/mobules/services/controller/hotelDetail_controller.dart';
import 'package:phptravelapp/app/mobules/services/data/api/hotelDetail_ApiClient.dart';
import 'package:phptravelapp/app/mobules/services/model/HotelDetailModelCalass.dart';
import 'package:phptravelapp/app/mobules/services/model/HotelDetail_ModelClass.dart';
import 'package:http/http.dart' as http;
import 'package:phptravelapp/reusableText/commonText.dart';
import 'package:phptravelapp/reusableText/dimensions.dart';
import 'package:phptravelapp/reusableText/iconText.dart';
import 'package:phptravelapp/reusableText/reusable_commonText.dart';
import 'package:progress_indicators/progress_indicators.dart';



class FeatureHotelDetailPage extends StatefulWidget {
  // String? title;
  // String? des;
  // String? pic;
  String? review;
  int? discoun;
  String? location;
  String? title;
  String? des;
  String? pic;
  int? startCount;
  String? icon;
  String? name;
  int? id;
  double? lat;
  double? lang;
  FeatureHotelDetailPage({
    this.title,
    this.des,
    // this.pic,
    this.review,
    this.discoun,
    this.location,
    this.pic,
    this.startCount,
    this.icon,
    this.name,
    this.id,
    this.lat,
    this.lang,
  });

  @override
  State<FeatureHotelDetailPage> createState() => _FeatureHotelDetailPageState();
}

class _FeatureHotelDetailPageState extends State<FeatureHotelDetailPage>
    with TickerProviderStateMixin {

  bool isRead = false;
  late String firstHalf;
  late String secondHalf;
  bool flag = true;
  final data = HotelDetailApiClientProvider().getDate();
  int currentIndex = 0;

  // zoomed image with double tab. now i created controller
  late TransformationController transformationcontroller;

  TapDownDetails? tapDownDetails;
  late AnimationController animationController;
  Animation<Matrix4>? animation;
  @override
  void initState() {
    data;
    // TODO: implement initState
    super.initState();
    if (widget.des!.length > 150) {
      firstHalf = widget.des!.substring(0, 150);
      secondHalf = widget.des!.substring(151, widget.des!.length);
    } else {
      firstHalf = widget.des.toString();
      secondHalf = '';
    }
    /// initialize controller
    transformationcontroller=TransformationController();
    animationController=AnimationController(
        vsync: this,duration: Duration(milliseconds: 300),)..addListener(() {
          transformationcontroller.value=animation!.value;
    });
  }

  @override
  void dispose(){
    transformationcontroller.dispose();
    animationController.dispose();
    super.dispose();
  }

  // _save() async {
  //   var response = await Dio().get(
  //       "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
  //       options: Options(responseType: ResponseType.bytes));
  //   final result = await ImageGallerySaver.saveImage(
  //       Uint8List.fromList(response.data),
  //       quality: 60,
  //       name: "hello");
  //   print(result);
  // }
  bool isVisible=false;
  HotelDetailController hotelDetailcontroller = HotelDetailController();
   MapType _currentMaptype= MapType.normal;
  bool isSelect=false;
  bool isfullScreen=false;

  final datalist = HotelDetailApiClientProvider();

  final PageController pageController = PageController();


  @override
  Widget build(BuildContext context) {
    TabController tabController=TabController(length: 5,vsync: this);

    return DefaultTabController(

      length: 5,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,

          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: Dimensions.appBarHeight60,
                    child:Row(
                      children: [
                        SizedBox(width: Dimensions.sizedboxWidth6,),
                        IconButton(onPressed: (){
                          Get.back();
                        }, icon: Icon(Icons.arrow_back_ios)),
                        SizedBox(width:Dimensions.sizedboxWidth20),
                        commonText(title: 'Hotel Detail'),
                      ],
                    )
                  ),
                  Container(
                    child: TabBar(
                      // indicator: true,
                    controller: tabController,
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      tabs: [
                        Tab(
                          child: commonText(title: 'Hotels Details',),
                        ),
                        Tab(
                          child: commonText(title: 'Rooms',),
                        ),
                        Tab(
                          child:commonText(title: 'Amenities'),
                        ),
                        Tab(
                          child: commonText(title: 'Policy'),
                        ),
                        Tab(
                          child: commonText(title: 'Map'),
                        ),
                      ],
                    ),

                  ),
                  Expanded(child: TabBarView(
                      controller: tabController,
                      children: [
                        HotelDetailTab(),
                          RoomDetailTab(),
                          Amenities(),
                          policy(),
                          map(),
                          // Text('map adsf')
                  ]))
                ],
              ),
              Visibility(
                  visible: isVisible,
                  child:Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        Expanded(

                          child: InkWell(
                            onTap: (){
                              setState((){
                                isVisible=false;
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
                                        isVisible=true;
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
                                                    isfullScreen=true;
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
                                                   isVisible=false;
                                                 });
                                                },
                                                child: Icon(Icons.clear,color: Colors.white,)))])))
                                ]
                              )),



                          )),
                        Expanded(
                         /*   child:Container(
                              color:Colors.black,
                            child: FutureBuilder<HotelDetailModelCalass>(
                                future: HotelDetailApiClientProvider().getDate(),
                                builder: (context, snapshot) {
                                  // final data =
                                  // FlightDetailApiClientProvider().getFlightDetailData();
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Center(child: JumpingText('Loading...'));
                                  }
                                  final imagelist = snapshot.data?.img;
                                  if (imagelist == null)
                                    return Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(child: JumpingText('Loading...')),
                                        ));
                                  if (!snapshot.hasData) {
                                    return Center(child: Text('No Data Exit'));
                                  }
                                  return Container(
                                      width: double.infinity,
                                      height: Get.size.height * 0.22,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          // itemCount: roomList.length,
                                          itemCount: imagelist.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                width: double.infinity,
                                                height: Get.size.height * 0.22,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: Image.network(
                                                    imagelist[index].toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ));}));}),
                            )
                       */
                          child:      Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.grey.shade200, width: 0),
                                          borderRadius: BorderRadius.circular(8.0),
                                          // color: Colors.grey.shade200.withOpacity(0.99),

                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.transparent,
                                              blurRadius: 0,
                                              spreadRadius: 0.0,
                                              offset: Offset(0, 0), // shadow direction: bottom right
                                            )
                                          ],
                                        ),
                                        width: Get.size.width,
                                        height: Get.size.height * 0.32,
                                        child:
                                       GetBuilder<HomeController>(
                                          builder: (controller) {
                                            return PageView.builder(
                                              controller: pageController,
                                              onPageChanged: (index) {
                                                setState(() {
                                                  currentIndex = index %
                                                      controller.modal.value.featuredHotels!.length;
                                                });
                                              },
                                              // itemCount:controller.modal.value.featuredFlights!.length ,
                                              itemBuilder: (context, index) {
                                                if (controller.isLoading.value) {
                                                  return Center(
                                                      child: const CircularProgressIndicator());
                                                }
                                                if (controller.isEmptyData.value) {
                                                  return Center(
                                                      child: InkWell(
                                                        onTap: () {},
                                                        child: Text("nodatafoundtext".tr),
                                                      ));
                                                }
                                                final item = controller.modal.value.featuredHotels;

                                                return Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    // we use interativeviewer widget to zoomin and zoomout
                                                 GestureDetector(
                                                   onDoubleTapDown:(details)=>tapDownDetails=details,
                                                   onDoubleTap:(){
                                                     final position=tapDownDetails!.localPosition;
                                                  final double scale=3;
                                                  final x=-position.dx*(scale-1);
                                                  final y=-position.dy*(scale-1);
                                                  final zoomed=Matrix4.identity()
                                                    ..translate(x,y)
                                                    ..scale(scale);
                                                  final end=transformationcontroller.value.isIdentity()?zoomed:Matrix4.identity();

                                                  animation=Matrix4Tween(
                                                    begin: transformationcontroller.value,
                                                    end: end,
                                                  ).animate(CurveTween(curve: Curves.easeIn).animate(animationController));

                                                  animationController.forward(from: 0);
                                                  /// ye controller zoomed value ko calculat kare ga.
                                                  final value=transformationcontroller.value.isIdentity()?zoomed:Matrix4.identity();
                                                  transformationcontroller.value=value;
                                                },
                                                   child: InteractiveViewer(
                                                     transformationController: transformationcontroller,
                                                clipBehavior:Clip.none,
                                                     panEnabled: false,
                                                     scaleEnabled: false,
                                                     child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(0),
                                                            child: Container(
                                                              width: Get.size.width,
                                                              height: Get.size.height * 0.395,
                                                              child: Image.network(
                                                                 item?[index %
                                                                    controller.modal.value
                                                                        .featuredHotels!.length]
                                                                     .thumbnail ??
                                                                     "thumbnail",
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                   ),
                                                 ),
                                                    

                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        )
                                      // FutureBuilder<HotelDetailModelCalass>(
                                      //   future: HotelDetailApiClientProvider().getDate(),
                                      //   builder: (context,snapshot){
                                      //     return ListView.builder(
                                      //       itemCount: snapshot.data?.img?.length,
                                      //       itemBuilder: (context,index){
                                      //         return Image.network(snapshot.data?.img![index].toString()??"image");
                                      //       },
                                      //     );
                                      //   },
                                      // )
                                    ),
                                  ),
                                ],
                              ),
                              Row(
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
                                        padding:  EdgeInsets.all(Dimensions.padding8),
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
                                        padding:  EdgeInsets.all(Dimensions.padding8),
                                        child: IconButton(
                                            onPressed: () {
                                              pageController.jumpToPage(currentIndex + 1);
                                            },
                                            icon: Icon(Icons.arrow_forward_ios_sharp)),
                                      )),
                                ],
                              )

                            ],
                          ),
                        ) ,Expanded(
                            child:InkWell(
                              onTap: (){
                                setState((){
                                  isVisible=false;
                                });
                              },
                              child: Container(
                                color: Colors.black.withOpacity(0.8),)))])))]))));
  }

  Widget HotelDetailTab() {
    // List<String> imgList = filterData.img;

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
              children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 8, top: 10, bottom: 4),
              child: Text(
                widget.title.toString(),
                style: TextStyle(fontSize: Dimensions.fontSize22,fontWeight: FontWeight.w600,),
              ),
            ),
            RatingBarIndicator(
              // rating: 3.3,
              rating: double.parse(
                widget.review.toString(),
              ),
              itemBuilder: (context, index) =>
                  Icon(Icons.star, color: Colors.red),
              itemCount: 5,

              itemSize: Dimensions.fontSize22,
              direction: Axis.horizontal,
            )
          ]),

          Row(

              children: [
            Padding(
              padding:  EdgeInsets.only(
                left: Dimensions.paddingLeft10,
              ),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${widget.location},",
                    style: TextStyle(fontSize: Dimensions.fontSize16),
                  )),
            ), SizedBox(
                  height: 5,
                ),
            Text(widget.title.toString(), style: TextStyle(fontSize:  Dimensions.fontSize16))
          ]),
          SizedBox(
            height:  Dimensions.sizedboxWidth8,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'images/nnnn.png',
              width:  Dimensions.imageWidth55,
              height: Dimensions.imageheight55,
            ),
            widget.discoun == null
                ? Text('0')
                : Text("${widget.discoun}%", style: TextStyle(fontSize: 14)),
            Text(' Discount',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14))
          ]),
          SizedBox(height: 3,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:  Dimensions.paddingLeft10, vertical:  Dimensions.sizedboxWidth6),
            child: Container(
              width: double.infinity,
              height: Get.size.height * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.5),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1.4,
                  )),
              child: Column(children: [
                SizedBox(
                  height: 3,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "${widget.startCount} / 5  ",
                    style: TextStyle(
                        color: PColor.maingreenColor,
                        fontWeight: FontWeight.bold,fontSize:  Dimensions.fontSize18),
                  ),
                  Icon(Icons.thumb_up_alt_outlined,
                      color: PColor.maingreenColor, size:  Dimensions.fontSize18)
                ]),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Excellent Value for Money',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize:  Dimensions.fontSize14),
                ),
              ]),
            ),
          ),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingLeft10, vertical:  Dimensions.paddingLeft10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular( Dimensions.border13),
                  child: Image.network(
                    widget.pic.toString(),
                    fit: BoxFit.cover,
                    width: double.infinity,))),
              Container(
                
                margin: EdgeInsets.only(left:  Dimensions.paddingLeft10,bottom:  Dimensions.paddingLeft10),
               
                width: Dimensions.containerwidth180,
                height: Dimensions.containerHeight65,
                child: ClipRRect(
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(13),topRight: Radius.circular(3)),
                  child: MaterialButton(onPressed: (){
                    print('hit me qaiser');

                   setState(
                         () {
                           isVisible=!isVisible;
                     },
                   );

                  },child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Icon(Icons.picture_in_picture,color: Colors.white,size: Dimensions.iconSize21,),
                    SizedBox(width: Dimensions.sizedboxWidth6,),
                    commonText(title: 'More Picture',Textcolor: Colors.white,size: Dimensions.textsize15,)],),color: Colors.black,minWidth: Dimensions.containerwidth180,),
                ),
                
              )
            ],
          ),
          SizedBox(
            height: Get.size.height * 0.04,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding:
                       EdgeInsets.symmetric(horizontal:  Dimensions.paddingLeft10, vertical: 5),
                  child: Text("About ${widget.title}",
                      style: TextStyle(
                          color: PColor.headingTextColor,
                          fontSize:  Dimensions.fontSize19,
                          fontWeight: FontWeight.w500)))),
          Padding(
              padding:  EdgeInsets.symmetric(horizontal:  Dimensions.paddingLeft10, vertical: 5),
              // child: Text(
              //   widget.des.toString(),
              //   style: TextStyle(
              //     color: PColor.headingTexPColor,
              //     fontSize: 13,
              //   ),
              // ),
              child: secondHalf.length == " "
                  ? Text(widget.des.toString(),style: TextStyle(fontSize: 17))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        commonText(title: flag ? firstHalf : widget.des.toString(),size:  Dimensions.fontSize16),
                          // Text(flag ? firstHalf : widget.des.toString(),style: TextStyle(fontSize: 17),),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  flag = !flag;
                                });
                              },
                              child: Row(children: [
                                Text(
                                  "Show more",
                                  style: TextStyle(color: Color(0xff89dad0)),
                                ),
                                Icon(
                                  flag
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_up,
                                  color: Color(0xff89dad0),
                                )
                              ]))
                        ]))

          // Container(
          //     child:
          //           )
        ],
      ),
    );
  }

  Widget RoomDetailTab() {
    // List roomList = filterData.rooms;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Available Rooms',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 7,
              ),
              SizedBox(
                width: Get.size.width * 0.26,
                height: 2,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.white,
                    Colors.black,
                  ])),
                ),
              ),
              SizedBox(
                height: Get.size.height * 0.06,
              ),
              SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    children: [
                      Container(
                        // width: double.infinity,
                        // height: Get.size.height * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: PColor.containerBorderColor,
                            width: 1,
                          ),
                        ),
                        child: doubleDeluxeRooms(),
                      ),
                      SizedBox(
                        height: Get.size.height * 0.03,
                      ),
                      Container(
                        // width: double.infinity,
                        // height: Get.size.height * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: PColor.containerBorderColor,
                            width: 1,
                          ),
                        ),
                        child: superiorSingleView(),
                      ),
                      SizedBox(
                        height: Get.size.height * 0.03,
                      ),
                      Container(
                        // width: double.infinity,
                        // height: Get.size.height * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: PColor.containerBorderColor,
                            width: 1,
                          ),
                        ),
                        child: Exucutive_Tow_bedrooms_Apartment(),
                      ),
                      SizedBox(
                        height: Get.size.height * 0.03,
                      ),
                      Container(
                        // width: double.infinity,
                        // height: Get.size.height * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: PColor.containerBorderColor,
                            width: 1,
                          ),
                        ),
                        child: deluxRoom(),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Widget Amenities() {
    return GetBuilder<HomeController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: commonText(
                  title: 'Hotel Amenities',
                  fontWeight: FontWeight.w500,
                  size: 20,
                )),
            Container(
              width: double.infinity,
              height: Get.size.height * 0.7,
              child: FutureBuilder<HotelDetailModelCalass>(
                  future: HotelDetailApiClientProvider().getDate(),
                  builder: (context, snapshot) {
                    final data =
                        HotelDetailApiClientProvider().getFlightDetailData();

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: JumpingText('Loading...'));
                    }
                    final roomList = snapshot.data?.amenities;
                    if (roomList == null)
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: JumpingText('Loading...')),
                      ));
                    if (!snapshot.hasData) {
                      return Center(child: Text('No Data Exit'));
                    }

                    return Container(
                      // width: double.infinity,
                      // height: Get.size.height * 0.22,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: roomList.length,
                        // itemCount: 1,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(
                                    left: 15,
                                    right: 6,
                                  ),
                                  // width: double.infinity,
                                  // height: Get.size.height * 0.22,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: Get.size.width * 0.09,
                                        height: Get.size.height * 0.09,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: PColor
                                                .amenitiesContaienrBackGroundcolor),
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Image.network(
                                            roomList[index].icon.toString(),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 9),
                                        child: commonText(
                                            fontWeight: FontWeight.w500,
                                            size: 13,
                                            title: roomList[index]
                                                .name
                                                .toString()),
                                      )
                                    ],
                                  )),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }

  Widget policy() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:  Dimensions.paddingLeft10, vertical: 5),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.size.height * 0.02,
            ),
            commonText(
              title: 'Policy',
              size:  Dimensions.fontSize20,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: Get.size.height * 0.03,
            ),
            Expanded(
              child: Container(
                  child: FutureBuilder<HotelDetailModelCalass>(
                future: HotelDetailApiClientProvider().getDate(),
                builder: (context, snapshot) {
                  final policyList = snapshot.data;
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return Center(child: JumpingText('Loading...'));
                  // }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  // if (policyList == null)
                  //   return Center(
                  //       child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Center(child: JumpingText('Loading...')),
                  //   ));
                  if (!snapshot.hasData) {
                    return Center(child: Text('No Data Exit'));
                  }
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // itemCount: policyList?.policy?.length,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return commonText(title: policyList?.policy.toString()??"policy");
                    },
                  );
                },
              )),
            ),
            SizedBox(
              height: Get.size.height * 0.01,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(
                    title: "Payment Options",
                    size: 15.5,
                    fontWeight: FontWeight.w500,
                  ),
                  Expanded(
                    child: Container(
                      // height: Get.size.height * 0.3,
                      child: FutureBuilder<HotelDetailModelCalass>(
                        future: HotelDetailApiClientProvider().getDate(),
                        builder: (context, snapshot) {
                          final paymentoption = snapshot.data?.paymentOption;
                          // if (snapshot.connectionState ==
                          //     ConnectionState.waiting) {
                          //   return Center(child: JumpingText('Loading...'));
                          // }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (paymentoption == null)
                            return Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: JumpingText('')),
                            ));
                          if (!snapshot.hasData) {
                            return Center(child: Text('No Data Exit'));
                          }
                          return ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            // physics: Never(),
                            itemCount: paymentoption.length,
                            itemBuilder: (context, index) {
                              return IconText(
                                  icon: Icons.check,
                                  backgroundColor: Colors.black,
                                  title: paymentoption[index].name.toString());
                            },
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final Completer<GoogleMapController> _controller = Completer();
  Widget map() {
    double lat = widget.lat as double;
    double lang = widget.lang as double;
    String name = widget.name.toString();
    final List<Marker> _marker = [
      Marker(
          markerId: MarkerId('1'),
          position: LatLng(widget.lat as double, widget.lang as double),
          // position: LatLng(33.7293882, 73.09314610000001),
          infoWindow: InfoWindow(title: name))
    ];
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              commonText(
                title: 'Hotel Map',
                size: 20,
                fontWeight: FontWeight.w500,
              ),
              Stack(children: [
                Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: Get.size.height * 0.5,
                    child: Expanded(
                        child: GoogleMap(
                            mapType: isSelect?MapType.hybrid:MapType.normal,
                            compassEnabled: true,
                            zoomControlsEnabled: true,
                            markers: Set.of(_marker),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                            myLocationEnabled: true,
                            initialCameraPosition: CameraPosition(
                                target: LatLng(widget.lat as double,
                                    widget.lang as double),
                                // target: LatLng(33.7293882, 73.09314610000001),
                                zoom: 15)))),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    height: Get.size.height * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: MaterialButton(
                          color: Colors.white,
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonText(
                                  title:
                                      '${lat.toStringAsPrecision(5)} N,${lang.toStringAsPrecision(5)} E',
                                  Textcolor: Colors.black,
                                  size: 12),
                              Text('View larger map',
                                  style: TextStyle(color: Colors.blue, fontSize: 10))])),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: GestureDetector(
                          onTap: (){
                            print('heelo me');
                            setState(() {
                             // isSelect?MapType.hybrid:_currentMaptype;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black45,width: 1.5)
                            ),

                            width: Get.size.width*0.17,
                            height: Get.size.height*0.08,
                            child:GoogleMap(

                              myLocationEnabled: false,
                                mapType:isSelect?MapType.normal:MapType.hybrid,
                                compassEnabled: true,
                                zoomControlsEnabled: false,

                                onMapCreated: (GoogleMapController controller) {
                                  // _controller.complete(controller);
                                  Completer<GoogleMapController> _controller =
                                  Completer();
                                  _controller.complete(controller);
                                },
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(widget.lat as double,
                                        widget.lang as double),
                                    // target: LatLng(33.7293882, 73.09314610000001),
                                    zoom: 3)))))]))])]));
  }

  Widget doubleDeluxeRooms() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.4),
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(
                        0.4,
                      ),
                      width: 1))),
          width: double.infinity,
          height: Get.size.height * 0.06,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Double Deluxe Rooms',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)))),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          width: double.infinity,
          height: Get.size.height * 0.22,
          child: FutureBuilder<HotelDetailModelCalass>(
              future: HotelDetailApiClientProvider().getDate(),
              builder: (context, snapshot) {
                final data =
                HotelDetailApiClientProvider().getFlightDetailData();

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: JumpingText('Loading...'));
                }
                final roomList = snapshot.data?.rooms;
                if (roomList == null)
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: JumpingText('Loading...')),
                  ));
                if (!snapshot.hasData) {
                  return Center(child: Text('No Data Exit'));
                }
                return Container(
                  width: double.infinity,
                  height: Get.size.height * 0.22,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // itemCount: roomList.length,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                          width: double.infinity,
                          height: Get.size.height * 0.22,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              roomList[index].img![index].toString(),
                              fit: BoxFit.cover,
                            ),
                          ));}));})),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: commonText(
              title: 'Amenties',
              size: 16,
              fontWeight: FontWeight.w700,))),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3),
          width: Get.size.width,
          height: Get.size.height * 0.22,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 15, top: 10),
                width: double.infinity,
                height: Get.size.height * 0.2,
                child: FutureBuilder<HotelDetailModelCalass>(
                    future: HotelDetailApiClientProvider().getDate(),
                    builder: (context, snapshot) {
                      final data =
                      HotelDetailApiClientProvider().getFlightDetailData();

                      if (!snapshot.hasData) {
                        return Center(child: Text('No Data Exit'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final roomList = snapshot.data?.rooms;
                      if (roomList == null) return CircularProgressIndicator();

                      return Container(
                        width: double.infinity,
                        height: Get.size.height * 0.2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: roomList.length,
                          // itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                                width: double.infinity,
                                height: Get.size.height * 0.2,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  // itemCount: roomList[index]
                                  //     .amenities
                                  //     ?.length,
                                  itemCount: 7,
                                  itemBuilder: (context, position) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Expanded(
                                        child: Container(
                                            child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: PColor.maingreenColor,
                                              size: 13,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 7, right: 4),
                                              child: SmallText(
                                                size: 11.5,
                                                title: roomList[index]
                                                    .amenities![position]
                                                    .name
                                                    .toString(),
                                                color: PColor.maingreenColor,
                                                heightSpacing: 1.5,))])))
                                    );
                                  }
                                ));}));
                    }))])
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: commonText(
              title: 'Max Guests',
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3),
          width: Get.size.width,
          height: Get.size.height * 0.2,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 15, top: 5),
            // child: Row(
            //   children: [

            //     // Text('  ')
            //   ],
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconText(
                        icon: Icons.person_outline_outlined,
                        iconSize: 19,
                        title: 'Adults 2',
                        backgroundColor: Colors.black,
                        textSize: 15,
                      ),
                      IconText(
                        icon: Icons.woman,
                        iconSize: 19,
                        title: 'Child 3',
                        backgroundColor: Colors.black,
                        textSize: 15,
                      ),
                    ],
                  ),
                ),
                Text('  '),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: commonText(
              title: 'Price',
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 15),
          width: Get.size.width,
          height: Get.size.height * 0.2,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 10),
          width: Get.size.width,
          height: Get.size.height * 0.2,
          decoration: BoxDecoration(
              color: PColor.containerBorderColor.withOpacity(0.7),
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                minWidth: Get.size.width * 0.33,
                height: Get.size.height * 0.06,
                onPressed: () {},
                color: Colors.black,
                child: Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget superiorSingleView() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.4),
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(
                        0.4,
                      ),
                      width: 1))),
          width: double.infinity,
          height: Get.size.height * 0.06,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Superior Single View',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          width: double.infinity,
          height: Get.size.height * 0.22,
          child: FutureBuilder<HotelDetailModelCalass>(
              future: HotelDetailApiClientProvider().getDate(),
              builder: (context, snapshot) {
                final data =
                HotelDetailApiClientProvider().getFlightDetailData();

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: JumpingText('Loading...'));
                }
                final roomList = snapshot.data?.rooms;
                if (roomList == null)
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: JumpingText('Loading...')),
                  ));
                if (!snapshot.hasData) {
                  return Center(child: Text('No Data Exit'));
                }
                return Container(
                  width: double.infinity,
                  height: Get.size.height * 0.22,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // itemCount: roomList.length,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                          width: double.infinity,
                          height: Get.size.height * 0.22,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              roomList[index].img![index].toString(),
                              fit: BoxFit.cover,
                            ),
                          ));
                    },
                  ),
                );
              }),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: commonText(
              title: 'Amenties',
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3),
          width: Get.size.width,
          height: Get.size.height * 0.22,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 15, top: 10),
                width: double.infinity,
                height: Get.size.height * 0.2,
                child: FutureBuilder<HotelDetailModelCalass>(
                    future: HotelDetailApiClientProvider().getDate(),
                    builder: (context, snapshot) {
                      final data =
                      HotelDetailApiClientProvider().getFlightDetailData();

                      if (!snapshot.hasData) {
                        return Center(child: Text('No Data Exit'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final roomList = snapshot.data?.rooms;
                      if (roomList == null) return CircularProgressIndicator();

                      return Container(
                        width: double.infinity,
                        height: Get.size.height * 0.2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: roomList.length,
                          // itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                                width: double.infinity,
                                height: Get.size.height * 0.2,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  // itemCount: roomList[index]
                                  //     .amenities
                                  //     ?.length,
                                  itemCount: 7,
                                  itemBuilder: (context, position) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Expanded(
                                        child: Container(
                                            child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: PColor.maingreenColor,
                                              size: 13,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 7, right: 4),
                                              child: SmallText(
                                                size: 11.5,
                                                title: roomList[index]
                                                    .amenities![position]
                                                    .name
                                                    .toString(),
                                                color: PColor.maingreenColor,
                                                heightSpacing: 1.5,
                                              )
                                            )
                                          ]
                                        ))
                                      )
                                    );
                                  }
                                ));
                          }
                        )
                      );
                    })
              )
            ]
          )
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: commonText(
              title: 'Max Guests',
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3),
          width: Get.size.width,
          height: Get.size.height * 0.2,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 15, top: 5),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconText(
                        icon: Icons.person_outline_outlined,
                        iconSize: 19,
                        title: 'Adults 2',
                        backgroundColor: Colors.black,
                        textSize: 15,
                      ),
                      IconText(
                        icon: Icons.woman,
                        iconSize: 19,
                        backgroundColor: Colors.black,
                        title: 'Child 3',
                        textSize: 15
                      )
                    ]
                  )
                ),
                Text('  '),
              ]
            )
          )
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: commonText(
              title: 'Price',
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 15),
          width: Get.size.width,
          height: Get.size.height * 0.2,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 10),
          width: Get.size.width,
          height: Get.size.height * 0.2,
          decoration: BoxDecoration(
              color: PColor.containerBorderColor.withOpacity(0.7),
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                minWidth: Get.size.width * 0.33,
                height: Get.size.height * 0.06,
                onPressed: () {},
                color: Colors.black,
                child: Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget Exucutive_Tow_bedrooms_Apartment() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.4),
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(
                        0.4,
                      ),
                      width: 1))),
          width: double.infinity,
          height: Get.size.height * 0.06,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Executive Two-Bedrooms Apartment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          width: double.infinity,
          height: Get.size.height * 0.22,
          child: FutureBuilder<HotelDetailModelCalass>(
              future: HotelDetailApiClientProvider().getDate(),
              builder: (context, snapshot) {
                final data =
                HotelDetailApiClientProvider().getFlightDetailData();
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: JumpingText('Loading...'));
                }
                final roomList = snapshot.data?.rooms;
                if (roomList == null)
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: JumpingText('Loading...')),
                  ));
                if (!snapshot.hasData) {
                  return Center(child: Text('No Data Exit'));
                }
                return Container(
                  width: double.infinity,
                  height: Get.size.height * 0.22,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // itemCount: roomList.length,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                          width: double.infinity,
                          height: Get.size.height * 0.22,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              roomList[index].img![index].toString(),
                              fit: BoxFit.cover,
                            ),
                          ));
                    },
                  ),
                );
              }),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: commonText(
              title: 'Amenties',
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3),
          width: Get.size.width,
          height: Get.size.height * 0.22,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 15, top: 10),
                width: double.infinity,
                height: Get.size.height * 0.2,
                child: FutureBuilder<HotelDetailModelCalass>(
                    future: HotelDetailApiClientProvider().getDate(),
                    builder: (context, snapshot) {
                      final data =
                      HotelDetailApiClientProvider().getFlightDetailData();

                      if (!snapshot.hasData) {
                        return Center(child: Text('No Data Exit'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final roomList = snapshot.data?.rooms;
                      if (roomList == null) return CircularProgressIndicator();

                      return Container(
                        width: double.infinity,
                        height: Get.size.height * 0.2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: roomList.length,
                          // itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                                width: double.infinity,
                                height: Get.size.height * 0.2,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  // itemCount: roomList[index]
                                  //     .amenities
                                  //     ?.length,
                                  itemCount: 7,
                                  itemBuilder: (context, position) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Expanded(
                                        child: Container(
                                            child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: PColor.maingreenColor,
                                              size: 13,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 7, right: 4),
                                              child: SmallText(
                                                size: 11.5,
                                                title: roomList[index]
                                                    .amenities![position]
                                                    .name
                                                    .toString(),
                                                color: PColor.maingreenColor,
                                                heightSpacing: 1.5,))]))));
                                  }));
                          })
                      );}))])
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: commonText(
              title: 'Max Guests',
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3),
          width: Get.size.width,
          height: Get.size.height * 0.2,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 15, top: 5),
            // child: Row(
            //   children: [

            //     // Text('  ')
            //   ],
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconText(
                        icon: Icons.person_outline_outlined,
                        iconSize: 19,
                        title: 'Adults 2',
                        backgroundColor: Colors.black,
                        textSize: 15,
                      ),
                      IconText(
                        icon: Icons.woman,
                        iconSize: 19,
                        title: 'Child 3',
                        backgroundColor: Colors.black,
                        textSize: 15,
                      ),
                    ],
                  ),
                ),
                Text('  '),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: commonText(
              title: 'Price',
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 15),
          width: Get.size.width,
          height: Get.size.height * 0.2,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 10),
          width: Get.size.width,
          height: Get.size.height * 0.2,
          decoration: BoxDecoration(
              color: PColor.containerBorderColor.withOpacity(0.7),
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                minWidth: Get.size.width * 0.33,
                height: Get.size.height * 0.06,
                onPressed: () {},
                color: Colors.black,
                child: Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget deluxRoom() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.4),
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(
                        0.4,
                      ),
                      width: 1))),
          width: double.infinity,
          height: Get.size.height * 0.06,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Delux Room',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
          width: double.infinity,
          height: Get.size.height * 0.22,
          child: FutureBuilder<HotelDetailModelCalass>(
              future: HotelDetailApiClientProvider().getDate(),
              builder: (context, snapshot) {
                final data =
                HotelDetailApiClientProvider().getFlightDetailData();

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: JumpingText('Loading...'));
                }
                final roomList = snapshot.data?.rooms;
                if (roomList == null)
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: JumpingText('Loading...')),
                  ));
                if (!snapshot.hasData) {
                  return Center(child: Text('No Data Exit'));
                }
                return Container(
                  width: double.infinity,
                  height: Get.size.height * 0.22,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // itemCount: roomList.length,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                          width: double.infinity,
                          height: Get.size.height * 0.22,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              roomList[index].img![index].toString(),
                              fit: BoxFit.cover,
                            ),
                          ));
                    },
                  ),
                );
              }),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: commonText(
              title: 'Amenties',
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3),
          width: Get.size.width,
          height: Get.size.height * 0.22,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 15, top: 10),
                width: double.infinity,
                height: Get.size.height * 0.2,
                child: FutureBuilder<HotelDetailModelCalass>(
                    future: HotelDetailApiClientProvider().getDate(),
                    builder: (context, snapshot) {
                      final data =
                      HotelDetailApiClientProvider().getFlightDetailData();

                      if (!snapshot.hasData) {
                        return Center(child: Text('No Data Exit'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final roomList = snapshot.data?.rooms;
                      if (roomList == null) return CircularProgressIndicator();

                      return Container(
                        width: double.infinity,
                        height: Get.size.height * 0.2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: roomList.length,
                          // itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                                width: double.infinity,
                                height: Get.size.height * 0.2,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  // itemCount: roomList[index]
                                  //     .amenities
                                  //     ?.length,
                                  itemCount: 7,
                                  itemBuilder: (context, position) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Expanded(
                                        child: Container(
                                            child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: PColor.maingreenColor,
                                              size: 13,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 7, right: 4),
                                              child: SmallText(
                                                size: 11.5,
                                                title: roomList[index]
                                                    .amenities![position]
                                                    .name
                                                    .toString(),
                                                color: PColor.maingreenColor,
                                                heightSpacing: 1.5,))
                                          ]))));}));})
                      );}))])
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: commonText(
              title: 'Max Guests',
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3),
          width: Get.size.width,
          height: Get.size.height * 0.2,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 15, top: 5),
            // child: Row(
            //   children: [

            //     // Text('  ')
            //   ],
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconText(
                        icon: Icons.person_outline_outlined,
                        iconSize: 19,
                        title: 'Adults 2',
                        backgroundColor: Colors.black,
                        textSize: 15,
                      ),
                      IconText(
                        icon: Icons.woman,
                        iconSize: 19,
                        backgroundColor: Colors.black,
                        title: 'Child 3',
                        textSize: 15,
                      ),
                    ],
                  ),
                ),
                Text('  '),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: commonText(
              title: 'Price',
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 15),
          width: Get.size.width,
          height: Get.size.height * 0.2,
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 10),
          width: Get.size.width,
          height: Get.size.height * 0.2,
          decoration: BoxDecoration(
              color: PColor.containerBorderColor.withOpacity(0.7),
              border:
                  Border.all(width: 1.3, color: PColor.containerBorderColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                minWidth: Get.size.width * 0.33,
                height: Get.size.height * 0.06,
                onPressed: () {},
                color: Colors.black,
                child: Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          ),
        )
      ],
    );
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

  

  // Widget allHotelDetailVisibiltyContainer(){
  //   return
  // }
  
}

