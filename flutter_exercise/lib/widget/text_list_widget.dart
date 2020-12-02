import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_app_bar.dart';

const double _lfSpace = 10.0;
const Color _lineColor = Color(0xFFE6E6E6); //230

typedef _CallBack = void Function(int selectIndex, String selectStr);

/// 普通列表widget
class EmTextList extends StatelessWidget {
  final List dataArr;
  final String title;
  final _CallBack callBack;
  final bool isBack;

  EmTextList({
    this.title = "",
    this.dataArr,
    this.callBack,
    this.isBack: true,
  });

  Widget _getWidget(context, index) {
    return InkWell(
        child: Container(
            height: 50,
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: _lfSpace,
                  child: Text(dataArr[index]),
                ),
                Positioned(
                  right: _lfSpace,
                  child: Icon(Icons.arrow_forward_ios,
                      size: 18, color: Color(0xFFC8C8C8)),
                ),
                Positioned(
                    bottom: 0.0,
                    left: _lfSpace,
                    right: 0,
                    child: Container(
                      color: _lineColor,
                      height: 1,
                    )),
              ],
            )),
        onTap: () {
          if (callBack != null) {
            callBack(index, dataArr[index]);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          myTitle: this.title,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: dataArr.length,
          itemBuilder: this._getWidget,
        ));
  }
}