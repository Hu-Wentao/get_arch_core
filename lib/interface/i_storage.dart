// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/13
// Time  : 20:40

///
/// 本地存储接口
abstract class IStorage {
  /// 根据[key]从本地读取基本类型
  String getData(String key);

  /// 根据[key]从本地写入基本类型
  void setData(String key, String value);

  Map<String, dynamic> getJson(String key);

  void setJson(String key, Map<String, dynamic> js);
}
