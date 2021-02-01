// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/3/24
// Time  : 8:31

import 'package:get_arch_core/domain/value_objects.dart';

/// 实体类实现本接口
abstract class IEntity<IdTp extends Identity> {
  IdTp get id;
}

///
/// 聚合根 实现本接口
abstract class IAggregate<IdTp extends Identity> extends IEntity<IdTp> {}
