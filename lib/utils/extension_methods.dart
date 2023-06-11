import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

extension PasteText on TextEditingController {
  void pasteText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    String? clipboardText = clipboardData?.text;
    text = clipboardText ?? "";
  }
}

extension StringExt on String {
  void launch({bool launchOutSide=false}) async {
   await launchUrl(Uri.parse(this),mode: launchOutSide?LaunchMode.externalApplication:LaunchMode.platformDefault);
  }
}


