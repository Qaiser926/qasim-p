import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_car.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_hotel.dart';
import 'package:phptravelapp/app/mobules/homePage/component/topRowIcon.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/mobules/services/controller/flightDetailController.dart';
import 'package:phptravelapp/app/mobules/services/controller/hotelDetail_controller.dart';
import 'package:phptravelapp/phptravele_all_module/controller/flightDateRangeController.dart';
import 'package:phptravelapp/phptravele_all_module/services/api_client/main_apiClient.dart';
import 'package:phptravelapp/phptravele_all_module/travelHome/component/destinationSearchPage.dart';
import 'package:phptravelapp/phptravele_all_module/travelHome/component/hotelroomDetail.dart';
import 'package:phptravelapp/reusableText/commonText.dart';
import 'package:phptravelapp/reusableText/dimensions.dart';
import 'package:phptravelapp/testingPage/TravleHomePageTester.dart';
import 'package:phptravelapp/app/mobules/hotelPage/featureHotel_allData.dart';

class TestHomePage extends StatefulWidget {
  const TestHomePage({Key? key}) : super(key: key);

  @override
  State<TestHomePage> createState() => _TestHomePageState();
}

class _TestHomePageState extends State<TestHomePage> with SingleTickerProviderStateMixin{
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
  final flightDetaildateRangeController = Get.put(FlightDateRangeController());
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
  final homecontroller = Get.put(HomeController());

  final flightdetailController = Get.put(HotelDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColor.mainColor.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: PColor.mainColor.withOpacity(0.1),
        surfaceTintColor: PColor.mainColor.withOpacity(0.1),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.network(imgurl,width: 150,),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10,top: 20),
            child: Icon(Icons.notifications_none_outlined,size: 30,),
          ),
        ],

      ),
      body: Container(

        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                    child: commonText(title: "Destination",size: Dimensions.border13,Textcolor: Colors.grey),

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
            ),
            SizedBox(height:0,),
            SizedBox(height: Dimensions.fontSize18,),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.paddingLeft10*2),
              child: commonText(title: 'All you need for you trip',size: Dimensions.textsize15,fontWeight: FontWeight.w500,),
            ),
            TopRowIcon(),
            SizedBox(height:Dimensions.paddingLeft10,),
            Padding(
              padding:  EdgeInsets.only(left: Dimensions.paddingLeft10*2),
              child: commonText(title: 'Top Hotel Destinations',size: Dimensions.textsize15,fontWeight: FontWeight.w500,),
            ),
            SizedBox(height:Dimensions.paddingvertical5,),
            FeatureHotel(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingLeft10,vertical: Dimensions.paddingLeft10),
              child: Container(
                height: Dimensions.fontSize22*2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    border: Border.all(color: PColor.mainTextColor,width: 1)
                  ),
                  child: MaterialButton(onPressed: (){
                    Get.to(FeatureHotelAllList());
                  },child: commonText(title: 'SHOW ALL',
                    size: Dimensions.fontSize18,Textcolor: PColor.mainTextColor,fontWeight: FontWeight.w600,)),),
            ),
            FeatureCar(),
          ],
        ),
      )

    );
  }

  Widget rangeCalender() {
    return
      Column(
      children: [

        Padding(
          padding:  EdgeInsets.only(left: Dimensions.paddingLeft10*2,right:  Dimensions.paddingLeft10*2),
          child: Divider(color: PColor.mainColor),
        ),
       Container(
         height: Get.size.height*0.06,
         child: Row(

           children: [
             Container(
               width: Get.size.width*0.5,
               decoration: BoxDecoration(
                 // color: PColor.mainColor,
                   borderRadius: BorderRadius.circular(4)),
               child: InkWell(
                 onTap: () {
                   flightDetaildateRangeController.chooseDateRangePicker();
                 },
                 child: Row(
                   children: [


                     SizedBox(width:15,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         commonText(title: 'Dates',size: Dimensions.paddingLeft10,Textcolor: Colors.grey,),
                         Container(
                           child: Row(
                             children: [
                               Obx(() => Text(DateFormat('dd-MM-yyyy')
                                   .format(flightDetaildateRangeController.dateRange.value.start)
                                   .toString(),style: TextStyle(fontSize:Dimensions. border13),)),
                               Obx(() => Text(" - " +
                                   DateFormat("dd-MM-yyyy")
                                       .format(flightDetaildateRangeController.dateRange.value.end)
                                       .toString(),style: TextStyle(fontSize: Dimensions.border13),)),
                             ],
                           ),
                         ),
                       ],
                     ),

                   ],
                 ),
               )
             ),
             VerticalDivider(color: PColor.mainColor,),
             InkWell(
               onTap: (){
                 Get.to(HotelRoomDetail());
               },
               child: Container(width: Get.size.width*0.4,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     commonText(title: 'Rooms',size: Dimensions.paddingLeft10,Textcolor: Colors.grey),
                     commonText(title: '4 guests, 1 room',size: Dimensions.border13),
                   ],
                 ),
               ),
             )
           ],
         ),
       ),
        Padding(
          padding:  EdgeInsets.only(left: Dimensions.paddingLeft10*2,right:  Dimensions.paddingLeft10*2),
          child: Divider(color: PColor.mainColor),
        ),
        Padding(
          padding: EdgeInsets.only(left: Dimensions.paddingLeft10*2,right:  Dimensions.paddingLeft10*2),
          child: MaterialButton(onPressed: (){},child: commonText(title: 'Search',Textcolor: Colors.white),
              color:PColor.mainTextColor,minWidth: double.infinity),
        ),
        SizedBox(height: Dimensions.paddingvertical5,),
      ],
    );
  }


}
