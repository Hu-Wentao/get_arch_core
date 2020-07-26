import 'package:flutter/material.dart';
import 'package:get_arch_core/get_arch_core.dart';

///
/// 首先编写main(), 这里可以导入 "get_arch_quick_start"包中的 GetArchApplicationX
///   来简化代码, 如
///   ```dart
///   main(){
///     await GetArchApplication.flutterRun(EnvConfig(
///       'simple'),
///     run: MyApp(),
///     );
///   }
///   ```
///   具体使用方式参见“get_arch_quick_start”中的示例
///
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetArchApplication.run(EnvConfig(
    'simple',
    '1.0.0',
    DateTime(2020, 7, 24),
    EnvSign.prod,
  ));
  runApp(MyApp());
}

///
/// 为例方便起见, App就直接放在main.dart中了
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Simple Cart',
//        home: ,
      );
}
