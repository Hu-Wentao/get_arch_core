// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/3/24
// Time  : 8:31

import 'package:equatable/equatable.dart';

/// 实体类实现本接口
abstract class IEntity<T> extends Equatable {
  T get id;

  final bool stringify = true;
}
