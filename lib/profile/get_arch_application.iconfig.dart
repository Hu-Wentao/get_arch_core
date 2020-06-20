// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_arch_core/profile/get_arch_application.dart';
import 'package:get_arch_core/domain/env_config.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final profileModule = _$ProfileModule();
  g.registerFactory<EnvConfig>(() => profileModule.envConfig);
}

class _$ProfileModule extends ProfileGetArchCore {}
