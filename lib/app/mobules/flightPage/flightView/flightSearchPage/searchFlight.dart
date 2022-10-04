import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/flightPage/flightController/flightController.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/component/flightdestinationData.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/mobules/hotelPage/hotelView/hotelSearchPage/hotelSearchPage.dart';
import 'package:phptravelapp/reusableText/commonText.dart';
import 'package:phptravelapp/reusableText/dimensions.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:phptravelapp/reusableText/reusable_commonText.dart';

class FlightPage extends StatefulWidget {
  const FlightPage({super.key});

  @override
  State<FlightPage> createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {
  dynamic argumentData = Get.arguments;


  // var UserModel Post;
  var a = Image.asset(
    'images/pak.png',
    width: 50,
    height: 50,
  );

  // final selectedValue = null;

  List listitem = ['Economy', 'Economy Premium', 'Business', 'First'];
  var valueChose = 'Economy';

  String? selectedValue;


  String isSelect = '';
  bool isSingleVisible = true;
  bool isDoubleVisible = false;
  final flightControler = Get.put(FlightController());
  HomeController controller = Get.find<HomeController>();
  final flightController = Get.put(FlightController());
  // final homecontroler = Get.find<FlightController>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // controller.dispose();
    // flightController.dispose();
  }

  bool isVisible = false;
  String Travellers = 'Travellers'.tr;
  String Rooms = 'Rooms'.tr;
  int childCount = 0;
  int adultCount = 2;
  int roomcout = 1;

  bool istravellerVisible = false;
  bool isCancel = false;
  int infants = 0;
  // final flightDetailController=FlightDetailController();

  /// The default value is set to 200.
  late final double optionsMaxHeight = 100;
  late final double optionsMaxWidth = 100;
  late HomeOfferListModelClass userModel;
  bool loading = true;
  @override
  void onInit() {
    print(argumentData[1]);

    super.initState();
  }

