// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/7/24
// Time  : 19:07

import 'package:get_arch_core/get_arch_core.dart';

///
/// 仓库抽象类
/// 建议缩写为: Repo
abstract class IRepository<Ag extends IAggregate<Id>, Id extends Identity> {
  // 返回Entity的类型
  Type get entityType => Ag.runtimeType;
}

///
/// 不使用 Identity
abstract class IRepo<T, Id> {
  // 返回Entity的类型
  Type get entityType => T.runtimeType;
}

/// 增删改查
/// 这不代表继承本类的Repo实现有且仅有以下方法
abstract class ICrudRepository<E extends IAggregate<Id>, Id extends Identity>
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

///
/// 不使用 Identity
abstract class ICrudRepo<T, ID> extends IRepo<T, ID> {
  ///
  /// Saves a given entity. Use the returned instance for further operations as the save operation might have changed the
  /// entity instance completely.
  T save(T entity);

  ///
  /// Saves all given entities.
  Iterable<T> saveAll(Iterable<T> entities);

  ///
  /// Retrieves an entity by its id.
  T findById(ID id);

  ///
  /// Returns whether an entity with the given id exists.
  bool existsById(ID id);

  ///
  /// Returns all instances of the type.
  ///
  /// @return all entities
  Iterable<T> findAll();

  ///
  /// Returns all instances of the type {@code T} with the given IDs.
  /// <p>
  /// If some or all ids are not found, no entities are returned for these IDs.
  /// <p>
  /// Note that the order of elements in the result is not guaranteed.
  ///
  /// @return guaranteed to be not {@literal null}. The size can be equal or less than the number of given
  ///         {@literal ids}.
  Iterable<T> findAllById(Iterable<ID> ids);

  ///
  /// Returns the number of entities available.
  ///
  /// @return the number of entities.
  int count();

  ///
  /// Deletes the entity with the given id.
  ///
  /// @param id must not be {@literal null}.
  /// @throws IllegalArgumentException in case the given {@literal id} is {@literal null}
  void deleteById(ID id);

  ///
  /// Deletes a given entity.
  ///
  /// @param entity must not be {@literal null}.
  /// @throws IllegalArgumentException in case the given entity is {@literal null}.
  void delete(T entity);

  ///
  /// Deletes all instances of the type {@code T} with the given IDs.
  ///
  /// @param ids must not be {@literal null}. Must not contain {@literal null} elements.
  /// @throws IllegalArgumentException in case the given {@literal ids} or one of its elements is {@literal null}.
  /// @since 2.5
  void deleteAllById(Iterable<ID> ids);

  ///
  /// Deletes all entities managed by the repository.
  void deleteAll();
}
