import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exercise/utils/navigator_utils.dart';

/// 底部弹框
class CupertinoActionSheetWidget {
  final List<dynamic> items;
  final void Function(int) callback;
  final String title;
  final String message;

  CupertinoActionSheetWidget(
      {@required this.items, this.callback, this.title, this.message});
}

/// 底部普通弹出菜单 - ios风格
void Function(BuildContext, CupertinoActionSheetWidget) bottomSheet =
    (BuildContext context, CupertinoActionSheetWidget options) {
  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext ctx) {
        return CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                NavigatorUtils.goBack(context);
              },
              child: Text(
                '取消',
                style: TextStyle(color: Color(0xffcdcdcd)),
              )),
          actions: options.items
              .map((item) => CupertinoActionSheetAction(
              onPressed: () {
                final int idx = options.items.indexOf(item);
                if (options.callback != null) {
                  options.callback(idx);
                }
                NavigatorUtils.goBackWithParams(context, idx);
              },
              child: Text(item.toString())))
              .toList(),
        );
      });
  return;
};