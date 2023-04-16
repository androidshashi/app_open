import 'package:app_open/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CopyTextButton extends StatelessWidget {
  final String text;

  const CopyTextButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCopyTextButton();
  }

  ///-------------------------------copy button--------------------------------------------------
  Widget _buildCopyTextButton() {
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: text));
        GetSnackBar(
          title: copied,
          backgroundColor: Get.theme.primaryColor,
          message: "Url $copied",
          duration: const Duration(seconds: 2),
        ).show();
      },
      child: Container(
        padding: EdgeInsets.all(15.w),
        margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              copyToClipboard,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            SizedBox(
              width: 5.w,
            ),
            const Icon(Icons.arrow_circle_right_outlined)
          ],
        ),
      ),
    );
  }
}
