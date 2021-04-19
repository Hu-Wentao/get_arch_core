import 'package:flutter_test/flutter_test.dart';
import 'package:get_arch_core/interface/do.dart';

main() {
  test('DO表名测试', () {
    final d = FooBarDo();
    expect(d.tableName, 'foo_bar');
  });
}

class FooBarDo with IDo {
  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
