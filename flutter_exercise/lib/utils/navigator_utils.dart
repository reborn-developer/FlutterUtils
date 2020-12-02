import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 导航工具类
class NavigatorUtils {
  void test() {
    // Navigator.push(context, route)
    // Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
    // Navigator.pushNamed(context, routeName)
    // Navigator.pushNamedAndRemoveUntil(context, newRouteName, (route) => false)
    // Navigator.pushReplacement(context, newRoute)
    // Navigator.pushReplacementNamed(context, routeName)
    // Navigator.canPop(context)
    // Navigator.maybePop(context)
    // Navigator.pop(context)
    // Navigator.popUntil(context, (route) => false)
    // Navigator.popAndPushNamed(context, routeName)
    // Navigator.of(context).push(route)

  }

  /// 将指定页面加入到路由中
  static void pushMaterial(BuildContext context, Widget scene) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => scene));
  }

  /// 替换页面 当新的页面进入后，之前的页面将执行dispose方法
  static void pushReplacementMaterial(BuildContext context, Widget scene) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => scene));
  }

  /// 指定页面加入到路由中，然后将其他所有的页面全部pop
  static void pushAndRemoveUntilMaterial(BuildContext context, Widget scene) {
    Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => scene,
        ),
        (route) => route == null);
  }

  static void pushResultMaterial(
      BuildContext context, Widget scene, Function(Object) function) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => scene,
      ),
    ).then((dynamic result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((dynamic error) {
      print('$error');
    });
  }

  /// 将指定页面加入到路由中
  static void pushCupertino(BuildContext context, Widget scene) {
    Navigator.push(
        context, CupertinoPageRoute(builder: (BuildContext context) => scene));
  }

  /// 替换页面 当新的页面进入后，之前的页面将执行dispose方法
  static void pushReplacementCupertino(BuildContext context, Widget scene) {
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (BuildContext context) => scene));
  }

  /// 指定页面加入到路由中，然后将其他所有的页面全部pop
  static void pushAndRemoveUntilCupertino(BuildContext context, Widget scene) {
    Navigator.pushAndRemoveUntil<void>(
        context,
        CupertinoPageRoute(
          builder: (BuildContext context) => scene,
        ),
        (route) => route == null);
  }

  static void pushResultCupertino(
      BuildContext context, Widget scene, Function(Object) function) {
    Navigator.push<void>(
      context,
      CupertinoPageRoute(
        builder: (BuildContext context) => scene,
      ),
    ).then((dynamic result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((dynamic error) {
      print('$error');
    });
  }

  ///切换命名路由页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  /// 返回
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// 带参数返回
  static void goBackWithParams(BuildContext context, dynamic result) {
    Navigator.pop<dynamic>(context, result);
  }

  static void unfocus() {
    // 使用下面的方式，会触发不必要的build。
    // FocusScope.of(context).unfocus();
    // https://github.com/flutter/flutter/issues/47128#issuecomment-627551073
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
