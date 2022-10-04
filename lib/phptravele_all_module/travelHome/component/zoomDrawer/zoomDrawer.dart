import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:phptravelapp/phptravele_all_module/bottonNavigation/bottonNavigation.dart';
import 'package:phptravelapp/phptravele_all_module/travelHome/component/zoomDrawer/component/mainScreen.dart';
import 'package:phptravelapp/phptravele_all_module/travelHome/component/zoomDrawer/component/menuScreen.dart';

class ZoomDrawerPage extends StatelessWidget {
  final zoomController=ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ZoomDrawer(

        controller: zoomController,
        closeDragSensitivity: 3,
        mainScreenTapClose: true,
        style: DrawerStyle.defaultStyle,
        borderRadius: 24.0,
        showShadow: true,
        drawerShadowsBackgroundColor: Colors.grey,
        openCurve: Curves.fastOutSlowIn,
          menuScreen:MenuScren(),
          mainScreen:TravelsBottonNavigation(),
        // isRtl: true,
        angle: 0,
        duration: Duration(milliseconds: 600),
      ),
    );
  }
}
