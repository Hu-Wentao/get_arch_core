// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/29
// Time  : 11:01

import 'package:get_arch_core/get_arch_core.dart';
import 'package:get_arch_core/profile/get_arch_application.dart';
import 'package:get_arch_core/profile/get_arch_package.dart';
import 'package:test/test.dart';

class _TestConfigPackage extends IGetArchPackage {
  _TestConfigPackage(this.interfaceImplRegisterStatus, {EnvConfig pkgEnv})
      : super(pkgEnv);

  @override
  Future<void> initPackage(EnvConfig config) => null;

  @override
  Future<void> initPackageDI(EnvConfig config) => null;

  /// 这里将本参数设为 final,并通过构造函数赋值, 只是为了测试
  /// 实际项目中, 该参数绝对不允许通过构造函数赋值,而是应当在本类中定义好.
  @override
  final Map<Type, bool> interfaceImplRegisterStatus;

  ///
  /// 用于打印 非bool型配置 与 [EnvConfig]相关的配置,参见[GetArchCorePackage]
  @override
  Map<String, String> printOtherStateWithEnvConfig(EnvConfig config) => null;
}

abstract class IAaaRepo {}

abstract class IBbbSource {}

abstract class ICccAPI {}

///
/// 下面的test只能逐个测试
main() {
  test('_print full', () {
    GetArchApplication.run(EnvConfig('测试打印效果', '0.0.1', null, EnvSign.dev),
        packages: [
          _TestConfigPackage({
            IAaaRepo: true, //    启用实现类
            IBbbSource: false, // 关闭该类型的实现
            ICccAPI: null, //     这里不允许为null
          }),
        ]);
  });

  test('_print null pkg conf', () {
    GetArchApplication.run(EnvConfig('测试打印效果', '0.0.1', null, EnvSign.dev),
        packages: [
          _TestConfigPackage(null), // 不作配置, (一般将配置选择设为可选参数)
        ]);
  });

  test('_print null all conf', () {
    GetArchApplication.run(null, packages: [
      // 不配置环境
      _TestConfigPackage(null),
    ]);
  });
}
