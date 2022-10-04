import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/reusableText/commonText.dart';
import 'package:phptravelapp/reusableText/dimensions.dart';

class HotelRoomDetail extends StatefulWidget {
  @override
  State<HotelRoomDetail> createState() => _HotelRoomDetailState();
}

class _HotelRoomDetailState extends State<HotelRoomDetail> {
  bool isVisible = false;

  String Travellers = 'Travellers';

  String Rooms = 'Rooms';

  int childCount = 0;

  int adultCount = 2;

  int roomcout = 1;

  int noRoom=1;
  final selectedValue = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rooms and Guests'),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 4,

      ),
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                SizedBox(height: Dimensions.paddingLeft10*2,),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: Dimensions.paddingLeft10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200, width: 0.7),
                      borderRadius: BorderRadius.circular(3.0),
                      // color: Colors.grey.shade200.withOpacity(0.99),

                      boxShadow: const [
                        BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 0,
                          spreadRadius: 0.0,
                          offset: Offset(0, 0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: visibilityContainerRow('Rooms', () => (){}, "$noRoom", () => (){}),
                    )),
                SizedBox(height: Dimensions.paddingLeft10,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.paddingLeft10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade200, width: 0.7),
                    borderRadius: BorderRadius.circular(3.0),
                    // color: Colors.grey.shade200.withOpacity(0.99),

                    boxShadow: const [
                      BoxShadow(
                        color: Colors.transparent,
                        blurRadius: 0,
                        spreadRadius: 0.0,
                        offset: Offset(0, 0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  width: Get.size.width,
                  height: Get.size.height * 0.24,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(height: Dimensions.paddingLeft10,),
                       Align(
                           alignment: Alignment.topLeft,
                           child: Padding(
                             padding: EdgeInsets.only(left: Dimensions.paddingvertical5),
                             child: commonText(title: 'R O O M  1',size: Dimensions.border13,fontWeight: FontWeight.w600,),
                           )),
                        visibilityContainerRow(
                            'Adults'.tr,
                                () {
                              setState(() {
                                adultCount++;
                              });
                            },
                            '${adultCount}',
                                () {
                              setState(() {
                                adultCount <= 0 ? adultCount = 0 : adultCount--;
                              });
                            },),
                        visibilityContainerRow(
                            'Childs'.tr,
                                () {
                              setState(() {
                                childCount++;
                              });
                            },
                            '${childCount}',
                                () {
                              setState(() {
                                childCount <= 0 ? childCount = 0 : childCount--;
                              });
                            },
                           ),


                      ],
                    ),
                  ),
                ),
              ],
            ),
           Padding(
             padding:  EdgeInsets.only(left: Dimensions.paddingLeft10,right: Dimensions.paddingLeft10,bottom: Dimensions.paddingLeft10 ),
             child: Container(
               height: Dimensions.fontSize18*3,
               child: MaterialButton(onPressed: (){},child: commonText(title: 'Apply',Textcolor: Colors.white),
                 color: PColor.mainTextColor,minWidth: double.infinity,),
             ),
           )
          ],
        ),
      ),
      // child: ,
    );
  }

  Widget visibilityContainerRow(String title, Function() plusCount, String hint,
      Function() minusCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: Dimensions.fontSize18),
                ),
              ],
            )),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 13),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: PColor.mainColor.withOpacity(0.6),
                  ),
                  width: Get.size.width * 0.094,
                  height: Get.size.height * 0.094,
                  child: InkWell(
                      onTap: minusCount,
                      child: Center(
                          child: PlusMinus(
                            title: '-',
                            size: 40,
                          ))),
                ),
                Text(hint),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: PColor.mainColor.withOpacity(0.6),
                    ),
                    width: Get.size.width * 0.094,
                    height: Get.size.height * 0.094,
                    child: InkWell(
                        child: Center(
                          child: InkWell(
                              onTap: plusCount,
                              child: PlusMinus(
                                title: '+',
                                size: 30,
                              )),
                        )))
              ],
            )),
      ],
    );
  }
}
