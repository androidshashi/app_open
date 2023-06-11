import 'package:app_open/src/controller/ad_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget {
   BannerAdWidget({Key? key}) : super(key: key);

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  final _adController = Get.put(AdController());

  @override
  void initState() {
    _adController.bannerAd.value?.dispose();
    _adController.bannerAd.value?.load();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Obx(
          () => _adController.isBannerAdReady.isTrue
          ? Container(
        alignment: Alignment.center,
        width:
        _adController.bannerAd.value?.size.width.toDouble(),
        height: _adController.bannerAd.value?.size.height
            .toDouble(),
        child: AdWidget(ad: _adController.bannerAd.value!),
      )
          : const SizedBox(),
    );
  }
}
