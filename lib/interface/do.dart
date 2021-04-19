import 'package:get_arch_core/domain/utils.dart';

import 'dto.dart';

/// DataObject 是对数据表的直接映射

// 数据表与DO类命名
// foo_bar -> FooBarDO
mixin IDO implements IDto {
  String get tableName {
    final len = '$runtimeType'.length;
    return CaseConvertUtil.upperCamel2Snack(
        '$runtimeType'.substring(0, len - 2));
  }
}
