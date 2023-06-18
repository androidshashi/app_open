import 'package:app_open/utils/app_localization.dart';
import 'package:app_open/utils/extension_methods.dart';
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
          title: AppLocalization.copied,
          backgroundColor: Get.theme.primaryColor,
          message: "Url ${AppLocalization.copied}",
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
              AppLocalization.copyToClipboard,
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

TextFormField customTextField({required TextEditingController controller, required String? Function(String?)? validator, }) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.url,
    validator: validator,
    textInputAction: TextInputAction.go,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.link),
      suffixIcon: InkWell(
          onTap: () {
            controller.pasteText();
          },
          child: const Icon(Icons.paste)),
      hintText: AppLocalization.enterYourUrlHere,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: BorderSide(color: Get.theme.primaryColor, width: 0.3),
      ),
    ),
  );
}

Widget customButton(
    {void Function()? onTap, bool isLoading = false, required String title,  IconData? iconData,  double? width}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width??double.infinity,
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: isLoading
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
            width: 20.h,
            child: const CircularProgressIndicator(
              color: Colors.white54,
            ),
          ),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 20),
          ),
          SizedBox(
            width: iconData!=null?5.w:0,
          ),
          iconData!=null? Icon(
           iconData,
            color: Colors.white,
          ):SizedBox()
        ],
      ),
    ),
  );
}
