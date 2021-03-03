import 'package:get_arch_core/gac_base.dart';

/// ValueObject 是 immutable 的
/// ValueObject 包含值验证逻辑, 一般放置在构造方法内
abstract class ValueObject extends Equatable {
  @override
  final bool stringify = true;
}
