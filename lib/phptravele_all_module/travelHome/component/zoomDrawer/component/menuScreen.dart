import 'package:flutter/material.dart';
import 'package:phptravelapp/app/mobules/homePage/component/drawer/drawer.dart';
import 'package:phptravelapp/reusableText/commonText.dart';

class MenuScren extends StatelessWidget {
  const MenuScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container
        (
          color: Colors.white,
        child:   ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                // color: Color(0xffe9ecef),
                color: Colors.white,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                // decoration: BoxDecoration(color: Color(0xffe9ecef)),
                decoration: BoxDecoration(color: Colors.white,),
                accountName: Text(
                  " ",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                accountEmail: Text(
                  "Qasim Hussain",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                currentAccountPictureSize: Size.square(50),

                currentAccountPicture: CircleAvatar(
                  // backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "Q",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            SizedBox(
              height: 10,
            ),
            ListTile(
              // leading: const Icon(Icons.currency_exchange),
              // title: DropDownPage,(),
              title: DropDownSearch(), // title: CurrencyChanger(),
              onTap: () {
                // builddialog(context);
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: const Icon(Icons.currency_exchange_outlined),
              ),
              // title: DropDownPage(),
              title: CurrencyChanger(),
              // title: LanguageChange(),
              onTap: () {
                // builddialog(context);
              },
            ),

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
              title: AuthPage(),
              onTap: () {
                // builddialog(context);
              },
            ),

            SizedBox(
              height: 10,
            ),

          ],
        )
      ),
    );
  }
  Widget drawer() {
    return
      ListView(
      padding: const EdgeInsets.all(0),
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            // color: Color(0xffe9ecef),
            color: Colors.white,
          ), //BoxDecoration
          child: UserAccountsDrawerHeader(
            // decoration: BoxDecoration(color: Color(0xffe9ecef)),
            decoration: BoxDecoration( color: Colors.white,),
            accountName: Text(
              " ",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            accountEmail: Text(
              "Qasim Hussain",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            currentAccountPictureSize: Size.square(50),

            currentAccountPicture: CircleAvatar(
              // backgroundColor: Color.fromARGB(255, 165, 255, 137),
              child: Text(
                "Q",
                style: TextStyle(fontSize: 30.0, color: Colors.blue),
              ), //Text
            ), //circleAvatar
          ), //UserAccountDrawerHeader
        ), //DrawerHeader
        SizedBox(
          height: 10,
        ),
        ListTile(
          // leading: const Icon(Icons.currency_exchange),
          // title: DropDownPage,(),
          title: DropDownSearch(), // title: CurrencyChanger(),
          onTap: () {
            // builddialog(context);
          },
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: const Icon(Icons.currency_exchange_outlined),
          ),
          // title: DropDownPage(),
          title: CurrencyChanger(),
          // title: LanguageChange(),
          onTap: () {
            // builddialog(context);
          },
        ),


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
          title: AuthPage(),
          onTap: () {
            // builddialog(context);
          },
        ),

        SizedBox(
          height: 10,
        ),

      ],
    );
  }
}
