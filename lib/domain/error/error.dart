// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/3/28
// Time  : 11:25

import 'package:verify/verify.dart';

///
/// 值对象验证错误
/// 由错误的值对象的值在验证过程中返回的Error
class ValidateError extends Error with ValidationError {
  @override
  final String errorDescription;
  ValidateError(this.errorDescription);

  @override
  String toString() => 'ValidateError[$errorDescription]';
}

///
/// 包装Error
abstract class MsgError<T> extends Error {
  final T msg;
  MsgError(this.msg);
}

///
/// 未知错误
class UnexpectedValueError extends MsgError {
  UnexpectedValueError(dynamic left) : super(left);

  @override
  String toString() => 'UnexpectedValueError: ${super.msg}';
}

///
/// 未认证错误
class NotAuthenticatedError extends Error {}

///
/// 本地缓存出错
class StorageError extends MsgError<String> {
  StorageError({String msg}) : super('CacheFailure: $msg');
}

class TypeError extends MsgError<String> {
  TypeError(dynamic msg) : super('代码错误,类型不匹配:[$msg]');
}
