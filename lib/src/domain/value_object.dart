import 'package:get_arch_core/src/domain/validators.dart';
import 'package:get_arch_core/gac_base.dart';

import 'exceptions.dart';

///
/// ValueObject 是 immutable 的
/// ValueObject 包含值验证逻辑, 一般放置在构造方法内
abstract class ValueObject extends Equatable {
  const ValueObject();
  @override
  final bool stringify = true;
}

/// [MonoVO] Example1: use [Validator]
/// class DeviceTag extends MonoVO<String> {
///   static final validator = PatternValidator(r'^[a-zA-Z0-9]{1,32}$',
///       errorMsg: '设备标签必须是长度在1到32之间的数字或字母');
///
///
///   const DeviceTag.build({required String tag}) : super.build(tag);
///   factory DeviceTag(String tag) {
///     if (!validator.isValid(tag)) throw ValidationException(validator.errorMsg);
///     return DeviceTag.build(tag: tag);
///   }
/// }
/// [MonoVO] Example2: use [MultiValidator]
/// class DeviceTag extends MonoVO<String> {
///   DeviceTag.build({required String tag}) : super.build(tag);
///
///   factory DeviceTag(String tag) {
///     // 不要使用 Example1 中的static final 修饰 [validator],
///     // 因为 [MultiValidator]内部保存着[_errorMsg]状态, 表示当前值对象的错误信息
///     final validator = MultiValidator([
///       LengthRangeValidator(min: 1, max: 32, errorMsg: '设备标签必须是长度在1到32之间'),
///       PatternValidator(r'^[a-zA-Z0-9]{1,32}$', errorMsg: '设备标签必须是数字或字母')
///     ]);
///     if (!validator.isValid(tag)) throw ValidationException(validator.errorMsg);
///     return DeviceTag.build(tag: tag);
///   }
/// }

class MonoVO<T> extends ValueObject {
  final T value;

  const MonoVO.build(this.value);

  factory MonoVO(T value, Validator validator) {
    if (!validator.isValid(value)) {
      throw ValidationException(validator.errorMsg);
    }
    return MonoVO.build(value);
  }

  @override
  List<Object?> get props => [value];
}

class Identity<T> extends MonoVO<T> {
  const Identity(T value) : super.build(value);
}
