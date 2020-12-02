import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

/// 定义一个公共的AppBar
class MyAppBar extends AppBar {
  MyAppBar({
    Key key,
    this.myTitle,
    this.onExitApp,
  }) : super(
          key: key,
          title: Text(
            myTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(left: 0),
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  icon: Image.asset(
                      'assets/images/icon_go_back.png',
                      width: 8,
                ),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.maybePop(context);
                    } else {
                      if (onExitApp != null) {
                        onExitApp();
                      }
                    }
                  },
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                ),
              );
            },
          ),
          leadingWidth: 68,
          elevation: 1,
        );

  final String myTitle;
  final VoidCallback onExitApp;
}
