// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/3/24
// Time  : 8:31

import 'package:equatable/equatable.dart';

/// 值对象都要实现本接口
abstract class IVerifiable {
  // 判断输入值是否合法
  bool isValid();
}

/// 实体类实现本接口
abstract class IEntity extends Equatable {
  String get id;

  final bool stringify = true;
}