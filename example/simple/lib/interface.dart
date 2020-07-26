import 'package:dartz/dartz.dart';
import 'package:get_arch_core/application/live_data.dart';
import 'package:get_arch_core/domain/i_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:simple/application.dart';
import 'package:simple/domain.dart';

/// <5> DataSource
/// 数据源, 可以是API, 蓝牙设备, 本地存储等

///
/// 这里定义一个不具有持久化存储能力的Mock本地数据源
abstract class IItemLocalource {
  void saveItem(Item i, {String k});

  Item getItem(String k);

  LiveModel<Item> obsItem(String id);
}

///
/// <6> Repository 实现
/// 这里编写在application中定义的抽象Repo类

///
/// Item 仓库实现
/// 6.1 特别注意, 这里不再使用 [lazySingleton]注解,
///   而是使用LazySingleton(as: IItemRepo)
///   这代表该类的实例将会被注册为 [IItemRepo]类型
/// 6.2 在Repo的实现类中, 可以将数据源作为属性, 以方便完成操作
/// 6.3 如果有多个数据源, Repo的实现方法中, 实现数据缓存等功能
@LazySingleton(as: IItemRepo)
class ItemRepoImpl extends IItemRepo {
  final IItemLocalource _itemSource;

  ItemRepoImpl(this._itemSource);

  @override
  Future<Either<Failure, Item>> create(Item i) async {
    try {
      _itemSource.saveItem(i);
      return right(i);
    } on Failure catch (f) {
      return left(f);
    } catch (e, s) {
      return left(UnknownFailure('ItemRepoImpl.create:\n$e\n', s));
    }
  }

  @override
  Future<Either<Failure, Unit>> delete(String id) async {
    try {
      _itemSource.saveItem(null, k: id);
      return right(null);
    } on Failure catch (f) {
      return left(f);
    } catch (e, s) {
      return left(UnknownFailure('ItemRepoImpl.delete:\n$e\n', s));
    }
  }

  @override
  LiveModel<Item> observe(String id) => _itemSource.obsItem(id);

  @override
  Future<Either<Failure, Item>> read(String id) async {
    try {
      final r = _itemSource.getItem(id);
      return right(r);
    } on Failure catch (f) {
      return left(f);
    } catch (e, s) {
      return left(UnknownFailure('ItemRepoImpl.read:\n$e\n', s));
    }
  }

  @override
  Future<Either<Failure, Item>> update(Item i) async {
    try {
      _itemSource.saveItem(i);
      return right(i);
    } on Failure catch (f) {
      return left(f);
    } catch (e, s) {
      return left(UnknownFailure('ItemRepoImpl.update:\n$e\n', s));
    }
  }
}
