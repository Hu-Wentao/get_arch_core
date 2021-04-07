// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/7/3
// Time  : 23:46

import 'package:get_arch_core/get_arch_core.dart';
import 'package:injectable/injectable.dart';

///
/// All GetArch packages must implement this class
/// 所有的GetArch包都必须实现本类
abstract class IGetArchPackage {
  final EnvConfig? pkgEnv;

  IGetArchPackage(this.pkgEnv);

  ///
  /// [masterEnv] 主环境, 必填
  /// [printConfig] 是否打印相关日志
  /// [filter] 根据主环境标志,选择性注入依赖
  ///   如果项目中只有一个 [GetArchPackage] 则可以为空
  ///   如果项目中有多个 [GetArchPackage] 则只有首个开始注入的[GetArchPackage]可以为空
  ///     否则将导致异常抛出,注入失败
  Future<void> init(
      EnvConfig masterEnv, bool printConfig, EnvironmentFilter? filter) async {
    final EnvConfig env = pkgEnv ?? masterEnv;
    if (printConfig) _printConf(env);
    try {
      await initPackage(env);
      await initPackageDI(env, filter: filter);
    } catch (e, s) {
      print(
          '[${this.runtimeType}].init ### Error: [\n$e\n]\nStackTrace[\n$s\n]');
    }
  }

  // 起止行4个空格,信息内容行6个空格
  void _printConf(EnvConfig config) {
    final start = '\n\t╠╬══╝ [${this.runtimeType}] Config Profile ╚══════\n';
    final endLn = '\t╚╚═══ [${this.runtimeType}] Config  Loaded ═══════\n';
    StringBuffer? bf = interfaceImplRegisterStatus?.entries.fold<StringBuffer>(
        StringBuffer(),
        (pre, kv) => pre
          ..writeln(
              '\t  <${kv.key}>Implement: ${kv.value == null ? "ERROR! Please check package's EnvConfig !" : kv.value! ? 'ON' : 'OFF'}'));
    bf = printOtherStateWithEnvConfig(config)?.entries.fold<StringBuffer?>(
            bf ?? StringBuffer(),
            (pre, kv) => pre?..writeln('\t  ${kv.key} : ${kv.value}')) ??
        bf;

    print(start);
    print(bf ?? endLn);
  }

  // 打印Package内接口实现的开关状态
  @protected
  Map<Type, bool?>? get interfaceImplRegisterStatus;

  /// 打印其他类型的Package配置信息
  Map<String, String>? printOtherStateWithEnvConfig(EnvConfig config);

  /// 初始化包
  Future<void>? initPackage(EnvConfig config);

  /// 初始化包依赖注入
  /// 如果一个项目中同时使用了多个[IGetArchPackage],则务必使用 [gh]参数
  /// 因为同一个项目, 只能有唯一的[gh], 否则会导致DI失败
  Future<void>? initPackageDI(EnvConfig config, {EnvironmentFilter? filter});
}
