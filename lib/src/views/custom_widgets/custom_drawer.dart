import 'package:app_open/src/views/contact_us/contact_us_screen.dart';
import 'package:app_open/src/views/custom_widgets/app_promo_widget.dart';
import 'package:app_open/src/views/custom_widgets/custom_appbar.dart';
import 'package:app_open/src/views/history/history_screen.dart';
import 'package:app_open/src/views/home_screen/home_screen.dart';
import 'package:app_open/src/views/search/search_screen.dart';
import 'package:app_open/utils/app_localization.dart';
import 'package:app_open/utils/constants.dart';
import 'package:app_open/utils/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

Drawer getDrawer() {
  return Drawer(
      child: ListView(
    children: [
      AppPromoWidget(),
      Divider(),
      getDrawerItem(
          title: AppLocalization.home,
          onTap: () {
            Get.back();
            Get.to(() => HomeScreen());
          }),
      getDrawerItem(
          title: AppLocalization.viewHistory,
          onTap: () {
            Get.back();
            Get.to(() => HistoryScreen());
          }),
      getDrawerItem(
          title: AppLocalization.searchUrl,
          onTap: () {
            Get.back();
            Get.to(() => SearchScreen());
          }),
      Divider(),
      Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        child: Text(
          AppLocalization.onlineTools,
          style: Get.theme.textTheme.labelLarge,
        ),
      ),
      Divider(),
      getDrawerItem(
          title: AppLocalization.appopenMe,
          subTitle: AppLocalization.generateLinkToOpen,
          onTap: () {
            Get.back();
            APPOPEN_URL.launch(launchOutSide: true);
          }),
      getDrawerItem(
          title: AppLocalization.keywordToolForGoogle,
          subTitle: AppLocalization.keywordToolForGoogleDesc,
          onTap: () {
            Get.back();
            GOOGLE_KEYWORD_TOOL_URL.launch(launchOutSide: true);
          }),
      getDrawerItem(
          title: AppLocalization.keywordToolForYoutube,
          subTitle: AppLocalization.keywordToolForYoutubeDesc,
          onTap: () {
            Get.back();
            YT_KEYWORD_TOOL_URL.launch(launchOutSide: true);
          }),
      Divider(),
      Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        child: Text(
          AppLocalization.helpAndFeedback,
          style: Get.theme.textTheme.labelLarge,
        ),
      ),
      Divider(),
      getDrawerItem(
          title: AppLocalization.appNotWorking,
          subTitle: AppLocalization.appNotWorkingDesc,
          onTap: () {
            Get.back();
            Get.to(()=> ContactUsScreen());
          }),
      getDrawerItem(
          title: AppLocalization.contactUS,
          onTap: () {
            Get.back();
            Get.to(()=> ContactUsScreen());
          }),
      getDrawerItem(
          title: AppLocalization.rateUs,
          onTap: () async {
            Get.back();
            String url = await getAppUrl();
            url.launch(launchOutSide: true);
          }),
      getDrawerItem(
          title: AppLocalization.share,
          onTap: () async {
            Get.back();
            String url = await getAppUrl();
            Share.share(
                "Open any link directly in android app. *Helps to boot subscribers & followers.* visit https://apppopen.me OR download the app\n$url");
          }),
      getDrawerItem(
          title: AppLocalization.privacyPolicy,
          onTap: () {
            Get.back();
            PRIVACY_POLICY_URL.launch(launchOutSide: true);
          }),
      getDrawerItem(
          title: AppLocalization.terms,
          onTap: () {
            Get.back();
            TNC_URL.launch(launchOutSide: true);
          }),
    ],
  ));
}

Widget getDrawerItem(
    {required String title,
    Color? tileColor,
    String? subTitle,
    required onTap,
    EdgeInsets? padding}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r), color: tileColor),
      margin: padding ??
          EdgeInsets.only(top: 4.h, bottom: 4.h, left: 8.w, right: 8.w),
      padding: padding ??
          EdgeInsets.only(top: 8.h, bottom: 8.h, left: 8.w, right: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          subTitle != null
              ? Text(
                  subTitle,
                  style: TextStyle(color: Colors.black54, fontSize: 11.sp),
                )
              : SizedBox(),
        ],
      ),
    ),
  );
}
