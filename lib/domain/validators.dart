/// 值验证器
abstract class Validator<T> {
  final String errorMsg;

  const Validator(this.errorMsg);

  bool isValid(T value);

  // 本类实例可以作为表格验证器的参数
  String? call(T? value) => value == null
      ? null
      : isValid(value)
          ? null
          : errorMsg;
}

/// 联合验证器
/// 内有状态, 因此不设const构造
class MultiValidator extends Validator {
  final List<Validator> validators;
  String _errorMsg = '';

  @override
  String get errorMsg => _errorMsg;

  MultiValidator(this.validators) : super('');

  @override
  bool isValid(value) {
    for (var validator in validators) {
      if (validator(value) != null) {
        _errorMsg = validator.errorMsg;
        return false;
      }
    }
    return true;
  }
}

/// 字符串值验证器
abstract class StringValidator extends Validator<String> {
  const StringValidator(String errorMsg) : super(errorMsg);

  bool get ignoreEmptyValues => true;

  @override
  String? call(String? value) => (ignoreEmptyValues && (value?.isEmpty ?? true))
      ? null
      : super.call(value);

  // 包装正则
  bool hasMatch(String pattern, String input, {bool caseSensitive: true}) =>
      RegExp(pattern, caseSensitive: caseSensitive).hasMatch(input);
}

/// 非null, 非空
class RequiredStringValidator extends StringValidator {
  const RequiredStringValidator(String errorMsg) : super(errorMsg);
  @override
  final bool ignoreEmptyValues = false;

  @override
  bool isValid(String value) => value.isNotEmpty;
}

class LengthRangeValidator extends StringValidator {
  final int? min;
  final int? max;

  @override
  bool get ignoreEmptyValues => false;

  const LengthRangeValidator({this.min, this.max, required String errorMsg})
      : super(errorMsg);

  @override
  bool isValid(String value) =>
      (min == null || min! <= value.length) &&
      (max == null || value.length <= max!);
}

class RangeValidator extends StringValidator {
  final num? min;
  final num? max;

  const RangeValidator({this.min, this.max, required String errorMsg})
      : assert(min != null || max != null, '值验证器两个参数不能同时为null'),
        super(errorMsg);

  @override
  bool isValid(String value) {
    try {
      final numericValue = num.parse(value);
      return (min != null || numericValue > min!) &&
          (max != null || numericValue < max!);
    } catch (_) {
      return false;
    }
  }
}

class EmailValidator extends StringValidator {
  final Pattern _emailPattern =
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

  const EmailValidator({required String errorMsg}) : super(errorMsg);

  @override
  bool isValid(String value) =>
      hasMatch(_emailPattern as String, value, caseSensitive: false);
}

class PatternValidator extends StringValidator {
  final Pattern pattern;
  final bool caseSensitive;

  const PatternValidator(this.pattern,
      {required String errorMsg, this.caseSensitive = true})
      : super(errorMsg);

  @override
  bool isValid(String value) =>
      hasMatch(pattern as String, value, caseSensitive: caseSensitive);
}

/// 自定义验证器
class FuncValidator<T> extends Validator<T> {
  final bool Function(T v) validator;

  const FuncValidator(this.validator, {required String errorMsg})
      : super(errorMsg);

  @override
  bool isValid(T value) => validator(value);
}
