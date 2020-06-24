// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/1/17
// Time  : 19:26
import 'package:dartz/dartz.dart';

import '../get_arch_core.dart';

///
/// 抽象用例
/// [Type] 用例(正确的)返回值类型
/// [Params] 用例的参数类型
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class StmUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}
