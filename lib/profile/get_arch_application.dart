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
  static const logo = r'''
       _____      _                       _     
      / ____|    | |       /\            | |    
     | |  __  ___| |_     /  \   _ __ ___| |__  
     | | |_ |/ _ \ __|   / /\ \ | '__/ __| '_ \ 
     | |__| |  __/ |_   / ____ \| | | (__| | | |
      \_____|\___|\__| /_/    \_\_|  \___|_| |_|

''';
  static const endInfo = '\t╠╬══╗ All the configuration are loaded ╔══════';
  static Future run(
    EnvConfig globalConfig, {
    bool printConfig: true,
    List<IGetArchPackage> packages,
  }) async {
    try {
      print(logo);
      await GetArchCorePackage().init(globalConfig, printConfig);
      if (packages != null)
        for (final pkg in packages) await pkg.init(globalConfig, printConfig);
      print(endInfo);
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

  // 起止行4个空格,信息内容行6个空格
  void _printConf(EnvConfig config) {
    final start = '\t╠╬══╝ [${this.runtimeType}] Config Info ╚══════\n';
    final endLn = '\t╠═══╗ [${this.runtimeType}] Conf Loaded ╔══════';

    StringBuffer bf = printBoolStateWithRegTypeName?.entries?.fold<
            StringBuffer>(
        StringBuffer(),
        (pre, kv) => pre
          ..writeln(
              '\t  <${kv.key}>实现: ${kv.value == null ? '参数异常! 请检查Package配置!' : kv.value ? '启用' : '禁用'}'));
    bf = printOtherStateWithEnvConfig(config)?.entries?.fold(
            (bf ?? StringBuffer()),
            (pre, kv) => pre..writeln('\t  ${kv.key} : ${kv.value}')) ??
        bf;

    print(start);
    print(bf ?? endLn);
  }

  // 打印bool类型的Package配置信息
  Map<String, bool> get printBoolStateWithRegTypeName;
  // 打印其他类型的Package配置信息
  Map<String, String> printOtherStateWithEnvConfig(EnvConfig config);
  // 初始化包
  Future<void> initPackage(EnvConfig config);
  // 初始化包依赖注入
  Future<void> initPackageDI(EnvConfig config);
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
  Map<String, String> printOtherStateWithEnvConfig(EnvConfig config) => {
        'App Name   ': '${config?.appName}',
        'Lib Version': '${config?.libVersion}',
        'Pack Time  ': '${config?.packTime}',
        'Runtime Env': '${config?.envSign}',
      };

  @override
  Map<String, bool> get printBoolStateWithRegTypeName => null;
}

// 可以通过如下代码来自动生成注册代码
// 这里不再使用自动注册, 是因为在其他项目导包时经常会误导入本文件中的$initGetIt
//@injectableInit
//Future<void> initDI(EnvConfig config) async =>
//    $initGetIt(GetIt.instance, environment: config.envSign.toString());
