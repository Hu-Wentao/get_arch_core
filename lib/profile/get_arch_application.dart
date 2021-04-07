// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/17
// Time  : 0:17

import 'package:get_arch_core/get_arch_core.dart';

import 'get_arch_package.dart';

/// App运行
/// 在main()中,必须先执行 WidgetsFlutterBinding.ensureInitialized();
///
/// ```dart
/// main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await GetArchApplication.run(EnvConfig(...), packages: [...]);
///   runApp(MyApp());
/// }
/// ```
/// [globalConfig] 全局环境配置
/// [printConfig] 在Flutter中建议设置该值为 !kReleaseMode
/// [packages] 其他实现了[IGetArchPackage]的类
/// [mockDI] 该函数提供了一个 GetIt实例参数, 用于在单元测试中注册用于调试的依赖
class GetArchApplication {
  static logo({String? version}) => r'''\n
       _____      _                       _     
      / ____|    | |       /\            | |    
     | |  __  ___| |_     /  \   _ __ ___| |__  
     | | |_ |/ _ \ __|   / /\ \ | '__/ __| '_ \ 
     | |__| |  __/ |_   / ____ \| | | (__| | | |
      \_____|\___|\__| /_/    \_\_|  \___|_| |_|    $version
''';
  static const _endInfo = '\t═════ All the configuration are loaded ════════';
  static Future run(
    EnvConfig masterEnv, {
    bool printConfig: true,
    required List<IGetArchPackage>? packages,
    Future<void> Function(GetIt g)? mockDI,
  }) async {
    try {
      print(logo());
      final gh = GetItHelper(GetIt.I, masterEnv.envSign.inString);
      await GetArchCorePackage().init(masterEnv, printConfig, gh);
      await mockDI?.call(GetIt.I);
      if (packages != null)
        for (final pkg in packages) await pkg.init(masterEnv, printConfig, gh);
      print(_endInfo);
    } catch (e, s) {
      print('GetArchApplication.run #### Init Error: [$e]\nStackTrace[\n$s\n]');
    }
  }
}

class GetArchCorePackage extends IGetArchPackage {
  // GetArchCore只接受全局EnvConfig
  GetArchCorePackage() : super(null);

  @override
  Future<void>? initPackage(EnvConfig? config) => null;

  @override
  // Future<void> initPackageDI(EnvConfig? config) async =>
  Future<void> initPackageDI(EnvConfig config, {GetItHelper? gh}) async =>
      gh != null
          ? gh.singleton<EnvConfig>(config)
          : GetIt.I.registerSingleton<EnvConfig>(config);

  @override
  Map<String, String> printOtherStateWithEnvConfig(EnvConfig? config) => {
        'App Name   ': '${config?.appName}',
        'Lib Version': '${config?.libVersion}',
        'Pack Time  ': '${config?.packTime}',
        'Runtime Env': '${config?.envSign}',
      };

  @override
  Map<Type, bool>? get interfaceImplRegisterStatus => null;
}

// 可以通过如下代码来自动生成注册代码
// 这里不再使用自动注册, 是因为在其他项目导包时经常会误导入本文件中的$initGetIt
//@injectableInit
//Future<void> initDI(EnvConfig config) async =>
//    $initGetIt(GetIt.instance, environment: config.envSign.toString());
