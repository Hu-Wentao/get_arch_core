// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/20
// Time  : 1:13

import 'package:flutter_test/flutter_test.dart';
import 'package:get_arch_core/get_arch_core.dart';

main() {
  test('show printPackageConfigInfo', () {
    GetArchCorePackage().init(
        EnvConfig('Test GetArch', '0.0.1', DateTime(2020, 6, 20), EnvSign.dev),
        true);
  });

  test('show EnvSign value', () {
    expect(EnvSign.dev, 'dev');
  });

  test('get EnvSign from String ', () {
    expect(EnvSign.values.fromString('dev'), EnvSign.dev);
  });
}
