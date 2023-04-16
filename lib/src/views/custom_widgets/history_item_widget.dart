import 'package:app_open/src/controller/history_controller.dart';
import 'package:app_open/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class HistoryItemWidget extends StatelessWidget {
   HistoryItemWidget({Key? key, this.shortUrl, this.longUrl, this.type})
      : super(key: key);
  final String? shortUrl;
  final String? longUrl;
  final String? type;
  final _controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _controller.getShortCodeInfo("${shortUrl?.split("/")[4]}", type!);
      },
      title: Text(
        shortUrl ?? "",
        maxLines: 1,
      ),
      subtitle: Text(
        longUrl ?? "",
        maxLines: 2,
      ),
      leading: CircleAvatar(
        backgroundColor: type == KEY_TYPE_YT
            ? Colors.red.withOpacity(0.8)
            : (type == KEY_TYPE_IG ? Colors.purple : Get.theme.primaryColor),
        child: Text((type ?? KEY_TYPE_WEB).toUpperCase()),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: shortUrl));
              },

              child: const Icon(Icons.copy)),
          InkWell(
              onTap: () {
                Share.share(shortUrl.toString());
              },
              child: const Icon(Icons.share)),
        ],
      ),
    );
  }
}
