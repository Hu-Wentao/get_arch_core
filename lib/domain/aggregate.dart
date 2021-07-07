import 'package:get_arch_core/get_arch_core.dart';

///
/// 聚合根
abstract class IAggregate<Id extends Identity> extends IEntity<Id> {}

abstract class IAgg<Id> extends IEtt<Id> {}
