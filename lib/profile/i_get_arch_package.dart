// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/7/3
// Time  : 23:46

import 'package:get_arch_core/domain/env_config.dart';

///
/// 所有的GetArch包都必须实现本类
abstract class IGetArchPackage {
  final EnvConfig pkgEnv;

  IGetArchPackage(this.pkgEnv);

  Future<void> init(EnvConfig masterEnv, bool printConfig) async {
    final env = pkgEnv ?? masterEnv;
    if (printConfig ?? true) _printConf(env);
    try {
      await initPackage(env);
      await initPackageDI(env);
    } catch (e, s) {
      print('${this.runtimeType}.init ### Error: [\n$e\n]\nStackTrace[\n$s\n]');
    }
  }

  // 起止行4个空格,信息内容行6个空格
  void _printConf(EnvConfig config) {
    final start = '\t╠╬══╝ [${this.runtimeType}] Config Profile ╚══════\n';
    final endLn = '\t╚╚═══ [${this.runtimeType}] Config  Loaded ═══════';

    StringBuffer bf = printBoolStateWithRegTypeName?.entries?.fold<
        StringBuffer>(
        StringBuffer(),
            (pre, kv) => pre
          ..writeln(
              '\t  <${kv.key}>Implement: ${kv.value == null ? "ERROR! Please check package's EnvConfig !" : kv.value ? 'ON' : 'OFF'}'));
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
