import 'package:dartz/dartz.dart';
import 'package:get_arch_core/domain/i_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:simple/domain.dart';
import 'package:rxdart/rxdart.dart';

/// <5> DataSource
/// 数据源, 可以是API, 蓝牙设备, 本地存储等

///
/// 这里定义一个本地数据源
/// 5.1 一般不建议使用[osbAll]这样的方法, 可能会造成性能问题
///   例如本例中的商品列表, UI仅仅改变了某一种商品的数量,
///   而数据源却需要刷新所有数据, 整个列表也将重建.
///   Stream返回值适用于蓝牙数据传输或者WebSocket数据传输
abstract class IItemLocalSource {
  void saveItem(Item i, {String id});

  Item getItem(String k);

  Stream<Item> obsItem(String id);

  Stream<List<Item>> osbAll();

  Future<List<Item>> getAll();
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
  final IItemLocalSource _itemSource;

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
      _itemSource.saveItem(null, id: id);
      return right(null);
    } on Failure catch (f) {
      return left(f);
    } catch (e, s) {
      return left(UnknownFailure('ItemRepoImpl.delete:\n$e\n', s));
    }
  }

  @override
  Stream<Either<Failure, Item>> observe(String id) async* {
    try {
      yield* _itemSource.obsItem(id).map((event) => right(event));
    } on Failure catch (f) {
      yield left(f);
    } catch (e, s) {
      yield left(UnknownFailure('ItemRepoImpl.observe:\n$e\n', s));
    }
  }

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

  @override
  Stream<Either<Failure, List<Item>>> observeAll() => _itemSource
      .osbAll()
      .map<Either<Failure, List<Item>>>(
        (event) => right(event),
      )
      // 注意, [onErrorReturnWith]是rx_dart包中的方法
      .onErrorReturnWith((e) => left(Failure.auto(e)))
      .asBroadcastStream();

  @override
  Future<Either<Failure, List<Item>>> readAll() async {
    try {
      final r = await _itemSource.getAll();
      return right(r);
    } on Failure catch (f) {
      return left(f);
    } catch (e, s) {
      return left(UnknownFailure('ItemRepoImpl.readAll:\n$e\n', s));
    }
  }
}
