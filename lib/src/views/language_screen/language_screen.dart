import 'package:app_open/src/views/custom_widgets/custom_appbar.dart';
import 'package:app_open/src/views/home_screen/home_screen.dart';
import 'package:app_open/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(text: AppLocalization.changeLanguage),
      body: SafeArea(
        child: Container(
          color: Get.theme.primaryColorLight.withOpacity(0.5),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("हिंदी"),
                    subtitle: const Text("हिंदी में ऐप यूज करे"),
                    onTap: () {
                      _changeLanguage(locale: Locale('hi','IN'), context: context);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("English"),
                    subtitle: const Text("Use app in English."),
                    onTap: () {
                      _changeLanguage(locale: Locale('en','US'), context: context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///Change language of the
  void _changeLanguage(
      {required Locale locale, required BuildContext context}) async {
    await Get.updateLocale(locale);// change `Get` locale direction
    const GetSnackBar(title: "Language changed",message: "Success",duration: Duration(seconds: 2),).show();
  }
}
