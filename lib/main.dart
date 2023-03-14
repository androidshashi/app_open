import 'package:app_open/src/data/api/service_locator.dart';
import 'package:app_open/src/views/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  ServiceLocator().setup();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
            theme: ThemeData(
              primarySwatch: Colors.amber,
            ),
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            home: const SplashScreen(),

            debugShowCheckedModeBanner: false,
          )),
      designSize: const Size(375, 812),
    );
  }
}
