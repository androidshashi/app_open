import 'package:app_open/src/data/api/service_locator.dart';
import 'package:app_open/src/views/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  ServiceLocator().setup();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('hi')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: ((context, child) => GetMaterialApp(
            title: 'App Open',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            home: const SplashScreen(),

            debugShowCheckedModeBanner: false,
          )),
      designSize: const Size(375, 812),
    );
  }
}
