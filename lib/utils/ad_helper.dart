import 'dart:io';

import 'package:flutter/foundation.dart';

class AdHelper {

  static String get bannerAdUnitId {
    if (kReleaseMode) {
      return "ca-app-pub-8900857598948191/5544147088";
    } else {
      return "ca-app-pub-3940256099942544/6300978111";
    }
  }

  static String get interstitialAdUnitId {
    if (kReleaseMode) {
      return "ca-app-pub-8900857598948191/1960921459";
    }else{
      return "ca-app-pub-3940256099942544/1033173712";
    }
  }
}