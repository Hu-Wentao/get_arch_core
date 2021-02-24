// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/8/3
// Time  : 16:22

import 'package:flutter_test/flutter_test.dart';
import 'package:get_arch_core/get_arch_core.dart';

main() {
  test('EitherX', () {
    Either<Failure, Foo> e = Right(Foo(2));
    expect(e.leftOrNull(), null);
    expect(e.leftOrNull((r) {
      print('main #[$r] ..do sth on Right');
    }), null);

    e = Left(UnknownFailure('test'));
    expect(e.leftOrNull(), UnknownFailure('test'));
  });

  test('FutureEitherX', () {
    Future<Either<Failure, Foo>> e;
  });
}

class Foo {
  final int f;

  Foo(this.f);

  @override
  String toString() => 'Foo{f: $f}';
}
