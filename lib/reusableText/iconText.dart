import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'dimensions.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? iconColor;
  final Color? textcolor;
  final double? iconSize;
  final double? textSize;
  final String? subText;
  final Color? backgroundColor;

  const IconText(
      {super.key,
      required this.icon,
      required this.title,
      this.iconColor = Colors.white,
      this.textcolor = const Color(0xff0D233E),
      this.iconSize = 14,
      this.textSize,
        this.subText,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
              width: Get.size.width * 0.09,
              height: Get.size.height * 0.09,
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: iconSize,
                color: iconColor,
              )),
          SizedBox(
            width: 7,
          ),
          Text(
            title.toString(),
            style: TextStyle(color: textcolor, fontSize: textSize),
          )
        ],
      ),
    );
  }
}

class IconTextSubText extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? iconColor;
  final Color? textcolor;
  final double? iconSize;
  final double? textSize;
  final String? subText;
  final double? subTextSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;

  const IconTextSubText(
      {super.key,
        required this.icon,
        required this.title,
        this.iconColor = Colors.white,
        this.textcolor = const Color(0xff0D233E),
        this.iconSize = 14,
        this.textSize,
        this.subText,
        this.fontWeight,
        this.subTextSize,
        this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
              width: Get.size.width * 0.13,
              height: Get.size.height * 0.09,
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: iconSize,
                color: iconColor,
              )),
          SizedBox(
            width:Dimensions.paddingLeft10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toString(),
                style: TextStyle(color: textcolor, fontSize: textSize,fontWeight: fontWeight),
              ),
              Text(
                subText.toString(),
                style: TextStyle(color: textcolor, fontSize: subTextSize),
              ),

            ],
          )
        ],
      ),
    );
  }
}
