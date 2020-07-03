// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/22
// Time  : 23:18
///
/// 对话框接口
/// 前两个方法都是无context参数方法,
///   一般使用bot_toast,ok_toast来实现, 建议只用于展示异常与debug调试
/// 普通dialog推荐使用带context的原生实现, 性能更好
/// todo 考虑移动到 infrastructure中
abstract class IDialog {
  /// 错误处理
  /// <返回值为dynamic,不要修改为void,否则无法通过Either.fold中的代码检查>
  err(dynamic failure, [dynamic tag]);

  /// toast
  @Deprecated('please use toast')
  text(String s);
  
  toast(String s);
}
