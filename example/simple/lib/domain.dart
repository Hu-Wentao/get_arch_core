import 'package:get_arch_core/domain/entity.dart';
import 'package:get_arch_core/get_arch_core.dart';

///
/// <1> Entities
/// 1.1 一个软件的核心就是实例, 这里的[IEntity]可以添加泛型, 泛型的类型即[id]的类型

///
/// [Item] 即购物车中的商品类
/// [id] 商品Id
/// [name] 商品名称
/// [count] 商品数量
class Item extends IEntity<String> {
  @override
  final String id;
  final String name;
  final int count;

  Item(this.id, this.name, this.count);

  @override
  List<Object> get props => [this.id, this.name, this.count];
}

///
/// <2> Failure
/// 2.1 每一个App都会有与业务逻辑对应的Failure
/// (在get_arch_quick_start中, 已预设一些常用Failure)



///
/// <3> IRepository

///
/// 3.1 编写IRepo, 此时用例需要做一些CRUD操作, 那么就直接继承[ICrudRepository]吧
///   抽象父类的两个泛型分别代表 Entity类型, Entity实例的id的类型,
///   如果Entity在定义的时候没有指定Id的类型, 那么这里会报错
/// 3.2 这里添加无需[lazySingleton]注解, 因为这个类是抽象类, 无法获得实例
///   应当在该类的实现类上添加注解, 并且将注解类型标记为[IItemRepo],
///   例如[ItemRepoImpl]
abstract class IItemRepo extends ICrudRepository<Item, String> {
  Future<Either<Failure, List<Item>>> readAll();
  Stream<Either<Failure, List<Item>>> observeAll();
}