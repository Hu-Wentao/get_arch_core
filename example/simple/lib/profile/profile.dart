import 'package:get_arch_core/get_arch_core.dart';
import 'package:injectable/injectable.dart';
import 'package:simple/profile/profile.config.dart';

///
/// <10> 配置 XxxPackage

///
/// 10.1 首先继承[IGetArchPackage]
class SimplePackage extends IGetArchPackage {
  // 10.2 这里的[pkgEnv]参数是用于指定该Package所使用的环境的, 一般仅在测试时使用
  // 因此最好将该参数设为可选
  SimplePackage({EnvConfig pkgEnv}) : super(pkgEnv);

  // 10.3 这里时执行一些初始化操作的地方, 例如初始化本地存储等等, 该代码将在DI代码之前运行,
  // 因此这里无法使用 GetIt.I来获取实例
  @override
  Future<void> initPackage(EnvConfig config) => null;

  // 10.4 初始化依赖注入代码
  // 这里使用了 injectable通过注解来生成DI代码, 详见[initDI] 函数
  @override
  Future<void> initPackageDI(EnvConfig config) async =>
      await initDI(env: config.envSign);

  // 10.5 这里的返回值表示当前Package中注册的实现开关状态,
  // 由于本例直接使用了自动注册的代码, 无法控制开关,
  // 所以这里就不实现[interfaceImplRegisterStatus]了, 该方法也只是用于打印调试信息
  @override
  Map<Type, bool> get interfaceImplRegisterStatus => null;

  // 10.6 与上例一样, 该方法同样也只是用于打印调试信息, 可以直接返回null
  @override
  Map<String, String> printOtherStateWithEnvConfig(EnvConfig config) => null;
}

/// 10.4.1 配置自动生成依赖注入代码
///   随便定义一个函数, 这里定义了 initDI,内部添加 $initGetIt(GetIt.I, environment: env.toString());
///   添加后该行代码报错, 提示没有该方法, 因为这个方法现在还没有被生成
/// 10.4.2 为方法添加[injectableInit]注解
/// 10.4.3 打开控制台, 输入 flutter pub run build_runner build
///   等待代码生成完毕后, 在导入新创建的 xxx.config.dart 包,
///   此时 $initGetIt 方法就不再报错了.
@injectableInit
Future<void> initDI({@required EnvSign env}) async {
  $initGetIt(GetIt.I, environment: env.toString());
}
