import 'dart:convert' as convert;
import 'dart:io';

class ConvertUtil {
  ///通过图片路径将图片转换成Base64字符串
  ///[path] 路径
  static Future image2Base64(String path) async {
    File file = new File(path);
    List<int> imageBytes = await file.readAsBytes();
    return convert.base64Encode(imageBytes);
  }
}
