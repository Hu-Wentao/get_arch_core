import 'package:flutter_test/flutter_test.dart';
import 'package:get_arch_core/get_arch_core.dart';

main() {
  test('toString', () {
    expect(EnvSign.dev.inString, 'dev');
    expect(EnvSign.prod.inString, 'prod');
    expect(EnvSign.staging.inString, 'staging');
    expect(EnvSign.test.inString, 'test');
  });
}
