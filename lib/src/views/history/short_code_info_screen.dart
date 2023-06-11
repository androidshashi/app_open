import 'package:app_open/src/controller/history_controller.dart';
import 'package:app_open/src/data/api/dio_client.dart';
import 'package:app_open/src/data/model/shortcode_info_model.dart';
import 'package:app_open/src/views/custom_widgets/custom_appbar.dart';
import 'package:app_open/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShortCodeInfoScreen extends StatelessWidget {
  ShortCodeInfoScreen({Key? key}) : super(key: key);

  final _controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    var headingStyle = const TextStyle(fontSize: 16.0);
    var urlData = _controller.shortCodeInfo.value.urlData;
    return Scaffold(
      appBar: customAppbar(text: AppLocalization.urlInfo),
      body: Padding(
          padding: const EdgeInsets.all(8.0), child: _buildInfoLayout(urlData)),
    );
  }

  Widget _buildInfoLayout(UrlData? urlData) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Get.theme.primaryColorLight.withOpacity(0.2)),
      margin: EdgeInsets.all(10.h),
      child: Column(
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
