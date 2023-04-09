import 'package:app_open/src/controller/home_controller.dart';
import 'package:app_open/src/views/custom_widgets/top_bar_layout.dart';
import 'package:app_open/src/views/custom_widgets/view_history_button.dart';
import 'package:app_open/theme/app_theme.dart';
import 'package:app_open/utils/image_constants.dart';
import 'package:app_open/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GeneratedScreen extends StatelessWidget {
  GeneratedScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.amber.shade50,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopBarLayout(),
                SizedBox(
                  height: 50.h,
                ),
                _buildGeneratedUrlContainer(),
                SizedBox(
                  height: 5.h,
                ),
               const ViewHistoryButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _totalLinksContainer(BuildContext context) {
    var decoration = BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: Get.theme.primaryColor, width: 0.5.w));
    var numberTextStyle =
        const TextStyle(fontWeight: FontWeight.w700, fontSize: 50);
    var textStyle = const TextStyle(fontSize: 20);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
            margin: const EdgeInsets.only(left: 20, right: 5),
            decoration: decoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.link),
                    Text(
                      StringConstants.totalLinks,
                      style: textStyle,
                    ),
                  ],
                ),
                FittedBox(
                  child: Text(
                    "5000000000000000000000000",
                    style: numberTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
            margin: const EdgeInsets.only(right: 20, left: 5),
            decoration: decoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.ads_click),
                    Text(StringConstants.totalClicks, style: textStyle),
                  ],
                ),
                Text("4000", style: numberTextStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUrlInputField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      color: Colors.white54,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: TextFormField(
          controller: _controller.urlInputEditingController.value,
          keyboardType: TextInputType.url,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return StringConstants.pleaseEnterYourUrl;
            }
            if (!value.isURL) {
              return StringConstants.pleaseEnterValidUrl;
            }
            return null;
          },
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.link),
            hintText: StringConstants.enterYourUrlHere,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide:
                   BorderSide(color: Get.theme.primaryColor, width: 0.3),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenerateLinkButton(
      {void Function()? onTap, bool isLoading = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                  const Text(
                    StringConstants.generateLink,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
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

  ///build generated container
  _buildGeneratedUrlContainer() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.amber, width: 0.5.w)),
        child: Obx(
          () =>  Text(
            _controller.generatedUrl.value,
            maxLines: 1,
            style: TextStyle(
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
        ));
  }
}