  final homecontroler = Get.put(FlightController());
  // final homecontroler = Get.find<FlightController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(onPressed: (){},child: Icon(Icons.filter_list_outlined)),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Search Flight'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                mainBodyVisiblityContainer(),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Container mainBodyVisiblityContainer() {
    return    Container(
      child: SingleChildScrollView(
        child: Expanded(
          child: Container(
              width: double.infinity,
              height: Get.size.height ,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // RadioGroup()
                    //
                    SizedBox(
                      height:  Dimensions.textsize15,
                    ),
                    oneWayRadioButton(),
                    SizedBox(
                      height: 3,
                    ),
                    roundTripRadioButton(),
                    Stack(
                      children: [
                        oneWayVisiblityContainer(),
                        // RoundTripVisibilityContainer()
                        RoundTripVisibilityContainer(),

                        // RoundWayVisibilityContainer(
                        //   from: widget.from,
                        //   posts: [],
                        //   to: widget.to,
                        // )
                      ],
                    ),

                  ],
                ),
              )),
        ),
      ),
    );
  }

  Visibility RoundTripVisibilityContainer(
     ) {
    return Visibility(
      visible: isDoubleVisible,
      child: Expanded(
        child: Container(
            width: double.infinity,
            height: Get.size.height,
            child: Container(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:  Dimensions.fontSize14),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.size.height * 0.014,
                      ),
                      dropdownButton(context),
                      sizebox(),
                      Stack(children: [
                        Column(children: [
                          roundWay_flighTakoff_autoCompleteTextfield(),
                          sizebox(),
                          roundWay_flighLand_autoCompleteTextfield(),
                        ]),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.only(right:  Dimensions.padding27, top:  Dimensions.textsize15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                              boxShadow:  [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius:  Dimensions.padding8,
                                  spreadRadius: 0.01,

                                  offset: Offset(
                                      -3, 1), // shadow direction: bottom right
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            width: Get.size.width * 0.12,
                            height: Get.size.height * 0.12,
                            child: Row(children: [
                              SizedBox(
                                width: Dimensions.sizedbox2half,
                              ),
                              Icon(
                                Icons.arrow_upward,
                                size:  Dimensions.sizedbox21,
                              ),
                              Icon(
                                Icons.arrow_downward_sharp,
                                size: Dimensions.sizedbox21,
                              ),
                            ]),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: Get.size.height * 0.015,
                      ),
                      rangeCalender(),
                      SizedBox(
                        height: Get.size.height * 0.015,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: Get.size.height * 0.015,
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  istravellerVisible = !istravellerVisible;
                                });
                              },
                              child: travellerDropdownContainer(
                                  '${adultCount + childCount + infants}',
                                  Icons.perm_identity,)),
                          Stack(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: Dimensions.sizedboxWidth20),
                                  child: SearchButton()),
                              showTravellerRemoveAddVisisbiltyContainer(),
                            ],
                          )
                        ],

                      ),
                      SizedBox(height: Dimensions.paddingLeft10*2,),
                      Align(
                          alignment: Alignment.topLeft,
                          child: commonText(title: 'Need a place to stay?',size: 12,fontWeight: FontWeight.w600,)),
                      SizedBox(height: Dimensions.paddingLeft10,),
                      FeatureFlight(),
                      Align(
                          alignment: Alignment.topLeft,
                          child: commonText(title: 'Find the best accommodation for you.',size: 12,)),
                      SizedBox(height: Dimensions.paddingLeft10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: PColor.mainTextColor,width: 1),
                        ),
                        width: double.infinity,
                        height: Dimensions.fontSize18*2,
                        child: Center(child: commonText(title: 'View all',size: 12,)),
                      )
                      // autoCompleteTextField(),
                    ],

                  ),
                ),
              ),
            )),
      ),
    );
  }

  Visibility oneWayVisiblityContainer(
      ) {
    return Visibility(
      visible: isSingleVisible,
      child: Container(
          width: double.infinity,
          height: Get.size.height * 0.73,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.fontSize14),
            child: SingleChildScrollView(

              child: Column(
                children: [
                  sizebox(),
                  oneWayDropDown(context),
                  sizebox(),
                  Stack(
                    children: [
                      Column(
                        children: [
                          oneWay_flighTakoff_autoCompleteTextfield(),
                          sizebox(),
                          oneWay_flighLand_autoCompleteTextfield(),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: Dimensions.padding27, top: Dimensions.textsize15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                            boxShadow:  [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: Dimensions.padding8,
                                spreadRadius: 0.01,

                                offset: Offset(
                                    -3, 1), // shadow direction: bottom right
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          width: Get.size.width * 0.12,
                          height: Get.size.height * 0.12,
                          child: Row(children: [
                            SizedBox(
                              width: Dimensions.sizedbox2half,
                            ),
                            Icon(
                              Icons.arrow_upward,
                              size: Dimensions.sizedbox21,
                            ),
                            Icon(
                              Icons.arrow_downward_sharp,
                              size: Dimensions.sizedbox21,
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  // sizebox(),
                  SizedBox(
                    height: Get.size.height * 0.015,
                  ),
                  singleCalender(),
                  SizedBox(
                    height: Get.size.height * 0.015,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: Get.size.height * 0.015,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              istravellerVisible = !istravellerVisible;
                            });
                          },
                          child: oneway_travellerDropdownContainer(
                              '${adultCount + childCount + infants}',
                              Icons.perm_identity,)),
                      Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: Dimensions.fontSize20),
                              child: oneway_SearchButton()),
                          oneway_showTravellerRemoveAddVisisbiltyContainer(),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.paddingLeft10*2,),
                  Align(
                      alignment: Alignment.topLeft,
                      child: commonText(title: 'Need a place to stay?',size: 12,fontWeight: FontWeight.w600,)),
                  SizedBox(height: Dimensions.paddingLeft10,),
                  FeatureFlight(),
                  Align(
                      alignment: Alignment.topLeft,
                      child: commonText(title: 'Find the best accommodation for you.',size: 12,)),
                  SizedBox(height: Dimensions.paddingLeft10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: PColor.mainTextColor,width: 1),
                    ),
                    width: double.infinity,
                    height: Dimensions.fontSize18*2,
                    child: Center(child: commonText(title: 'View all',size: 12,)),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget rangeCalender() {
    return Container(
      height: Get.size.height * 0.075,
      decoration: BoxDecoration(
        // color: PColor.mainColor,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(2.5)),
      child: ListTile(
        onTap: () {
          flightController.chooseDateRangePicker();
        },
        leading:  Icon(
          Icons.calendar_month_outlined,
          color: PColor.mainTextColor,
          size: Dimensions.fontSize18,
        ),
        title: Row(
          children: [
            Obx(() => Text(
              DateFormat('dd-MM-yyyy')
                  .format(flightController.dateRange.value.start)
                  .toString(),
              style: TextStyle(color: Colors.black54, fontSize: Dimensions.border13),
            )),
            Obx(() => Text(
                " - " +
                    DateFormat("dd-MM-yyyy")
                        .format(flightController.dateRange.value.end)
                        .toString(),
                style: TextStyle(color: Colors.black54, fontSize: Dimensions.border13))),
          ],
        ),
      ),
    );
  }

  Container mainHeaderContainer() {
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.2,
      color: PColor.flightDetailMainHeaderContaienrColor,
      child: Column(children: [
        Padding(
          padding:  EdgeInsets.only(top: Dimensions.padding8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'from',
                  style:  TextStyle(color: Colors.white70, fontSize: Dimensions.border13),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white70,
                  size: 15,
                ),
                Text(
                  'to',
                  style: TextStyle(color: Colors.white70, fontSize:  Dimensions.border13),
                ),
              ]),
        ),
        Text(
          'Datas ( 14-09-2022 ) ',
          style: TextStyle(
              color: Colors.white, fontSize:  Dimensions.border13, fontWeight: FontWeight.w600),
        ),
        Text(
          'Adults 1 Childs 0 Infants 0',
          style: TextStyle(
              color: Colors.white, fontSize:  Dimensions.border13, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: Get.size.height * 0.01,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal:  Dimensions.paddingLeft10),
            width: double.infinity,
            height: Get.size.height * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.white,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:  Dimensions.textsize15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Modify Search',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize:  Dimensions.border13,
                          fontWeight: FontWeight.w600),
                    ),
                    isVisible
                        ? const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black54,
                    )
                        : const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.black54,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  // Container backtoSearchButton() {
  //   return Container(
  //     width: Get.size.width * 0.33,
  //     height: Get.size.height * 0.046,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(2),
  //       color: Colors.black,
  //     ),
  //     child: const Align(
  //       alignment: Alignment.center,
  //       child: Text(
  //         'Back To Search',
  //         style: TextStyle(
  //             color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900),
  //       ),
  //     ),
  //   );
  // }

  Container oneWayDropDown(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.size.height * 0.04,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( Dimensions.sizedbox2half),
          border: Border.all(
            color: Colors.grey.shade500.withOpacity(0.6),
            width: 0.5,
          )),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          style: TextStyle(color: Colors.transparent),
          buttonDecoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade500.withOpacity(0.6),
                width: 0.5,
              )),
          hint: Padding(
            padding:  EdgeInsets.symmetric(horizontal:  Dimensions.sizedboxWidth6),
            child: Text(
              'Economy',
              style: TextStyle(
                fontSize:  Dimensions.border13,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          items: listitem
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:  Dimensions.sizedboxWidth6),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item,
                  style:  TextStyle(
                      fontSize:  Dimensions.border13, color: Colors.black54),
                ),
              ),
            ),
          ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonElevation: 0,
          dropdownElevation: 0,
          buttonHeight:  Dimensions.fontSize20,
          buttonWidth: 0,
          dropdownMaxHeight:  Dimensions.height200,
          isExpanded: true,
          itemHeight:  Dimensions.padding27,
          dropdownDecoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade400.withOpacity(0.7),
                width: 0.7,
              )),
        ),
      ),
    );
  }

  Container dropdownButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.size.height * 0.04,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.sizedbox2half),
          border: Border.all(
            color: Colors.grey.shade500.withOpacity(0.6),
            width: 0.5,
          )),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          style: TextStyle(color: Colors.transparent),
          buttonDecoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade500.withOpacity(0.6),
                width: 0.5,
              )),
          hint: Padding(
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.sizedboxWidth6),
            child: Text(
              'Economy',
              style: TextStyle(
                fontSize: Dimensions.border13,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          items: listitem
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item,
                  style:  TextStyle(
                      fontSize: Dimensions.border13, color: Colors.black54),
                ),
              ),
            ),
          ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonElevation: 0,
          dropdownElevation: 0,
          buttonHeight: Dimensions.fontSize20,
          buttonWidth: 0,
          dropdownMaxHeight: Dimensions.height200,
          isExpanded: true,
          itemHeight: Dimensions.padding27,
          dropdownDecoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade400.withOpacity(0.7),
                width: 0.7,
              )),
        ),
      ),
    );
  }

  Widget SearchButton() {
    return MaterialButton(
      height: Get.size.height * 0.065,
      minWidth: double.infinity,
      color: PColor.mainTextColor,
      // color:Color(0xff1EC38B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.sizedbox2half)),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: Dimensions.paddingLeft10*2,
          ),
          SizedBox(
            width: Dimensions.sizedbox5,
          ),
          SmallText(
            title: 'Serach',
            size: Dimensions.textsize15,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget oneway_SearchButton() {
    return MaterialButton(
      height: Get.size.height * 0.075,
      minWidth: double.infinity,
      color: PColor.mainTextColor,
      // color:Color(0xff1EC38B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.sizedbox2half)),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: Dimensions.paddingLeft10*2,
          ),
          SizedBox(
            width: Dimensions.sizedbox5,
          ),
          SmallText(
            title: 'Serach',
            size: Dimensions.textsize15,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget travellerDropdownContainer(String hint, IconData icon) {
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        // color: color,
        borderRadius: BorderRadius.circular(Dimensions.sizedbox2half),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.textsize15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: PColor.mainTextColor,
              size:Dimensions.border13*2,

            ),
            Padding(
                padding: EdgeInsets.only(left: Dimensions.paddingLeft10),
                child: SmallText(
                  title: hint,
                )),
            Text('    '),
            // Icon(
            //   Icons.keyboard_arrow_down,
            //   color: Colors.grey,
            // )
          ],
        ),
      ),
    );
  }

  Widget oneway_travellerDropdownContainer(String hint, IconData icon) {
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        // color: color,
        borderRadius: BorderRadius.circular(2.5),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.textsize15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color:PColor.mainTextColor,
              size: Dimensions.border13*2,
            ),
            Padding(
                padding: EdgeInsets.only(left: Dimensions.paddingLeft10),
                child: SmallText(
                  title: hint,
                )),
            Text('    '),
            // Icon(
            //   Icons.keyboard_arrow_down,
            //   color: Colors.grey,
            // )
          ],
        ),
      ),
    );
  }

  Container oneWay_flighLand_autoCompleteTextfield() {
    return Container(
      height: Get.size.height * 0.08,
      child: Autocomplete<FeaturedFlight>(
        // check now the giving strng and matching string are match or not
          optionsBuilder: (TextEditingValue value) {
            // if (value.text.isEmpty) {
            //   return List.empty();
            // }
            return controller.modal.value.featuredFlights!
                .where((element) => element.to!
                .toLowerCase()
                .contains(value.text.toLowerCase()))
                .toList();
          },
          fieldViewBuilder: (BuildContext context,
              TextEditingController controller,
              FocusNode node,
              Function onSubmit) =>
              TextFormField(
                cursorColor: Colors.black54,
                controller: controller,
                focusNode: node,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(left: 10, top: 40, right: 10),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        controller.clear();
                      });
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ),
                  // enabledBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(width: 3, color: Colors.amber),
                  // ),
                  prefix:  Padding(
                    padding:  EdgeInsets.only(right: 10),
                    child:  Icon(
                      Icons.flight_land_outlined,
                      color: PColor.mainTextColor,
                      size: 17,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.black54, width: 0.7),
                    // borderRadius: BorderRadius.circular(25.0),
                  ),
                  border: const OutlineInputBorder(),
                ),
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
          onSelected: (value) => print((value.to)),
          optionsViewBuilder: (BuildContext context, Function onSelect,
              Iterable<FeaturedFlight> dataList) {
            return Expanded(
              child: Container(
                decoration: BoxDecoration(),
                child: Material(
                  elevation: 30,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: dataList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      FeaturedFlight d = dataList.elementAt(index);
                      {
                        return InkWell(
                          onTap: () => onSelect(d),
                          child: Container(
                              height: Get.size.height * 0.07,
                              margin: EdgeInsets.only(right: 27),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.6, color: Colors.grey.shade200)),
                              child: Container(
                                width: Get.size.width,
                                height: Get.size.height * 0.07,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 6, right: 6),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                   Icon(
                                                    Icons.flight_land_outlined,
                                                    color: PColor.mainTextColor,
                                                    size: 17,
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      SmallText(
                                                        title: d.title,
                                                      ),
                                                      SmallText(
                                                        title: d.to,
                                                        color: Colors.black54,
                                                        size: 11,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: Get.size.width * 0.12,
                                            height: Get.size.height * 0.05,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(2),
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width: 0.8),
                                            ),
                                            child: SmallText(
                                              title: '${d.to}',
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              )),
                        );
                      }
                    },
                  ),
                ),
              ),
            );
          },
          initialValue: TextEditingValue(text: 'to'),

          // display data from api
          displayStringForOption: (
              FeaturedFlight d,
              ) {
            return "${d.title} - ${d.to}";
          }

        // to costomize fieldviewBuilder
        // fieldViewBuilder: ,
        // that method is used to call back when user click text then tap
        // onSelected: ,
        // to customize drop down in
        // optionsViewBuilder: ,
      ),
    );
  }

  Container roundWay_flighLand_autoCompleteTextfield( ) {
    return Container(
      height: Get.size.height * 0.08,
      child: Autocomplete<FeaturedFlight>(
        // check now the giving strng and matching string are match or not
          optionsBuilder: (TextEditingValue value) {
            // if (value.text.isEmpty) {
            //   return List.empty();
            // }
            return controller.modal.value.featuredFlights!
                .where((element) => element.to!
                .toLowerCase()
                .contains(value.text.toLowerCase()))
                .toList();
          },
          fieldViewBuilder: (BuildContext context,
              TextEditingController controller,
              FocusNode node,
              Function onSubmit) =>
              TextFormField(
                cursorColor: Colors.black54,
                controller: controller,
                focusNode: node,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(left: 10, top: 40, right: 10),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        controller.clear();
                      });
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ),
                  // enabledBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(width: 3, color: Colors.amber),
                  // ),
                  prefix:  Padding(
                    padding:  EdgeInsets.only(right: 10),
                    child:  Icon(
                      Icons.flight_land_outlined,
                      color: PColor.mainTextColor,
                      size: 17,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.black54, width: 0.7),
                    // borderRadius: BorderRadius.circular(25.0),
                  ),
                  border: const OutlineInputBorder(),
                ),
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
          onSelected: (value) => print((value.to)),
          optionsViewBuilder: (BuildContext context, Function onSelect,
              Iterable<FeaturedFlight> dataList) {
            return Container(
              decoration: BoxDecoration(),
              child: Material(
                elevation: 30,
                child: ListView.builder(
                  itemCount: dataList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    FeaturedFlight d = dataList.elementAt(index);
                    {
                      return InkWell(
                        onTap: () => onSelect(d),
                        child: Container(
                            height: Get.size.height * 0.07,
                            margin: EdgeInsets.only(right: 27),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.6, color: Colors.grey.shade200)),
                            child:
                            // ListTile(
                            //   trailing: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: Container(
                            //       width: Get.size.width * 0.12,
                            //       height: Get.size.height * 0.05,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(2),
                            //         border: Border.all(
                            //             color: Colors.grey.shade300, width: 0.8),
                            //       ),
                            //       child: SmallText(
                            //         title: '${d.from}',
                            //       ),
                            //     ),
                            //   ),
                            //   // title: SmallText(
                            //   //   title: d.title,
                            //   // ),
                            //   title: Column(
                            //     children: [
                            //       Row(children: [
                            //         const Icon(
                            //           Icons.flight_takeoff,
                            //           color: Colors.black54,
                            //         ),
                            //         SizedBox(
                            //           width: 20,
                            //         ),
                            //         SmallText(
                            //           title: d.title,
                            //         ),
                            //       ]),
                            //       Row(
                            //           crossAxisAlignment: CrossAxisAlignment.center,
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: [
                            //             SmallText(
                            //               title: d.from,
                            //               size: 10,
                            //             ),
                            //             Text(' , '),
                            //             SmallText(
                            //               title: d.to,
                            //               size: 10,
                            //             ),
                            //           ]),
                            //     ],
                            //   ),
                            //   // leading: const Icon(
                            //   //   Icons.flight_takeoff,
                            //   //   color: Colors.black54,
                            //   // ),
                            //   // subtitle: Align(
                            //   //   alignment: Alignment.center,
                            //   //   child: Row(children: [
                            //   //     SmallText(
                            //   //       title: d.from,
                            //   //       size: 10,
                            //   //     ),
                            //   //     Text(' , '),
                            //   //     SmallText(
                            //   //       title: d.to,
                            //   //       size: 10,
                            //   //     ),
                            //   //   ]),
                            //   // ),
                            // ),

                            Container(
                              width: Get.size.width,
                              height: Get.size.height * 0.07,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 6, right: 6),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                 Icon(
                                                  Icons.flight_land_outlined,
                                                  color: PColor.mainTextColor,
                                                  size: 17,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    SmallText(
                                                      title: d.title,
                                                    ),
                                                    SmallText(
                                                      title: d.to,
                                                      color: Colors.black54,
                                                      size: 11,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: Get.size.width * 0.12,
                                          height: Get.size.height * 0.05,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(2),
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 0.8),
                                          ),
                                          child: SmallText(
                                            title: '${d.to}',
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            )),
                      );
                    }
                  },
                ),
              ),
            );
          },
          initialValue: TextEditingValue(text: 'to'),

          // display data from api
          displayStringForOption: (
              FeaturedFlight d,
              ) {
            return "${d.title} - ${d.to}";
          }

        // to costomize fieldviewBuilder
        // fieldViewBuilder: ,
        // that method is used to call back when user click text then tap
        // onSelected: ,
        // to customize drop down in
        // optionsViewBuilder: ,
      ),
    );
  }

  Container roundWay_flighTakoff_autoCompleteTextfield() {
    return Container(
      height: Get.size.height * 0.08,
      child: Autocomplete<FeaturedFlight>(
          optionsMaxHeight: optionsMaxHeight,

          // check now the giving strng and matching string are match or not
          optionsBuilder: (TextEditingValue value) {
            // if (value.text.isEmpty) {
            //   return List.empty();
            // }
            return controller.modal.value.featuredFlights!
                .where((element) => element.from!
                .toLowerCase()
                .contains(value.text.toLowerCase()))
                .toList();
          },
          fieldViewBuilder: (BuildContext context,
              TextEditingController controller,
              FocusNode node,
              Function onSubmit) =>
              TextFormField(
                cursorColor: Colors.black54,
                controller: controller,
                focusNode: node,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(left: 10, top: 40, right: 10),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        controller.clear();
                      });
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ),
                  // enabledBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(width: 3, color: Colors.amber),
                  // ),
                  prefix:  Padding(
                    padding:  EdgeInsets.only(right: 10),
                    child:  Icon(
                      Icons.flight_takeoff,
                      color: PColor.mainTextColor,
                      size: 17,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.black54, width: 0.7),
                    // borderRadius: BorderRadius.circular(25.0),
                  ),
                  border: const OutlineInputBorder(),
                ),
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
          onSelected: (value) => print((value.from)),
          optionsViewBuilder: (BuildContext context, Function onSelect,
              Iterable<FeaturedFlight> dataList) {
            return Container(
              decoration: BoxDecoration(),
              child: Material(
                elevation: 30,
                child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    FeaturedFlight d = dataList.elementAt(index);
                    {
                      return InkWell(
                        onTap: () => onSelect(d),
                        child: Container(
                            margin: EdgeInsets.only(right: 27),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.6, color: Colors.grey.shade200)),
                            child:
                            // ListTile(
                            //   trailing: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: Container(
                            //       width: Get.size.width * 0.12,
                            //       height: Get.size.height * 0.05,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(2),
                            //         border: Border.all(
                            //             color: Colors.grey.shade300, width: 0.8),
                            //       ),
                            //       child: SmallText(
                            //         title: '${d.from}',
                            //       ),
                            //     ),
                            //   ),
                            //   // title: SmallText(
                            //   //   title: d.title,
                            //   // ),
                            //   title: Column(
                            //     children: [
                            //       Row(children: [
                            //         const Icon(
                            //           Icons.flight_takeoff,
                            //           color: Colors.black54,
                            //         ),
                            //         SizedBox(
                            //           width: 20,
                            //         ),
                            //         SmallText(
                            //           title: d.title,
                            //         ),
                            //       ]),
                            //       Row(
                            //           crossAxisAlignment: CrossAxisAlignment.center,
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: [
                            //             SmallText(
                            //               title: d.from,
                            //               size: 10,
                            //             ),
                            //             Text(' , '),
                            //             SmallText(
                            //               title: d.to,
                            //               size: 10,
                            //             ),
                            //           ]),
                            //     ],
                            //   ),
                            //   // leading: const Icon(
                            //   //   Icons.flight_takeoff,
                            //   //   color: Colors.black54,
                            //   // ),
                            //   // subtitle: Align(
                            //   //   alignment: Alignment.center,
                            //   //   child: Row(children: [
                            //   //     SmallText(
                            //   //       title: d.from,
                            //   //       size: 10,
                            //   //     ),
                            //   //     Text(' , '),
                            //   //     SmallText(
                            //   //       title: d.to,
                            //   //       size: 10,
                            //   //     ),
                            //   //   ]),
                            //   // ),
                            // ),

                            Container(
                              width: Get.size.width,
                              height: Get.size.height * 0.07,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 6, right: 6),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                 Icon(
                                                  Icons.flight_takeoff,
                                                  color: PColor.mainTextColor,
                                                  size: 17,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    SmallText(
                                                      title: d.title,
                                                    ),
                                                    SmallText(
                                                      title: d.from,
                                                      color: Colors.black54,
                                                      size: 11,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: Get.size.width * 0.12,
                                          height: Get.size.height * 0.05,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(2),
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 0.8),
                                          ),
                                          child: SmallText(
                                            title: '${d.from}',
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            )),
                      );
                    }
                  },
                ),
              ),
            );
          },
          initialValue: TextEditingValue(text: 'from'),

          // display data from api
          displayStringForOption: (
              FeaturedFlight d,
              ) {
            return "${d.title} - ${d.from}";
          }

        // to costomize fieldviewBuilder
        // fieldViewBuilder: ,
        // that method is used to call back when user click text then tap
        // onSelected: ,
        // to customize drop down in
        // optionsViewBuilder: ,
      ),
    );
  }

  Container oneWay_flighTakoff_autoCompleteTextfield() {
    return
      Container(
        height: Get.size.height * 0.08,
        child: Autocomplete<FeaturedFlight>(
            optionsMaxHeight: optionsMaxHeight,

            // check now the giving strng and matching string are match or not
            optionsBuilder: (TextEditingValue value) {
              // if (value.text.isEmpty) {
              //   return List.empty();
              // }
              return controller.modal.value.featuredFlights!
                  .where((element) => element.from!
                  .toLowerCase()
                  .contains(value.text.toLowerCase()))
                  .toList();
            },
            fieldViewBuilder: (BuildContext context,
                TextEditingController controller,
                FocusNode node,
                Function onSubmit) =>
                TextFormField(
                  cursorColor: Colors.black54,
                  controller: controller,
                  focusNode: node,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.only(left: 10, top: 40, right: 10),
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          controller.clear();
                        });
                      },
                      child: const Icon(
                        Icons.clear,
                        color: Colors.black54,
                        size: 16,
                      ),
                    ),
                    // enabledBorder: const OutlineInputBorder(
                    //   borderSide: BorderSide(width: 3, color: Colors.amber),
                    // ),
                    prefix:  Padding(
                      padding:  EdgeInsets.only(right: 10),
                      child:  Icon(
                        Icons.flight_takeoff,
                        color: PColor.mainTextColor,
                        size: 17,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.black54, width: 0.7),
                      // borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
            onSelected: (value) => print((value.from)),
            optionsViewBuilder: (BuildContext context, Function onSelect,
                Iterable<FeaturedFlight> dataList) {
              return Container(
                decoration: BoxDecoration(),
                child: Material(
                  elevation: 30,
                  child: ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      FeaturedFlight d = dataList.elementAt(index);
                      {
                        return InkWell(
                          onTap: () => onSelect(d),
                          child: Container(
                              margin: EdgeInsets.only(right: 27),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.6, color: Colors.grey.shade200)),
                              child: Container(
                                width: Get.size.width,
                                height: Get.size.height * 0.07,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 6, right: 6),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                   Icon(
                                                    Icons.flight_takeoff,
                                                    color: PColor.mainTextColor,
                                                    size: 17,
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      SmallText(
                                                        title: d.title,
                                                      ),
                                                      SmallText(
                                                        title: d.from,
                                                        color: Colors.black54,
                                                        size: 11,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: Get.size.width * 0.12,
                                            height: Get.size.height * 0.05,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(2),
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width: 0.8),
                                            ),
                                            child: SmallText(
                                              title: '${d.from}',
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              )),
                        );
                      }
                    },
                  ),
                ),
              );
            },
            initialValue: TextEditingValue(text: 'from'),

            // display data from api
            displayStringForOption: (
                FeaturedFlight d,
                ) {
              return "${d.title} - ${d.from}";
            }

          // to costomize fieldviewBuilder
          // fieldViewBuilder: ,
          // that method is used to call back when user click text then tap
          // onSelected: ,
          // to customize drop down in
          // optionsViewBuilder: ,
        ),
      );
  }

  InkWell roundTripRadioButton() {
    return InkWell(
      onTap: () {
        setState(() {
          isDoubleVisible = !isDoubleVisible;
          isSingleVisible = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          children: [
            Container(
              width: Get.size.width * 0.035,
              height: Get.size.height * 0.035,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: isDoubleVisible
                    ? Border.all(
                  color: PColor.mainTextColor,
                  width: 3.4,
                )
                    : Border.all(color: Colors.grey.shade400, width: 0.9),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            SmallText(
              title: 'Round Trip',
              weight: FontWeight.w600,
              size: 12.5,
            )
          ],
        ),
      ),
    );
  }

  InkWell oneWayRadioButton() {
    return InkWell(
      onTap: () {
        setState(() {
          isSingleVisible = !isSingleVisible;
          isDoubleVisible = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          children: [
            Container(
              width: Get.size.width * 0.035,
              height: Get.size.height * 0.035,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: isSingleVisible
                    ? Border.all(
                  color: PColor.mainTextColor,
                  width: 3.4,
                )
                    : Border.all(color: Colors.grey.shade400, width: 0.9),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            SmallText(
              title: 'One Way',
              weight: FontWeight.w600,
              size: 12.5,
            )
          ],
        ),
      ),
    );
  }

  SizedBox sizebox() {
    return SizedBox(
      height: Get.size.height * 0.015,
    );
  }

  Widget showTravellerRemoveAddVisisbiltyContainer() {
    return Visibility(
      visible: istravellerVisible,
      child: Container(
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
        height: Get.size.height * 0.35,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              visibilityContainerRow(
                'Adults',
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
                },
                Icons.person_outline_outlined,
                '+12',
              ),
              visibilityContainerRow(
                'Childs',
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
                Icons.girl,
                '2- 11',
              ),
              visibilityContainerRow(
                'Infants',
                    () {
                  setState(() {
                    infants++;
                  });
                },
                '${infants}',
                    () {
                  setState(() {
                    infants <= 0 ? infants = 0 : infants--;
                  });
                },
                Icons.girl,
                '-2',
              ),

              // dropdownButton
            ],
          ),
        ),
      ),
    );
  }

  Widget oneway_showTravellerRemoveAddVisisbiltyContainer() {
    return Visibility(
      visible: istravellerVisible,
      child: Container(
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
        height: Get.size.height * 0.35,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              visibilityContainerRow(
                'Adults',
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
                },
                Icons.person_outline_outlined,
                '+12',
              ),
              visibilityContainerRow(
                'Childs',
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
                Icons.girl,
                '2- 11',
              ),
              visibilityContainerRow(
                'Infants',
                    () {
                  setState(() {
                    infants++;
                  });
                },
                '${infants}',
                    () {
                  setState(() {
                    infants <= 0 ? infants = 0 : infants--;
                  });
                },
                Icons.girl,
                '-2',
              ),

              // dropdownButton
            ],
          ),
        ),
      ),
    );
  }

  Widget visibilityContainerRow(String title, Function() plusCount, String hint,
      Function() minusCount, IconData visibleContainerIcon, String number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Icon(
                    visibleContainerIcon,
                    color: Colors.black54,
                    size: 17,
                  ),
                  Align(
                      child: SmallText(
                        title: number,
                        color: Colors.black54,
                        size: 10,
                      ))
                ],
              ),
              const SizedBox(
                width: 4,
              ),
              SmallText(
                title: title,
                color: Colors.black54,
              ),
            ],
          ),
        ),
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
                  width: Get.size.width * 0.084,
                  height: Get.size.height * 0.084,
                  child: InkWell(
                      onTap: minusCount,
                      child: Center(
                          child: PlusMinus(
                            title: '-',
                            size: 30,
                          ))),
                ),
                // Container(
                //     width: 35,
                //     height: 25,
                //     child: TextField(
                //       decoration: InputDecoration(
                //           hintText: '$adultCount',
                //           border: InputBorder.none),
                //     )),
                Text(hint),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: PColor.mainColor.withOpacity(0.6),
                    ),
                    width: Get.size.width * 0.084,
                    height: Get.size.height * 0.084,
                    child: InkWell(
                        child: Center(
                          child: InkWell(
                              onTap: plusCount,
                              child: PlusMinus(
                                title: '+',
                                size: 24,
                              )),
                        )))
              ],
            )),
      ],
    );
  }

  Widget singleCalender() {
    return Container(
      height: Get.size.height * 0.076,
      decoration: BoxDecoration(
        // color: PColor.mainColor,
          border: Border.all(color: Colors.grey, width: 0.7),
          borderRadius: BorderRadius.circular(2.2)),
      child: ListTile(
        onTap: () {
          flightControler.flightChoseDate();
        },
        leading:  Icon(
          Icons.calendar_month_outlined,
          color:PColor.mainTextColor,
          size: 17,
        ),
        title: Row(
          children: [
            Obx(() => Align(
              alignment: Alignment.centerLeft,
              child: Text(
                DateFormat('dd-MM-yyyy')
                    .format(flightControler.selectedDate())
                    .toString(),
                style: TextStyle(
                  color: Colors.black54.withOpacity(
                    0.5,
                  ),
                  fontSize: 13,
                ),
              ),
            )),
            // Obx(() => Text(" - " +
            //     DateFormat("dd-MM-yyyy")
            //         .format(homecontroler.dateRange.value.end)
            //         .toString())),
          ],
        ),
      ),
    );
  }
