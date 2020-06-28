// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/17
// Time  : 0:17

import 'package:get_arch_core/domain/env_config.dart';
import 'package:get_arch_core/get_arch_part.dart';

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
    try {
      await GetArchCorePackage().init(globalConfig, printConfig);
      if (packages != null)
        for (final pkg in packages) await pkg.init(globalConfig, printConfig);
    } catch (e, s) {
      print(
          'GetArchApplication.run ## 初始化出错! Exception:[\n$e\n]\nStackTrace[\n$s\n]');
    }
  }
}

///
/// 所有的GetArch包都必须实现本类
abstract class IGetArchPackage {
  final EnvConfig pkgEnv;

  IGetArchPackage(this.pkgEnv);

  Future<void> init(EnvConfig env, bool printConfig) async {
    final cfg = pkgEnv ?? env;
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

  ///
  /// 请在 'printPackageConfigInfo()'内部调用
  /// ```dart
  ///
  /// @override
  /// printPackageConfigInfo()=>'''
  /// ${boolConfigFieldsFormatPrint({'IXXXType': openIXXXType,})}
  /// ''';
  ///
  /// ```
  String boolConfigFieldsFormatPrint(Map<String, bool> typeNameAndState) =>
      typeNameAndState.entries
          .fold<StringBuffer>(
            StringBuffer(),
            (pre, ele) => pre
              ..write(
                  '  <${ele.key}>实现: ${ele.value == null ? '参数异常!' : ele.value ? '启用' : '禁用'}\n'),
          )
          .toString();
}

class GetArchCorePackage extends IGetArchPackage {
  // GetArchCore只接受全局EnvConfig
  GetArchCorePackage() : super(null);

  @override
  Future<void> initPackage(EnvConfig config) => null;

  @override
  Future<void> initPackageDI(EnvConfig config) async =>
      GetIt.I.registerSingleton<EnvConfig>(config);

  @override
  String printPackageConfigInfo(EnvConfig config) => '''
App Name    : ${config.appName}
Lib Version : ${config.libVersion}
Pack Time   : ${config.packTime}
Runtime Env : ${config.envSign}
  ''';
}

// 可以通过如下代码来自动生成注册代码
//@injectableInit
//Future<void> initDI(EnvConfig config) async =>
//    $initGetIt(GetIt.instance, environment: config.envSign.toString());
