import 'package:app_open/utils/image_constants.dart';
import 'package:app_open/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBarLayout extends StatelessWidget {
  const TopBarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  _buildTopLayout();
  }

  Widget _buildTopLayout() {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
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
}
