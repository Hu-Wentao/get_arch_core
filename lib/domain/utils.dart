class CaseConvertUtil {
  /// 蛇形 -> 小驼峰
  /// (?<!ptn) 先行否定断言, "确保表达式的前面没有ptn"
  /// " 匹配_[a-z], 且确保 _[a-z] 的前面不是 ^_* "
  static String snack2LowerCamel(String text) =>
      text.toLowerCase().replaceAllMapped(
          RegExp(r'(?<!^_*)_([a-z])'), (m) => m.group(1)!.toUpperCase());

  /// 蛇形 -> 大驼峰
  /// 先转小驼峰, 再将开头大写
  static String snack2UpperCamel(String text) =>
      snack2LowerCamel(text).replaceAllMapped(
          RegExp(r'(?<=^_*)(\w)'), (m) => m.group(1)!.toUpperCase());

  /// 大驼峰 -> 蛇形
  static String upperCamel2Snack(String text) =>
      lowerCamel2Snack(text).replaceAllMapped(RegExp(r'(^_)'), (match) => '');

  /// 小驼峰 -> 蛇形
  static String lowerCamel2Snack(String text) => text.replaceAllMapped(
      RegExp(r'([A-Z])'), (match) => '_${match.group(0)}'.toLowerCase());

  /// 小驼峰 -> 大驼峰
  static String low2UpperCamel(String text) => text.replaceAllMapped(
      RegExp(r'(^[a-z])|(_[a-z])'), (match) => match.group(0)!.toUpperCase());

  /// 大驼峰 -> 小驼峰
  static String upper2LowerCamel(String text) => text.replaceAllMapped(
      RegExp(r'(?<=^_*)([A-Z])'), (match) => match.group(0)!.toLowerCase());
}
