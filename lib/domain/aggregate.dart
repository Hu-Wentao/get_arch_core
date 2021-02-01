import 'package:get_arch_core/domain/entity.dart';
import 'package:get_arch_core/domain/value_objects.dart';

///
/// 聚合根 实现本接口
abstract class IAggregate<IdTp extends Identity> extends IEntity<IdTp> {}
