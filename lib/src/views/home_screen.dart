import 'package:app_open/src/controller/home_controller.dart';
import 'package:app_open/theme/app_theme.dart';
import 'package:app_open/utils/image_constants.dart';
import 'package:app_open/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.amber.shade50,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTopLayout(),
                SizedBox(
                  height: 50.h,
                ),
                _totalLinksContainer(context),
                SizedBox(
                  height: 50.h,
                ),
                _buildUrlInputField(),
                SizedBox(
                  height: 5.h,
                ),
                Obx(
                  () => _buildGenerateLinkButton(
                      onTap: () {
                        if (!(_formKey.currentState?.validate() ?? false)) {
                          return;
                        }
                        //generate link
                        _controller.generateLink();
                        //save form state
                        _formKey.currentState?.save();
                      },
                      isLoading: _controller.isLoading.value),
                ),
                SizedBox(
                  height: 5.h,
                ),
                _buildViewHistoryButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopLayout() {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: const Text(StringConstants.openLinksDirectlyInApps,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.w),
            child: ClipOval(
                child: Image.asset(
              AppImages.appLogo,
              height: 40.w,
              width: 40.w,
            )),
          ),
        ],
      ),
    );
  }

  Widget _totalLinksContainer(BuildContext context) {
    var decoration = BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppTheme.primaryColor, width: 0.5.w));
    var numberTextStyle =
        const TextStyle(fontWeight: FontWeight.w700, fontSize: 50);
    var textStyle = const TextStyle(fontSize: 20);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
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
                Text(
                  "5000",
                  style: numberTextStyle,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
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
                  const BorderSide(color: AppTheme.primaryColor, width: 0.3),
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
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
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

  Widget _buildViewHistoryButton() {
    return Container(
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
      decoration: BoxDecoration(
        color: AppTheme.viewHistoryButtonColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            StringConstants.viewHistory,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          ),
          SizedBox(
            width: 5.w,
          ),
          const Icon(Icons.history)
        ],
      ),
    );
  }
}
