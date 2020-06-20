// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/17
// Time  : 12:41

part of 'get_arch_application.dart';

@module
abstract class ProfileGetArchCore {
  @preResolve
  EnvConfig get envConfig => _config;
}
