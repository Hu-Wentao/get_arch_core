// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/1/17
// Time  : 19:26
import 'package:get_arch_core/get_arch_core.dart';

///
/// 抽象用例
/// 可以用于 获取最新的数据, 更新/操作数据值,
/// [Out] 用例(正确的)返回值类型
/// [In] 用例的参数类型
abstract class UseCase<Out, In> {
  Future<Either<Failure, Out>> call(In params);
}

///
/// 可以用于获取可观察的数据的用例
/// [Out] 用例(正确的)返回值类型
/// [In] 用例的参数类型
abstract class ObservableUseCase<Out, In> {
  LiveModel<Out> call(In params);
}

///
/// 无需返回值的用例
/// [In] 用例的参数类型
abstract class CompletableUseCase<In> extends UseCase<Unit, In> {}

@Deprecated('Please Use [ObservableUseCase]'
    'This feature was deprecated after v2.0.0')
abstract class StmUseCase<Out, In> {
  Stream<Either<Failure, Out>> call(In params);
}
