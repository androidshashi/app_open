import 'package:app_open/src/data/model/app_promo_model.dart';
import 'package:app_open/utils/ad_helper.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdController extends GetxController{

  RxBool isBannerAdReady = false.obs;
  Rxn<BannerAd> bannerAd = Rxn();


  void loadBannerAd() {
    bannerAd.value = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request:  AdRequest(),
      size: AdSize.mediumRectangle,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerAdReady.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          isBannerAdReady.value = false;
          ad.dispose();
        },
      ),
    );
  }

  @override
  void onInit() {
    loadBannerAd();
    bannerAd.value?.dispose();
    bannerAd.value?.load();
    super.onInit();
  }



}