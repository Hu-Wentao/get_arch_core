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
  final String envSign;

  const EnvConfig(
    this.appName,
    this.libVersion,
    this.packTime,
    this.envSign,
  );

  @override
  List<Object> get props => [appName, libVersion, packTime, envSign];
  @override
  final bool stringify = true;
}
