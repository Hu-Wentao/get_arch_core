class BaseException implements Exception {
  final String msg;

  BaseException(this.msg);
  toString() => ("msg:$msg");
}

class ValidationException extends BaseException {
  ValidationException(String msg) : super(msg);
}

class IllegalArgumentException extends BaseException {
  IllegalArgumentException(String msg) : super(msg);
}

class FeatDeveloping extends BaseException {
  FeatDeveloping(String msg) : super(msg);
}

/// 设置状态时发生错误, 例如仓库存储数量小于0
/// 或者在用例中的前提条件错误, 例如某用例只有在生产线为idle时才能调用
class InvalidStateException extends BaseException {
  InvalidStateException(String msg) : super('状态异常: $msg');
}

/// 找不到指定实例, 例如通过id找不到对应的车间
class InstanceNotFoundException extends BaseException {
  InstanceNotFoundException(String msg) : super('找不到实例: $msg');
}
