import 'package:app_open/utils/image_constants.dart';
import 'package:app_open/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppbar({String? text}) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text ?? openLinksDirectlyInApps),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
              child: Image.asset(
            AppImages.appLogo,
                height: 30.h,
                width: 30.h,
          )),
        )
      ],
    ),
  );
}
