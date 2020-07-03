// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/3/29
// Time  : 11:28

import 'package:dartz/dartz.dart';
import 'package:get_arch_core/get_arch_core.dart';

import 'error/failures.dart';

///
/// 包含常用的值验证器
/// 在value_objects和表示层中调用,用于验证输入值是否合法

/// 验证值的长度在区间 [min,max] 内
Validator_<String> vStrLength([min = 0, max = 256, String errMsg]) =>
    Verify.property((str) => str.length >= min && str.length <= max,
        error: ValidateError(errMsg ?? '字符串长度不在区间[$min,$max]内'));

/// 验证值不为null或空
Validator_<String> vStrNotEmpty([String errMsg = '字符串不能为null或空']) =>
    Verify.property((str) => str?.isNotEmpty ?? false,
        error: ValidateError(errMsg));

@Deprecated('请使用[validateStrLength]')
Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(
      failedValue: input,
      max: maxLength,
    ));
  }
}

@Deprecated('请使用[validateStrNotEmpty]')
Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else {
    return right(input);
  }
}
