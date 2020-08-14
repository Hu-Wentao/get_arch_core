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
  L leftOrNull([void Function(R r) onRight]) => fold<L>(id, (r) {
        onRight?.call(r);
        return null;
      });

  ///
  /// 与 [getOrElse] 相似, 但本方法允许调用onLeft时获取到 L 实例
  R rightOrElse([R Function(L l) onLeft]) =>
      fold<R>((l) => onLeft?.call(l), id);

  ///
  /// 安全的fold, 防止遇到在 null上调用fold的情况
  /// [onNull] 当该参数为null时, 出现 上面的情况将会调用 onLeft(null);
  B safeFold<B>(B onLeft(L l), B onRight(R r), {B onNull()}) =>
      this?.fold<B>(onLeft, onRight) ?? (onNull?.call() ?? onLeft(null));
}

extension FutureEitherX<L, R> on Future<Either<L, R>> {
  ///
  /// 返回值为Failure或null
  Future<L> asyncLeftOrNull([void Function(R r) onRight]) =>
      then((value) => value.leftOrNull(onRight));

  Future<B> asyncFold<B>(B ifLeft(L l), B ifRight(R r)) =>
      then((value) => value.fold<B>(ifLeft, ifRight));

  ///
  /// 包装了已有的Map
  Future<Either<L, R2>> asyncMap<R2>(R2 map(R r)) =>
      then((value) => value.fold(left, (R r) => right(map(r))));

  Future<B> asyncSafeFold<B>(B onLeft(L l), B onRight(R r), {B onNull()}) =>
      this?.then((value) =>
          value?.fold<B>(onLeft, onRight) ?? (onNull() ?? onLeft(null))) ??
      (onNull ?? onLeft(null));
}
