import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:phptravelapp/app/mobules/homePage/component/drawer/drawer.dart';
import 'package:phptravelapp/phptravele_all_module/bottonNavigation/bottonNavigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final zoomController=ZoomDrawerController();
  bool isDrawerOpen=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          // ye main line he is k zarye drawer open close kare ge/
          ZoomDrawer.of(context)!.toggle();

        }, icon: Icon(Icons.menu)),

      ),
      body: TravelsBottonNavigation(),
    );
  }


}
