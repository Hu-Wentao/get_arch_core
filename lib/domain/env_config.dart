// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/17
// Time  : 0:23

import 'package:equatable/equatable.dart';

///
/// App运行环境配置
/// [appName] App名称
/// [libVersion] 一般与app版本相同,用于热更新等场景
/// [packTime] 打包发布的时间
/// [envSign] 用于DI的注入配置,可以设为 "dev","test","prod"等
class EnvConfig extends Equatable {
  final String appName;
  final String libVersion;
  final DateTime packTime;
  final EnvSign envSign;

  const EnvConfig(
    this.appName,
    this.libVersion,
    this.packTime,
    this.envSign,
  );

  /// 使用本构造前, 请确保你不是新手
  ///
  /// 本构造适用于单独配置某一个仅使用EnvSign的GetArchPackage,
  /// 当然, 如果你的整个项目中都没有用到其他属性,也可以在globalConfig中使用本构造
  const EnvConfig.sign(this.envSign)
      : this.appName = null,
        this.libVersion = null,
        this.packTime = null;

  @override
  List<Object> get props => [appName, libVersion, packTime, envSign];
  @override
  final bool stringify = true;
}

class EnvSign {
  final String _sign;
  const EnvSign.fromString(this._sign);

  static const EnvSign dev = const EnvSign.fromString('dev');
  static const EnvSign test = const EnvSign.fromString('test');
  static const EnvSign prod = const EnvSign.fromString('prod');

  @override
  String toString() => _sign;

  @override
  bool operator ==(Object other) =>
      (identical(this, other)) ||
      (other is String && other == _sign) ||
      (other is EnvSign &&
          runtimeType == other.runtimeType &&
          _sign == other._sign);

  @override
  int get hashCode => _sign.hashCode;
}
