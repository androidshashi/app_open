import 'package:app_open/src/controller/history_controller.dart';
import 'package:app_open/src/data/api/dio_client.dart';
import 'package:app_open/src/views/custom_widgets/custom_appbar.dart';
import 'package:app_open/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShortCodeInfoScreen extends StatelessWidget {
  ShortCodeInfoScreen({Key? key}) : super(key: key);

  final _controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    var headingStyle = TextStyle(fontSize: 16.0);
    var urlData = _controller.shortCodeInfo.value.urlData;
    return Scaffold(
      appBar: customAppbar(text: urlInfo),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(color: Colors.black54),
          columnWidths:  const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(4),
          },
          children: [
            TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Short Url",style: headingStyle,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${Endpoints.webUrl}/${urlData?.type}/${urlData?.shortCode}"),
                  )
                ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Long Url", style: headingStyle,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${urlData?.longUrl}"),
              )
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Type",style: headingStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${urlData?.type}"),
              )
            ]),
            TableRow(children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Hits",style: headingStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${urlData?.hits}"),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
