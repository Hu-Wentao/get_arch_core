// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/29
// Time  : 11:01

import 'package:flutter_test/flutter_test.dart';
import 'package:get_arch_core/domain/env_config.dart';
import 'package:get_arch_core/get_arch_core.dart';

class _TestConfigPackage extends IGetArchPackage {
  _TestConfigPackage(this.printBoolStateWithRegTypeName, {EnvConfig pkgEnv})
      : super(pkgEnv);

  @override
  Future<void> initPackage(EnvConfig config) => null;

  @override
  Future<void> initPackageDI(EnvConfig config) => null;

  /// 这里将本参数设为 final,并通过构造函数赋值, 只是为了测试
  /// 实际项目中, 该参数绝对不允许通过构造函数赋值,而是应当在本类中定义好.
  @override
  final Map<String, bool> printBoolStateWithRegTypeName;

  ///
  /// 用于打印 非bool型配置 与 [EnvConfig]相关的配置,参见[GetArchCorePackage]
  @override
  Map<String, String> printOtherStateWithEnvConfig(EnvConfig config) => null;
}

main() {
  test('_print full', () {
    GetArchApplication.run(EnvConfig('测试打印效果', '0.0.1', null, EnvSign.dev),
        packages: [
          _TestConfigPackage({
            'IAaaRepo': true,
            'IBbbSource': false,
            'ICccAPI': null,
          }),
        ]);
  });

  test('_print null pkg conf', () {
    GetArchApplication.run(EnvConfig('测试打印效果', '0.0.1', null, EnvSign.dev),
        packages: [
          _TestConfigPackage(null),
        ]);
  });

  test('_print null all conf', () {
    GetArchApplication.run(null, packages: [
      _TestConfigPackage(null),
    ]);
  });
}
