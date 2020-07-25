// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/7/24
// Time  : 19:07

import 'package:get_arch_core/get_arch_core.dart';

/// 仓库抽象类
abstract class IRepository<E extends IEntity<IdTp>, IdTp> {}

/// 增删改查
/// 这不代表继承本类的Repo实现有且仅有以下方法
abstract class ICrudRepository<E extends IEntity<IdTp>, IdTp>
    extends IRepository<E, IdTp> {
  /// 增
  Future<Either<Failure, E>> create();

  /// 查
  Future<Either<Failure, E>> read(IdTp id);
  // 观察对象
  LiveModel<E> observe(IdTp id);

  /// 改
  Future<Either<Failure, E>> update(IdTp id);

  /// 删
  Future<Either<Failure, Unit>> delete(IdTp id);
}
