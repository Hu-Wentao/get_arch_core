import 'package:get_arch_core/domain/utils.dart';

import 'dto.dart';

/// DataObject 是对数据表的直接映射

/// 数据表与DO类命名
/// foo_bar -> FooBarDO
///
/// example
/// ```dart
/// part 'data_object.freezed.dart';
/// part 'data_object.g.dart';
///
/// @freezed
/// class DeviceDO with _$DeviceDO, IDO {
///   const DeviceDO._(); // must add this
///   factory DeviceDO({
///     int? id,
///     String? serialNumber,
///     String? tag,
///     DeviceType? type,
///     String? userId,
///   }) = _DeviceDO;
///   factory DeviceDO.fromJson(Map<String, dynamic> json) =>
///       _$DeviceDOFromJson(json);
/// }
/// ```

mixin IDO implements IDto {
  String get tableName {
    final len = '$runtimeType'.length;
    return CaseConvertUtil.upperCamel2Snack(
        '$runtimeType'.substring(0, len - 2));
  }
}
