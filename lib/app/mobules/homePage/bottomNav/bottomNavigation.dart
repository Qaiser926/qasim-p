import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/authentication/agents/agentsLogin.dart';
import 'package:phptravelapp/app/mobules/authentication/agents/agentsSignup.dart';
import 'package:phptravelapp/app/mobules/authentication/customer/customerLogin.dart';
import 'package:phptravelapp/app/mobules/authentication/customer/customerSignup.dart';
import 'package:phptravelapp/app/mobules/authentication/supplier/supplierLogin.dart';
import 'package:phptravelapp/app/mobules/authentication/supplier/supplierSignup.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeView/homeView.dart';
import 'package:phptravelapp/app/mobules/homePage/component/drawer/drawer.dart';
import 'package:phptravelapp/phptravele_all_module/services/api_client/main_apiClient.dart';
import 'package:phptravelapp/reusableText/dimensions.dart';
import 'package:phptravelapp/testingPage/TravleHomePageTester.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int currentIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeViewPage(),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('travel', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        toolbarHeight: Dimensions.containerHeight65,
        surfaceTintColor: PColor.mainColor.withOpacity(0.6),
        backgroundColor: PColor.mainColor.withOpacity(0.1),
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: Dimensions.height6),
          child: Image.network(
            imgurl,
            width: Dimensions.containerHeight65 * 2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                decoration: BoxDecoration(
                    // color: PColor.mainIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.padding8),
                  child: Icon(Icons.notifications_none),
                )),
          ),
        ],
      ),
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
            unselectedItemColor: Colors.white54,
            selectedItemColor: Colors.white,
            backgroundColor: PColor.mainTextColor,
            selectedFontSize: Dimensions.fontSize16,
            type: BottomNavigationBarType.fixed,

            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "bottomnav1".tr,
                backgroundColor: PColor.mainTextColor,
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  label: "bottomnav2".tr,
                  backgroundColor: PColor.mainTextColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.directions_walk,
                    color: Colors.white,
                  ),
                  label: "bottomnav3".tr,
                  backgroundColor: PColor.mainTextColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: "bottomnav4".tr,
                  backgroundColor: PColor.mainTextColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                decoration: BoxDecoration(
                    color: PColor.mainIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: InkWell(
                  //     onTap: () {
                  //       Get.to(DataFilteration());
                  //     },
                  //     child: Icon(Icons.menu)),
                )),
          ),
          Text(
            '       ',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 17),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                decoration: BoxDecoration(
                    color: PColor.mainIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications_none),
                )),
          ),
        ],
      ),
    );
  }

  bool isSelect = false;
  bool selected = true;
  String code = 'USD';
  Widget drawer() {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffe9ecef),
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xffe9ecef)),
              accountName: Text(
                " ",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              accountEmail: Text(
                "",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              currentAccountPictureSize: Size.square(50),
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          SizedBox(
            height: 10,
          ),
          ListTile(
              // leading: const Icon(Icons.currency_exchange),
              // title: DropDownPage,(),
              title: DropDownSearch(), // title: CurrencyChanger(),
              onTap: null),
          SizedBox(
            height: 10,
          ),
          ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: const Icon(Icons.currency_exchange_outlined),
              ),
              // title: DropDownPage(),
              // title: CurrencyChanger(),
              title: Text(code),

              // title: LanguageChange(),
              onTap: () {
                showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        controller: ModalScrollController.of(context),
                        child: Container(
                          height: Dimensions.height600,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.white,
                                // height: Get.size.height * 0.74,
                                child: Container(
                                  height: Dimensions.height600,
                                  // height: Get.size.height * 0,
                                  child: FutureBuilder<HomeOfferListModelClass>(
                                    future: HomeOffListApiProvider()
                                        .mainEndPointGetData(),
                                    builder: (context, snapshot) {
                                      // if(snapshot.connectionState==ConnectionState.waiting){
                                      //   return Center(child: CircularProgressIndicator());
                                      // }
                                      final item = snapshot.data?.currencies;

                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }

                                      return Container(
                                        child: ListView.builder(
                                          // controller: controller,
                                          itemCount: currencyList.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              //     CircleAvatar(
                                              //   backgroundImage: AssetImage(countryImage[index]),
                                              // ),

                                              title: isSelect
                                                  ? Text(
                                                      item![index].toString(),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18),
                                                    )
                                                  : Text(
                                                      item![index]
                                                          .name
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    ),
                                              onTap: () {
                                                Get.back();
                                                setState(() {
                                                  code = item[index]
                                                      .name
                                                      .toString();

                                                  // ignore: unrelated_type_equality_checks
                                                });
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }),

          /*  DropdownSearch<UserModels>(
            popupProps: PopupProps.dialog(
              // fit: FlexFit.loose,
              scrollbarProps: ScrollbarProps(crossAxisMargin: 8),

              constraints: BoxConstraints(maxHeight: 200, maxWidth: 100),
            ),
            dropdownDecoratorProps: const DropDownDecoratorProps(
              textAlign: TextAlign.right,
              dropdownSearchDecoration: InputDecoration(
                enabledBorder: InputBorder.none,
                //disabledBorder: InputBorder.none,
                icon: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Icon(
                    Icons.flag,
                  ),
                ),
                hoverColor: Colors.amber,

                labelText: 'Coutry/Region',
                helperText: 'pakistan',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),

            asyncItems: (filter) => getdata(filter),
            compareFn: (i, s) => i.isEqual(s),

            // },
            onChanged: (UserModels? data) {
              print(data);
            },
          ), */

          SizedBox(
            height: 10,
          ),
          ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: const Icon(Icons.login),
              ),
              // title: DropDownPage(),
              // title: Athentication(),
              // title: AuthPage(),
              title: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // SizedBox(
                        //   width: Get.size.width * 0.09,
                        // ),
                        Text(
                          'Account',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          title: Text('Customer Login'),
                          onTap: () {
                            Get.to(CustomerLoginPage());
                          },
                        ),
                        ListTile(
                          title: Text('Customer Signup'),
                          onTap: () {
                            Get.to(CustomerSignupPage());
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.fontSize20),
                          child: Divider(color: Colors.grey),
                        ),
                        ListTile(
                          title: Text('Agents Login'),
                          onTap: () {
                            Get.to(AgentsLogin());
                          },
                        ),
                        ListTile(
                          title: Text('Agents Signup'),
                          onTap: () {
                            Get.to(AgentsSignupPage());
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.fontSize20),
                          child: Divider(color: Colors.grey),
                        ),
                        ListTile(
                          title: Text('Supplier Login'),
                          onTap: () {
                            Get.to(SupplierLogin());
                          },
                        ),
                        ListTile(
                          title: Text('Supplier Signup'),
                          onTap: () {
                            Get.to(SupplierSignup());
                          },
                        ),
                      ],
                    );
                  },
                );
              }),

          SizedBox(
            height: 10,
          ),
          // ListTile(
          //   // leading: const Icon(Icons.login),
          //   // title: DropDownPage(),
          //   title: BottomSheetDropDown(),
          //   onTap: () {
          //     // builddialog(context);
          //   },
          // ),

          /*  Container(
            height: Get.size.height * 0.4,
            child: ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                // itemCount: controller.modal.value.languages!.length,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index)
                    // DataPopUp(data[index]),

                    {
                  return Card(
                    child: ExpansionTile(
                      onExpansionChanged: (v) {},
                      title: Text(
                        controller.modal.value.languages![index].name
                            .toString(),
                      ),
                      children: [
                        Container(
                          height: Get.size.height * 0.2,
                          child: ListView.builder(
                            // shrinkWrap: true,
                            // physics: AlwaysScrollableScrollPhysics(),
                            itemCount: controller.modal.value.languages!.length,
                            itemBuilder: (context, position) {
                              return InkWell(
                                onTap: () {
                                  print('index is: ${index}');
                                },
                                child: Text(controller
                                    .modal.value.languages![position].name
                                    .toString()),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
 */
          // ListTile(
          //   leading: const Icon(Icons.currency_exchange_rounded),
          //   title:ChangeCurreny(),
          //   // title: Text('change cuurendcy'),
          //   onTap: () {
          //
          //   },
          // ),
        ],
      ),
      //Deawer
    );
  }
}
