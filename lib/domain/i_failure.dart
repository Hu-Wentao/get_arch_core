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

  @override
  List<Object> get props => [this.msg];

  @override
  String toString() => 'Failure[$msg]';

  void onCreate() {}
}
