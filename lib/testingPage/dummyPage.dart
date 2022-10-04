import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:phptravelapp/phptravele_all_module/travelHome/component/zoomDrawer/zoomDrawer.dart';
import 'package:phptravelapp/testingPage/TravleHomePageTester.dart';

class TravelHomeTestPage extends StatefulWidget {
  const TravelHomeTestPage({Key? key}) : super(key: key);

  @override
  State<TravelHomeTestPage> createState() => _TravelHomeTestPageState();
}

class _TravelHomeTestPageState extends State<TravelHomeTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.to(ZoomDrawerPage());
            }, child: Text("Home 1")),
            ElevatedButton(onPressed: (){
              Get.to(TravelHomeTester());
            }, child: Text("Home 2")),
          ],
        ),
      ),
    );
  }
}
