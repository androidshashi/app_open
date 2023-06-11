import 'package:app_open/src/controller/history_controller.dart';
import 'package:app_open/src/controller/search_controller.dart';
import 'package:app_open/src/data/api/dio_client.dart';
import 'package:app_open/src/data/model/shortcode_info_model.dart';
import 'package:app_open/src/views/custom_widgets/custom_widgets.dart';
import 'package:app_open/src/views/custom_widgets/custom_appbar.dart';
import 'package:app_open/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final _controller = Get.put(SearchController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(text: AppLocalization.searchUrl),
        body: Obx(
          () => Container(
              padding: EdgeInsets.all(16.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: customTextField(
                            controller:
                                _controller.urlInputEditingController.value,
                            validator: _controller.validateInputUrl)),
                    customButton(
                        width: 200.w,
                        isLoading: _controller.isLoading.value,
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _controller.getShortCodeInfo(
                                _controller.getShortcodeFromUrl(),
                                _controller.getTypeFromUrl());
                          }
                        },
                        title: AppLocalization.searchUrl,
                        iconData: Icons.search),
                    _controller.shortCodeInfo.value.urlData != null
                        ? _buildInfoLayout(
                            _controller.shortCodeInfo.value.urlData)
                        : SizedBox()
                  ],
                ),
              )),
        ));
  }

  Widget _buildInfoLayout(UrlData? urlData) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: urlData?.longUrl == null?Colors.red.shade100:Get.theme.primaryColorLight.withOpacity(0.2)),
      margin: EdgeInsets.only(top: 16.h, right: 4.w,left: 4.w, bottom: 16.h),
      child: urlData?.longUrl == null
          ? Center(
              child: Text("Url Not Found"),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _getInfoItem(
                    lable: AppLocalization.shortUrl,
                    value:
                        "${Endpoints.webUrl}/${urlData?.type}/${urlData?.shortCode}"),
                Divider(),
                _getInfoItem(
                  lable: AppLocalization.longUrl,
                  value: "${urlData?.longUrl}",
                ),
                Divider(),
                _getInfoItem(
                  lable: AppLocalization.type,
                  value: "${urlData?.type?.toUpperCase()}",
                ),
                Divider(),
                _getInfoItem(
                  lable: AppLocalization.hits,
                  value: "${urlData?.hits}",
                ),
              ],
            ),
    );
  }

  Widget _getInfoItem({required String lable, required String value}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                lable,
                style: Get.theme.textTheme.labelLarge,
              )),
          Expanded(flex: 4, child: Text(value)),
          IconButton(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: value));
              },
              icon: Icon(Icons.copy_all_outlined))
        ],
      ),
    );
  }
}
