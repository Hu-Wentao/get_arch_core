// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/3/24
// Time  : 8:31

import 'package:get_arch_core/get_arch_core.dart';

///
/// 实体类实现本接口
abstract class IEntity<Id extends Identity> extends Equatable {
  Id get id;

  final bool stringify = true;
}
