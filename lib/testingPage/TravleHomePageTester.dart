
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeView/homeView.dart';
import 'package:phptravelapp/reusableText/commonText.dart';
import 'package:phptravelapp/reusableText/dimensions.dart';
import 'package:phptravelapp/testingPage/testerHome.dart';

String imgurl='https://phptravels.net/api/uploads/global/logo.png';
class TravelHomeTester extends StatefulWidget {
  const TravelHomeTester({Key? key}) : super(key: key);

  @override
  State<TravelHomeTester> createState() => _TravelHomeTesterState();
}

class _TravelHomeTesterState extends State<TravelHomeTester> {

  int currentIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    TestHomePage(),
    // ZoomDrawerPage(),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('travel', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Image.network(imgurl,width: Dimensions.imageheight55*3,),
        // ),
        body: Center(
          child: _widgetOptions.elementAt(currentIndex),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BottomNavigationBar(
              // type: BottomNavigationBarType.fixed,
              // backgroundColor: Color(0xff1EC38B),
              currentIndex: currentIndex,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: "bottomnav1".tr,
                  backgroundColor: Color(0xff1EC38B),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  label: "bottomnav2".tr,
                  backgroundColor: Color(0xff1EC38B),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.directions_walk,
                    color: Colors.white,
                  ),
                  label: "bottomnav3".tr,
                  backgroundColor: Color(0xff1EC38B),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: "bottomnav4".tr,
                  backgroundColor: Color(0xff1EC38B),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: Get.size.height*0.16,
                  color: PColor.maingreenColor,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                     CircleAvatar(),
                      SizedBox(height: 6,),
                      commonText(title: "Qaiser farooq",size: 15,Textcolor: Colors.white,fontWeight: FontWeight.w600,),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height:15,),
           Container(
             margin: EdgeInsets.all(10),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               border: Border.all(color: Colors.grey.shade200, width: 0.7),
               color: Colors.white,
               boxShadow: const [
                 BoxShadow(
                   color: Colors.transparent,
                   blurRadius: 0,
                   spreadRadius: 0.0,
                   offset: Offset(0, 0), // shadow direction: bottom right
                 )
               ],
             ),

             child: Column(
               children: [ Padding(
                 padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [

                     commonText(title: 'Account'),
                     Icon(Icons.person),

                   ],
                 ),
               ),
                 Padding(
                   padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [

                       commonText(title: 'Language'),
                       commonText(title: 'English'),


                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       commonText(title: 'Currency'),
                       commonText(title: 'GBP'),
                     ],
                   ),
                 ),
               ],
             ),
           )

          ],
        ),
      ),
    );
  }
}
