// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/17
// Time  : 0:17

import 'package:get_arch_core/get_arch_core.dart';
import 'package:get_arch_core/src/constants/pubspec.yaml.g.dart';
import 'package:injectable/injectable.dart';

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

// 打印GetArgLogo和版本
String getArchLogo(EnvConfig env) =>
    r'''
  _____      _                       _     
 / ____|    | |       /\            | |    
| |  __  ___| |_     /  \   _ __ ___| |__  
| | |_ |/ _ \ __|   / /\ \ | '__/ __| '_ \ 
| |__| |  __/ |_   / ____ \| | | (__| | | |
 \_____|\___|\__| /_/    \_\_|  \___|_| |_|  ''' +
    'v$version';

typedef DependencyInjection = Future<GetIt> Function(
  GetIt get, {
  EnvironmentFilter? environmentFilter,
  String? environment,
});

class GetArchApplication {
  static const _endInfo =
      '╠╬═══ All configurations have been loaded ════════\n';

  static Future run(
    EnvConfig masterEnv, {
    bool printConfig: true,
    required List<IGetArchPackage>? packages,
    DependencyInjection? manualInject,
    String Function(EnvConfig env) logo = getArchLogo,
    @Deprecated('use manualInject') Future<void> Function(GetIt g)? mockDI,
  }) async {
    try {
      print(logo(masterEnv));
      final filter = NoEnvOrContains(masterEnv.envSign.inString);

      // 预先注册环境标志, 防止多GetItHelper冲突
      // 多GH冲突的原因可能就是 注册的是 <Set<String?> 可实际检测的却是<Set<String>>导致的
      // 单GH无法发现, 目前只能用预先注册的方式通过通过检测
      GetIt.I.registerSingleton<Set<String>>(
        filter.environments.map<String>((e) => '$e').toSet(),
        instanceName: kEnvironmentsName,
      );
      GetIt.I.registerSingleton<Set<String?>>(
        filter.environments,
        instanceName: kEnvironmentsName,
      );
      await GetArchCorePackage().init(masterEnv, printConfig, filter);
      // deprecated
      await mockDI?.call(GetIt.I);

      await manualInject?.call(GetIt.I, environmentFilter: filter);
      if (packages != null)
        for (final pkg in packages)
          await pkg.init(masterEnv, printConfig, filter);
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
  Future<void>? initPackageDI(EnvConfig config,
          {EnvironmentFilter? filter}) async =>
      GetItHelper(
              GetIt.I, filter != null ? null : config.envSign.inString, filter)
          .singleton<EnvConfig>(config);

  @override
  Map<String, String> printOtherStateWithEnvConfig(EnvConfig? config) => {
        'Framework Version   ':
            '$version at ${DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toString().split(' ').first}',
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
