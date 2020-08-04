// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/5/12
// Time  : 9:34
import 'package:dartz/dartz.dart';

extension IntToHexX on int {
  String get hexVal => '(0x)${this.toRadixString(16)}';
}

extension IntListToHexX on List<int> {
  String get hexVal =>
      '(0x)${this.map((i) => i.toRadixString(16)).toList().toString()}';
}

///
///
extension EitherX<L, R> on Either<L, R> {
  ///
  /// 用于转换用例返回值给View,以便展示ErrDialog,
  /// 返回值为Failure或null
  L leftOrNull([void Function(R r) onRight]) => fold(id, (r) {
        onRight?.call(r);
        return null;
      });
}

extension FutureEitherX<L, R> on Future<Either<L, R>> {
  ///
  /// 返回值为Failure或null
  Future<L> asyncLeftOrNull([void Function(R r) onRight]) =>
      then((value) => value.leftOrNull(onRight));

  Future<B> asyncFold<B>(B ifLeft(L l), B ifRight(R r)) =>
      then((value) => value.fold<B>(ifLeft, ifRight));
}
