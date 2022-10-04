import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phptravelapp/app/language_translation_string/languageTranslation.dart';
import 'package:phptravelapp/phptravele_all_module/bottonNavigation/bottonNavigation.dart';
import 'package:phptravelapp/phptravele_all_module/travelHome/travelHome.dart';
import 'package:phptravelapp/routes/app_pages/app_pages.dart';
import 'package:phptravelapp/testingPage/dummyPage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // language changing store karta he
  await GetStorage.init(); // language changing store karta he
  await Hive.initFlutter();
  await FlutterConfig.loadEnvVariables();
  setPathUrlStrategy();
  // runApp(DevicePreview(builder: (context)=>travelapp()));
  runApp(travelapp());
}

class travelapp extends StatefulWidget {
  @override
  State<travelapp> createState() => _travelappState();
}

class _travelappState extends State<travelapp> {
  @override
  Widget build(BuildContext context) {
     print(FlutterConfig.get('API_BASE_URL'));
    return GetMaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // ye niche wala separate language class k liye
      translations: TranslationPage(),

      // language change k liye he
      locale: TranslationPage().getCurrentLocale(),
      fallbackLocale: Locale('en', 'US'),

      // fallbackLocale: Locale('en'),
      // locale: Locale('en','US'),
      // fallbackLocale: Locale('en','US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      // home: ZoomDrawerPage(),
      // home: TravelHomeTestPage(),
    );
  }
}
