extension RegexExtension on String {
  /// 是否是电话号码（精确）
  bool get isMobileExact {
    if (this?.isEmpty == true) return false;
    return RegExp(
            r"^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(16[6])|(17[0,1,3,5-8])|(18[0-9])|(19[1,8,9]))\\d{8}$")
        .hasMatch(this);
  }

  /// 是否是电话号码（简单）
  bool get isMobileSimple {
    if (this?.isEmpty == true) return false;
    return RegExp(r"^[1]\\d{10}$").hasMatch(this);
  }

  /// 验证邮箱
  bool get isEmail {
    if (this?.isEmpty == true) return false;
    return RegExp(r"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")
        .hasMatch(this);
  }
}
