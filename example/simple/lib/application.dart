import 'package:get_arch_core/application/i_usecase.dart';
import 'package:get_arch_core/get_arch_core.dart';
import 'package:injectable/injectable.dart';
import 'package:simple/domain.dart';


///
/// <4> UseCase
/// 用例即实体类的行为, 即业务逻辑, 如果没什么复杂的业务逻辑, 比如仅仅是一些CRUD操作,
/// 那么推荐直接调用 Repository的方法.

///
/// 4.1 编写用例
/// 当然, 用例也可以像 [IItemRepo]一样, 定义为抽象类,
/// 但是对于绝大多数用例而言, 没有必要弄的这样复杂
///
/// 删除Item
/// 这个用例没有输入参数, 也没有返回值, 因此[Out]和[In]泛型都设为[Unit]
/// ([DeleteItem] 当然也可以命名为 "ClearCart")
///
/// 4.2 记得在这里添加[lazySingleton]注解, 这样自动生成的注解代码可以在获取用例的时候自动填写参数返回实例
@lazySingleton
class DeleteItem extends UseCase<Unit, String> {
  final IItemRepo _repo;

  DeleteItem(this._repo);
  @override
  Future<Either<Failure, Unit>> call(String id) => _repo.delete(id);
}

///
/// 获取Item
@lazySingleton
class GetItem extends UseCase<Item, String> {
  final IItemRepo _repo;

  GetItem(this._repo);
  @override
  Future<Either<Failure, Item>> call(String id) => _repo.read(id);
}

///
/// 观察Item
/// 4.3 这里要特别注意, 该用例是继承自[ObservableUseCase], 而不是[UseCase]
///  [ObservableUseCase] 方法返回类型为[LiveModel], 它会主动推送最新的值
@lazySingleton
class ObsItem extends ObservableUseCase<Item, String> {
  final IItemRepo _repo;

  ObsItem(this._repo);

  @override
  Stream<Either<Failure, Item>> call(String id) => _repo.observe(id);
}

///
/// 更新Item
@lazySingleton
class UpdateItem extends UseCase<Item, Item> {
  final IItemRepo _repo;

  UpdateItem(this._repo);
  @override
  Future<Either<Failure, Item>> call(Item i) => _repo.update(i);
}
