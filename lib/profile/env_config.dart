// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/17
// Time  : 0:23

import 'package:equatable/equatable.dart';
import 'package:get_arch_core/get_arch_core.dart';

///
/// App运行环境配置
/// [appName] App名称
/// [libVersion] 一般与app版本相同,用于热更新等场景
/// [packTime] 打包发布的时间
/// [envSign] 用于DI的注入配置,可以设为 "dev","test","prod"等
class EnvConfig extends ValueObject {
  final String? appName;
  final String? libVersion;
  final DateTime? packTime;
  final EnvSign envSign;

  const EnvConfig(
    this.appName,
    this.libVersion,
    this.packTime,
    this.envSign,
  );

  const EnvConfig.build({
    required this.appName,
    required this.libVersion,
    required this.packTime,
    required this.envSign,
  });

  /// 使用本构造前, 请确保你不是新手
  ///
  /// 本构造适用于单独配置某一个仅使用EnvSign的GetArchPackage,
  /// 当然, 如果你的整个项目中都没有用到其他属性,也可以在globalConfig中使用本构造
  const EnvConfig.sign(this.envSign)
      : this.appName = null,
        this.libVersion = null,
        this.packTime = null;

  @override
  List<Object?> get props => [appName, libVersion, packTime, envSign];
  @override
  final bool stringify = true;
}

enum EnvSign {
  dev,
  test,
  staging,
  prod,
}

extension EnvSignValueX on Iterable<EnvSign> {
  static const _map = {
    'dev': EnvSign.dev,
    'test': EnvSign.test,
    'staging': EnvSign.staging,
    'prod': EnvSign.prod,
  };

  fromString(String sign) => _map[sign];
}

extension EnvSignX on EnvSign {
  String get inString => this.toString().split('.').last;
}
