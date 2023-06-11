import 'package:app_open/src/controller/history_controller.dart';
import 'package:app_open/src/views/custom_widgets/history_item_widget.dart';
import 'package:app_open/src/views/custom_widgets/custom_appbar.dart';
import 'package:app_open/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  final _controller = Get.put(HistoryController());

  HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: customAppbar(text: AppLocalization.yourShortUrls),
          body: SafeArea(
            child: Container(
              color: Get.theme.primaryColorLight.withOpacity(0.5),
              child: Column(
                children: [
                  _controller.isLoading.isTrue
                      ? const Expanded(
                          child: Center(
                          child: CircularProgressIndicator(),
                        ))
                      : _controller.historyList.isEmpty
                          ? Expanded(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(AppLocalization.noDataFound)))
                          : Expanded(
                              child: ListView.separated(
                                itemCount: _controller.historyList.length,
                                itemBuilder: (context, index) {
                                  return HistoryItemWidget(
                                    shortUrl:
                                        _controller.historyList[index].shortUrl,
                                    longUrl:
                                        _controller.historyList[index].longUrl,
                                    type: _controller.historyList[index].type,
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
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
