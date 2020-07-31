import 'package:flutter/material.dart';
import 'package:get_arch_core/get_arch_core.dart';
import 'package:simple/profile/profile.dart';

import 'infrastructure/ui.dart';

///
/// <11>  编写main(),
/// 如果使用"get_arch_quick_start"包, 则可以导入 GetArchApplicationX中的扩展方法
///   来简化初始化代码, 如
///   ```dart
///   main(){
///     await GetArchApplication.flutterRun(EnvConfig(
///       'simple'),
///     run: MyApp(),
///     );
///   }
///   ```
///   具体使用方式参见“get_arch_quick_start”中的示例

/// <11> main.dart内容如下
///
main() async {
  // 11.1 该行代码能够确保DI能够正常执行, 详情见源码注释
  WidgetsFlutterBinding.ensureInitialized();
  // 11.2 运行 await GetArchApplication.run()
  // 注意不要忘记添加注解
  await GetArchApplication.run(
      EnvConfig(
        'simple',
        '1.0.0',
        DateTime(2020, 7, 24),
        EnvSign.prod,
      ),
      // 11.3 这里十分重要, 千万不要忘记添加[SimplePackage],否则初始化代码都无法运行
      packages: [
        SimplePackage(), // 当前的Package
      ]);
  // 11.4 最后运行App
  runApp(MyApp());
}

///
/// 为例方便起见, App就直接放在main.dart中了
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Simple Cart',
        home: HomePage(),
      );
}
