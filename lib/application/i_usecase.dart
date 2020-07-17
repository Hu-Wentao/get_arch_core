// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/1/17
// Time  : 19:26
import 'package:dartz/dartz.dart';
import 'package:get_arch_core/domain/i_failure.dart';
import 'package:get_arch_core/domain/live_data.dart';
import 'package:get_arch_core/get_arch_core.dart';

///
/// 抽象用例
/// 可以用于 获取最新的数据, 更新/操作数据值,
/// [Type] 用例(正确的)返回值类型
/// [Params] 用例的参数类型
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

///
/// 可以用于获取可观察的数据的用例
/// [Type] 用例(正确的)返回值类型
/// [Params] 用例的参数类型
abstract class ObservableUseCase<Type, Params> {
  LiveModel<Type> call(Params params);
}

@Deprecated('Please Use [ObservableUseCase]'
    'This feature was deprecated after v2.0.0')
abstract class StmUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}
