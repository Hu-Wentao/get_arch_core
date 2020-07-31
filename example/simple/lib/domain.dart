import 'package:get_arch_core/domain/i_entity.dart';
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
