// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/7/3
// Time  : 23:25
import 'package:equatable/equatable.dart';

///
/// 常用的Failure

abstract class Failure extends Equatable {
  final String reportFailureType;
  final String msg;

  Failure(this.reportFailureType, this.msg) {
    onCreate();
  }

  /// 自动包装
  factory Failure.auto(dynamic e) => e is Failure ? e : UnknownFailure(e);

  @override
  List<Object> get props => [this.reportFailureType, this.msg];

  @override
  String toString() => 'Failure[$reportFailureType][$msg]';

  void onCreate() {}
}

///
/// 未知错误
class UnknownFailure extends Failure {
  UnknownFailure(String msg, [dynamic trace])
      : super('UnknownFailure', '[$msg]\ntrace:[$trace]');
}
