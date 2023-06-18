import 'package:app_open/src/controller/home_controller.dart';
import 'package:app_open/src/views/ad/banner_ad_widget.dart';
import 'package:app_open/src/views/custom_widgets/custom_widgets.dart';
import 'package:app_open/src/views/custom_widgets/custom_appbar.dart';
import 'package:app_open/src/views/custom_widgets/custom_drawer.dart';
import 'package:app_open/src/views/custom_widgets/view_history_button.dart';
import 'package:app_open/utils/app_localization.dart';
import 'package:app_open/utils/constants.dart';
import 'package:app_open/utils/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      drawer: getDrawer(),
      body: SafeArea(
        child: Container(
          color: Get.theme.primaryColorLight.withOpacity(0.5),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                _totalLinksContainer(context),
                SizedBox(
                  height: 20.h,
                ),
                _buildUrlInputField(),
                SizedBox(
                  height: 5.h,
                ),
                Obx(
                  () => customButton(
                    onTap: () {
                      if (!(_formKey.currentState?.validate() ?? false)) {
                        return;
                      }

                      //generate link
                      _controller.generateLink();

                      //save form state
                      _formKey.currentState?.save();
                    },
                    isLoading: _controller.isLoading.value,
                    title: AppLocalization.generateLink,
                    iconData: Icons.arrow_circle_right_outlined,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const ViewHistoryButton(),
                BannerAdWidget()
                // ElevatedButton(
                //     onPressed: () async {
                //       // Get.to(()=>const LanguageScreen());
                //       ///Change language of the
                //        await  Get.updateLocale(const Locale('en'));// change `Get` locale direction
                //        const GetSnackBar(title: "Language changed",message: "Success", duration: Duration(seconds: 2),).show();
                //     },
                //     child: const Text("Change Language"))
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
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
            color: Get.theme.primaryColor.withAlpha(5), width: 0.5.w));

    var numberTextStyle =
        const TextStyle(fontWeight: FontWeight.w700, fontSize: 30);

    var textStyle = const TextStyle(fontSize: 20);

    return Container(
      padding: EdgeInsets.only(
        top: 30.h,
        left: 10.w,
        right: 10.w,
      ),
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                AppLocalization.totalLinks,
                style: textStyle,
              ),
            ],
          ),
          Obx(
            () => Text(
              _controller.totalLinks.value.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: numberTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    HOW_IT_WORKS_URL.launch();
                  },
                  child: Text(AppLocalization.howItWorks)),
            ),
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
        child: customTextField(
            controller: _controller.urlInputEditingController.value,
            validator: _controller.validateInputUrl),
      ),
    );
  }
}
