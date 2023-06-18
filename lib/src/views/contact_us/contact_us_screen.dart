import 'package:app_open/src/controller/contact_us_controller.dart';
import 'package:app_open/src/views/custom_widgets/custom_sanckbar.dart';
import 'package:app_open/src/views/custom_widgets/custom_widgets.dart';
import 'package:app_open/src/views/custom_widgets/custom_appbar.dart';
import 'package:app_open/utils/app_localization.dart';
import 'package:app_open/utils/constants.dart';
import 'package:app_open/utils/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  final _controller = Get.put(ContactUsController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(text: AppLocalization.contactUS),
        body: Obx(
          () => Container(
              padding: EdgeInsets.all(16.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildForm(),
                    customButton(
                      isLoading: _controller.isLoading.value,
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          showSnackbar(message: "Passed");
                          _controller.launchMailApp();
                        }
                      },
                      title: AppLocalization.submit,
                    ),
                    SizedBox(height: 10.h,),
                    Container(color:Colors.red.shade100, padding: EdgeInsets.all(8.h), child: Text("We will reply to your message within 8 working hours. So, please have patience. Thanks for using appopen.me", style: TextStyle(color: Colors.black54,fontSize: 10.sp),)),
                    SizedBox(height: 10.h,),
                    Container(color:Colors.white54, alignment: Alignment.center, width:double.infinity, padding: EdgeInsets.all(10.h), child: Text("Meanwhile use our web tool".toUpperCase(), style: TextStyle(color: Colors.black54, fontSize: 20.sp),)),
                    SizedBox(height: 10.h,),
                    Container(
                      width: double.infinity,
                      child: OutlinedButton(onPressed: (){
                        APPOPEN_URL.launch(launchOutSide: true);
                      }, child: Text(AppLocalization.appopenMe)),
                    ),
                    SizedBox(height: 10.h,),
                    Container(
                      width: double.infinity,
                      child: OutlinedButton(onPressed: (){
                        YT_KEYWORD_TOOL_URL.launch(launchOutSide: true);
                      }, child: Text(AppLocalization.keywordToolForYoutube)),
                    ),
                    SizedBox(height: 10.h,),
                    Container(
                      width: double.infinity,
                      child: OutlinedButton(onPressed: (){
                        GOOGLE_KEYWORD_TOOL_URL.launch(launchOutSide: true);
                      }, child: Text(AppLocalization.keywordToolForGoogle)),
                    )
                  ],
                ),

              )),
        ));
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            controller: _controller.nameController.value,
            keyboardType: TextInputType.text,
            validator: _controller.validateInput,
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
              hintText: AppLocalization.enterYourNameHere,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide:
                    BorderSide(color: Get.theme.primaryColor, width: 0.3),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            controller: _controller.contentController.value,
            keyboardType: TextInputType.multiline,
            maxLines: 50,
            minLines: 10,
            validator: _controller.validateInput,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(
              hintText: AppLocalization.enterYourMsgHere,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide:
                    BorderSide(color: Get.theme.primaryColor, width: 0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
