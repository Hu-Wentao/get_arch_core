// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/13
// Time  : 21:20
///
/// 对话框
abstract class IDialogHelper {
  /// 错误处理
  err(dynamic failure,[dynamic tag]);

  /// toast
  text(String s);
}
