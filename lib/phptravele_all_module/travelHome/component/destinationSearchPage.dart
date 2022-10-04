import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/reusableText/dimensions.dart';

class DestinationSearchPage extends StatefulWidget {
  const DestinationSearchPage({Key? key}) : super(key: key);

  @override
  State<DestinationSearchPage> createState() => _DestinationSearchPageState();
}

class _DestinationSearchPageState extends State<DestinationSearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              SizedBox(height: Dimensions.textsize15*2),
              Row(
                children: [
                  SizedBox(width: Dimensions.border13,),
                  Container(
                      width: Get.size.width*0.1,
                      child: InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back,size: Dimensions.textsize15*2,))),
                  Container(
                    width: Get.size.width*0.84,
                    child: TextFormField(
                      cursorColor: Colors.black87,
                      style: TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),),
                        // border: InputBorder.none,
                        // filled: true,
                        hintText: 'Choose Now . . .',
                        hintStyle: TextStyle(
                          fontSize: Dimensions.fontSize18,
                          color: Colors.grey,

                        ),
                        // fillColor: PColor.mainColor.withOpacity(0.5),
                        // icon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
