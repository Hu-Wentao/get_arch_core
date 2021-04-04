import 'package:get_arch_core/domain/validators.dart';
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

///
class MonoVO<T> extends ValueObject {
  final T value;

  const MonoVO.build(this.value);

  factory MonoVO(T value, Validator validator) {
    if (validator == null) {
      if (value == null) throw ValidationException('值对象不能为null');
    } else if (!validator.isValid(value)) {
      throw ValidationException(validator.errorMsg);
    }
    return MonoVO.build(value);
  }

  @override
  List<Object> get props => [value];
}

class Identity<T> extends MonoVO<T> {
  const Identity(T value) : super.build(value);
}