/*
  Widget showTravellerRemoveAddVisisbiltyContainer() {
    return Visibility(
      visible: isVisible,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200, width: 0.7),
          borderRadius: BorderRadius.circular(8.0),
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
        height: Get.size.height * 0.43,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              visibilityContainerRow(
                  'Rooms'.tr,
                  () {
                    setState(() {
                      roomcout++;
                    });
                  },
                  '${roomcout}',
                  () {
                    setState(() {
                      roomcout <= 0 ? roomcout = 0 : roomcout--;
                    });
                  },
                  Icons.bedroom_child_sharp),
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
                  },
                  Icons.person_outline_outlined),
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
                  Icons.woman),
              SizedBox(
                height: 4,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: commonText(
                    title: 'nationality'.tr,
                    fontWeight: FontWeight.bold,
                    size: 18,
                  )),
              // dropdownButton
              dropDownButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDownButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Container(
        width: double.infinity,
        height: Get.size.height * 0.074,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: PColor.mainColor,
        ),
        child: Center(
          child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.wordpress_rounded,
                  color: Colors.grey,
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(right: 6),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  size: 33.0,
                ),
              ),
              isExpanded: true,
              // style: TextStyle(color: PColor.mainblueColor),
              // underline: SizedBox(),
              // icon: Visibility (visible:false, child: Icon(Icons.arrow_downward)),
              value: valueChose,
              items: listitem.map<DropdownMenuItem<String>>((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  valueChose = value!;
                });
              }),
        ),
      ),
    );
  }

  Widget visibilityContainerRow(String title, Function() plusCount, String hint,
      Function() minusCount, IconData visibleContainerIcon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: Row(
          children: [
            Icon(
              visibleContainerIcon,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 15),
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
              width: Get.size.width * 0.084,
              height: Get.size.height * 0.084,
              child: InkWell(
                  onTap: minusCount,
                  child: Center(
                      child: PlusMinus(
                    title: '-',
                    size: 30,
                  ))),
            ),
            // Container(
            //     width: 35,
            //     height: 25,
            //     child: TextField(
            //       decoration: InputDecoration(
            //           hintText: '$adultCount',
            //           border: InputBorder.none),
            //     )),
            Text(hint),
            Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: PColor.mainColor.withOpacity(0.6),
                ),
                width: Get.size.width * 0.084,
                height: Get.size.height * 0.084,
                child: InkWell(
                    child: Center(
                  child: InkWell(
                      onTap: plusCount,
                      child: PlusMinus(
                        title: '+',
                        size: 24,
                      )),
                )))
          ],
        )),
      ],
    );
  }

  Widget rangeCalender() {
    return Container(
      decoration: BoxDecoration(
          // color: PColor.mainColor,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(6)),
      child: ListTile(
        onTap: () {
          homecontroler.chooseDateRangePicker();
        },
        leading: const Icon(
          Icons.calendar_month_outlined,
          color: Colors.grey,
        ),
        title: Row(
          children: [
            Obx(() => Text(DateFormat('dd-MM-yyyy')
                .format(homecontroler.dateRange.value.start)
                .toString())),
            Obx(() => Text(" - " +
                DateFormat("dd-MM-yyyy")
                    .format(homecontroler.dateRange.value.end)
                    .toString())),
          ],
        ),
      ),
    );
  }

  Widget SearchButton() {
    return MaterialButton(
      height: Get.size.height * 0.06,
      minWidth: double.infinity,
      color: PColor.mainTextColor,
      // color:Color(0xff1EC38B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      onPressed: () {},
      child: Text(
        'Search'.tr,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17.5,
            letterSpacing: 1),
      ),
    );
  }

  Widget travellerDropdownContainer(String hint, IconData icon) {
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        // color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    hint,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }*/
}

class ReusableEditText extends StatelessWidget {
  String? title;
  // const ReusableEditText({super.key});
  ReusableEditText({this.title});
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.location_on_outlined,
            color: Colors.grey,
          ),
          fillColor: PColor.mainColor,
          filled: true,
          border: OutlineInputBorder(),
          hintText: title,
          suffixIcon: Icon(
            Icons.arrow_drop_down,
            size: 30,
          )),
    );
  }
}
