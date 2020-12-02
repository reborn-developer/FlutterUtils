import 'package:flutter/material.dart';
import 'package:flutter_exercise/widget/dialog_widget.dart';
import 'package:flutter_exercise/widget/text_list_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// dialog测试页面
class DialogTestPage extends StatelessWidget {

  final List titleData = [
    "Dialog-标题",
    "Dialog-标题内容",
    "Dialog-内容",
    "Dialog-标题内容只有确定",
    "Dialog-修改按钮文字",
    "Dialog-自定义内容",
    "Dialog-自定义内容2",
    "Dialog-完全自定义",
    "Dialog-完全自定义-外部点击事件",
  ];

  @override
  Widget build(BuildContext context) {
    return EmTextList(
      title: "Dialog测试",
      dataArr: titleData,
      callBack: (index, str) {
        if (index == 0) {
          EmDialog.show(context, title: "提示", onConfirm: () {
            print('点击确定');
            Fluttertoast.showToast(msg: '点击确定');
          }, onCancel: () {
            Fluttertoast.showToast(msg: '点击取消');
          });
        }
        if (index == 1) {
          EmDialog.show(context, title: "提示", content: '您确定要退出登录吗？');
        }
        if (index == 2) {
          EmDialog.show(context, content: '确认要退出吗？');
        }
        if (index == 3) {
          EmDialog.show(context,
              title: "警告",
              content: '您的账号在异地登录，请重新登录！',
              rightText: '好的',
              hiddenCancel: true);
        }
        if (index == 4) {
          EmDialog.show(context,
              title: "提示",
              content: '您需要同意相关协议才能使用！',
              leftText: '不同意',
              rightText: '同意');
        }

        if (index == 5) {
          EmDialog.showCustomDialog(context,
              content: Container(height: 200, color: Colors.red));
        }
        if (index == 6) {
          EmDialog.showCustomDialog(context,
              title: '提示', content: Container(height: 200, color: Colors.red));
        }
        if (index == 7) {
          EmDialog.showAllCustomDialog(
            context,
            clickBgHidden: true,
            child: Center(
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.red,
                child: Center(
                  child: Text('这是完全自定义的弹框，点击背景隐藏'),
                ),
              ),
            ),
          );
        }
        if (index == 8) {
          EmDialog.showAllCustomDialog(context,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  print("这是完全自定义的弹框，点击红色部分隐藏");
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.red,
                  child: Center(
                    child: Text('这是完全自定义的弹框，点击红色部分隐藏'),
                  ),
                ),
              ));
        }
      },
    );
  }
}