import 'package:app_open/src/controller/home_controller.dart';
import 'package:app_open/src/views/custom_widgets/top_bar_layout.dart';
import 'package:app_open/src/views/custom_widgets/view_history_button.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Get.theme.primaryColorLight.withOpacity(0.5),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopBarLayout(),
                SizedBox(
                  height: 20.h,
                ),
                _totalLinksContainer(context),
                SizedBox(
                  height: 100.h,
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
                const ViewHistoryButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///----------------------------Link container---------------------------------------------
  Widget _totalLinksContainer(BuildContext context) {
    var decoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: Get.theme.primaryColor.withAlpha(5), width: 0.5.w));
    var numberTextStyle =
        const TextStyle(fontWeight: FontWeight.w700, fontSize: 30);
    var textStyle = const TextStyle(fontSize: 20);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
      margin:  EdgeInsets.only(left: 20.w, right: 20.w),
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
            "250000",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: numberTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildUrlInputField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: TextFormField(
          controller: _controller.urlInputEditingController.value,
          keyboardType: TextInputType.url,
          validator: _controller.validateInputUrl,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.link),
            suffixIcon:const Icon(Icons.paste),
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

  ///-------------------------------Generate button--------------------------------------------------
  Widget _buildGenerateLinkButton(
      {void Function()? onTap, bool isLoading = false}) {
    return GestureDetector(
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


}
