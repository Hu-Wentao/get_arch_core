import 'package:flutter_test/flutter_test.dart';
import 'package:get_arch_core/interface/do.dart';

main() {
  test('DO表名测试', () {
    final d = FooBarDO();
    expect(d.tableName, 'foo_bar');
  });
}

class FooBarDO with IDO {
  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
