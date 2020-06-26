// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/17
// Time  : 0:17

import 'package:get_arch_core/domain/env_config.dart';
import 'package:get_arch_core/get_arch_part.dart';

import 'get_arch_application.iconfig.dart';

part 'profile_module.dart';

/// App运行
/// 在main()中,必须先执行 WidgetsFlutterBinding.ensureInitialized();
///
/// ```dart
/// Future<void> main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await GetArchApplication.run(EnvConfig(...), packages: [...]);
///   runApp(MyApp());
/// }
/// ```
class GetArchApplication {
  static Future run(
    EnvConfig globalConfig, {
    List<IGetArchPackage> packages,
    bool printConfig: true,
  }) async {
    await GetArchCorePackage().init(globalConfig, printConfig);
    if (packages != null)
      for (final pkg in packages) await pkg.init(globalConfig, printConfig);
  }
}

///
/// 所有的GetArch包都必须实现本类
abstract class IGetArchPackage {
  final EnvConfig pkgConfig;

  IGetArchPackage(this.pkgConfig);

  Future<void> init(EnvConfig config, bool printConfig) async {
    final cfg = pkgConfig ?? config;
    if (printConfig ?? true) _printConf(cfg);
    await initPackage(cfg);
    await initPackageDI(cfg);
  }

  void _printConf(EnvConfig config) => print('''
    ╠══╣ [${this.runtimeType}] Config Info ╠══════
      ${printPackageConfigInfo(config)?.splitMapJoin('\n', onMatch: (_) => '\n      ') ?? '${this.runtimeType} Loaded'}
    ''');

  String printPackageConfigInfo(EnvConfig config);
  // 初始化包
  Future<void> initPackage(EnvConfig config);
  // 初始化包依赖注入
  Future<void> initPackageDI(EnvConfig config);
}

/// App 运行环境配置
EnvConfig _config;

class GetArchCorePackage extends IGetArchPackage {
  // GetArchCore只接受全局EnvConfig
  GetArchCorePackage() : super(null);

  @override
  Future<void> initPackage(EnvConfig config) => null;

  @override
  Future<void> initPackageDI(EnvConfig config) async {
    _config = config;
    await initDI(config);
  }

  @override
  String printPackageConfigInfo(EnvConfig config) => '''
App Name    : ${config.appName}
Lib Version : ${config.libVersion}
Pack Time   : ${config.packTime}
Runtime Env : ${config.envSign}
  ''';
}

@injectableInit
Future<void> initDI(EnvConfig config) async =>
    $initGetIt(GetIt.instance, environment: config.envSign.toString());
