// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/17
// Time  : 0:17

import 'package:get_arch_core/domain/env_config.dart';

/// App运行
class GetArchApplication {
  Future<void> run(EnvConfig config, {List<IGetArchPackage> packages}) async {
    if (packages != null) for (final pkg in packages) await pkg.init(config);
  }
}

///
/// 所有的GetArch包都必须实现本类
abstract class IGetArchPackage {
  final bool onlyInitDI;

  IGetArchPackage({this.onlyInitDI: false}) : assert(onlyInitDI != null);

  Future<void> init(EnvConfig config) async {
    if (!onlyInitDI) await initPackage(config);
    await initPackageDI(config);
  }

  Future<void> initPackage(EnvConfig config);
  Future<void> initPackageDI(EnvConfig config);
}
