import '../gac_base.dart';
import 'exceptions.dart';
import 'validators.dart';

/// VO is immutable
/// 包含值验证逻辑, 一般放置在构造方法内
abstract class IValueObject extends Equatable {
  const IValueObject();

  @override
  final bool stringify = true;
}

/// 针对只包装了一个字段的VO
class MonoVO<T> extends IValueObject {
  final T value;

  const MonoVO.build(this.value);

  factory MonoVO(T value, Validator validator) {
    if (validator == null) {
      if (value == null) throw ValidationException('value object can not be null');
    } else if (!validator.isValid(value)) {
      throw ValidationException(validator.errorMsg);
    }
    return MonoVO.build(value);
  }

  @override
  List<Object> get props => [value];
}

/// ID, 所有的ID继承本类
class Identity<T> extends MonoVO<T> {
  const Identity(T value) : super.build(value);
}
