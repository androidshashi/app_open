import 'package:app_open/src/controller/history_controller.dart';
import 'package:app_open/src/views/custom_widgets/history_item_widget.dart';
import 'package:app_open/src/views/custom_widgets/custom_appbar.dart';
import 'package:app_open/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends StatelessWidget {
  final _controller = Get.put(HistoryController());

  HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: customAppbar(text: yourShortUrls),
          body: SafeArea(
            child: Container(
              color: Get.theme.primaryColorLight.withOpacity(0.5),
              child: Column(
                children: [
                  // TopBarLayout(
                  //   text: yourShortUrls,
                  // ),
                  _controller.historyList.isEmpty
                      ? Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(noDataFound)))
                      : Expanded(
                          child: ListView.separated(
                            itemCount: _controller.historyList.length,
                            itemBuilder: (context, index) {
                              return HistoryItemWidget(
                                shortUrl: _controller.historyList[index].shortUrl,
                                longUrl: _controller.historyList[index].longUrl,
                                type:  _controller.historyList[index].type,
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const Divider();
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
