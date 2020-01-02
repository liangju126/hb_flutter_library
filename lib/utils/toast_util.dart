import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  // 工厂模式
  factory ToastUtil() => _getInstance();

  static ToastUtil get instance => _getInstance();
  static ToastUtil _instance;

  ToastUtil._internal() {
    // 初始化
  }

  static ToastUtil _getInstance() {
    if (_instance == null) {
      _instance = new ToastUtil._internal();
    }
    return _instance;
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
    );
  }
}
