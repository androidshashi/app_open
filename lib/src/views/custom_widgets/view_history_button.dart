import 'package:app_open/src/views/history/history_view.dart';
import 'package:app_open/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ViewHistoryButton extends StatelessWidget {
  const ViewHistoryButton({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildViewHistoryButton();
  }

  ///--------------------------------------View history button-----------------------------------------
  Widget _buildViewHistoryButton() {
    return Container(
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Get.theme.primaryColorLight,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: InkWell(
        onTap: (){
          Get.to(()=>HistoryView());
        },
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
      ),
    );
  }
}
