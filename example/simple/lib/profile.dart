import 'package:get_arch_core/get_arch_core.dart';

///
///
class SimplePackage extends IGetArchPackage {
  SimplePackage({EnvConfig pkgEnv}) : super(pkgEnv);

  @override
  Future<void> initPackage(EnvConfig config) {
    // TODO: implement initPackage
    throw UnimplementedError();
  }

  @override
  Future<void> initPackageDI(EnvConfig config) {
    // TODO: implement initPackageDI
    throw UnimplementedError();
  }

  @override
  // TODO: implement interfaceImplRegisterStatus
  Map<Type, bool> get interfaceImplRegisterStatus => throw UnimplementedError();

  @override
  Map<String, String> printOtherStateWithEnvConfig(EnvConfig config) {
    // TODO: implement printOtherStateWithEnvConfig
    throw UnimplementedError();
  }
}
