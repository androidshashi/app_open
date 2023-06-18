import 'package:app_open/src/views/language_screen/language_screen.dart';
import 'package:app_open/utils/constants.dart';
import 'package:app_open/utils/extension_methods.dart';
import 'package:app_open/utils/image_constants.dart';
import 'package:app_open/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';

AppBar customAppbar({String? text}) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(text ?? AppLocalization.openLinksDirectlyInApps)),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                  child: Image.asset(
                    AppImages.appLogo,
                    height: 30.h,
                    width: 30.h,
                  )),
            ),
            _popupMenu(),
          ],
        ),
      ],
    ),

  );
}



/// popup menu like option menu items
PopupMenuButton _popupMenu() {
  return PopupMenuButton<int>(
    itemBuilder: (context) =>
    [
      // popupmenu item 1
      // PopupMenuItem(
      //   value: 1,
      //   child:menuItem(title: changeLanguage,iconData:Icons.language),
      // ),
      PopupMenuItem(
        value: 5,
        child: menuItem(title: AppLocalization.share, iconData: Icons.share),
      ),
      PopupMenuItem(
        value: 6,
        child: menuItem(title: AppLocalization.rateUs, iconData: Icons.rate_review),
      ),
      PopupMenuItem(
        value: 2,
        child: menuItem(title: AppLocalization.aboutMe, iconData: Icons.person),
      ),
      PopupMenuItem(
        value: 3,
        child: menuItem(
            title: AppLocalization.privacyPolicy, iconData: Icons.privacy_tip_outlined),
      ),
      PopupMenuItem(
        value: 4,
        child: menuItem(title: AppLocalization.terms, iconData: Icons.rule_folder),
      ),
    ],
    offset: const Offset(0, 60),
    color: Get.theme.primaryColorLight,
    elevation: 2,
    onSelected: (value) async {
      if (value == 1) {
        Get.to(() => const LanguageScreen());
      }
      if (value == 3) {
        PRIVACY_POLICY_URL.launch(launchOutSide: true);
      }
      if (value == 2) {
        ABOUT_URL.launch(launchOutSide: true);
      }
      if (value == 4) {
        TNC_URL.launch(launchOutSide: true);
      }
      if (value == 6) {
        String url = await getAppUrl();
        url.launch(launchOutSide: true);
      }
      if (value == 5) {
        String url = await getAppUrl();
        Share.share(
            "Open any link directly in android app. *Helps to boot subscribers & followers.* visit https://apppopen.me OR download the app\n$url");
      }
    },
  );
}

Future<String> getAppUrl() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String packageName = packageInfo.packageName;
  return "https://play.google.com/store/apps/details?id=$packageName";
}

Widget menuItem(
    {required String title, required IconData iconData, onPressed}) {
  return Row(
    children: [
      Icon(iconData),
      const SizedBox(
// sized box with width 10
        width: 10,
      ),
      Text(title)
    ],
  );
}
