import 'package:fluttertoast/fluttertoast.dart';

/// Toast工具类
class ToastUtils {

  static void showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }
}