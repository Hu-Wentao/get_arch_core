// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/7/24
// Time  : 19:07

import 'package:get_arch_core/get_arch_core.dart';

/// 仓库抽象类
abstract class IRepository<Ag extends IAggregate<Id>, Id extends Identity> {
  // 返回Entity的类型
  Type get entityType => Ag.runtimeType;
}

/// 增删改查
/// 这不代表继承本类的Repo实现有且仅有以下方法
abstract class ICrudRepo<E extends IAggregate<Id>, Id extends Identity>
    extends IRepository<E, Id> {
  /// 增
  /// (当数据通过网络同步后, 返回值不一定与输入值相同, 因此这里的返回值不是[Unit]类型)
  Future<E> create(E entity);

  /// 查
  Future<E> read(Id id);

  /// 改
  /// (当数据通过网络同步后, 返回值不一定与输入值相同, 因此这里的返回值不是[Unit]类型)
  Future<E> update(E item);

  /// 删
  Future delete(Id id);
}
