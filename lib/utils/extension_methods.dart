import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

extension PasteText on TextEditingController {
  void pasteText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    String? clipboardText = clipboardData?.text;
    text = clipboardText ?? "";
  }
}
