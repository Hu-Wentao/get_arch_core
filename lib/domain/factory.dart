import 'package:uuid/uuid.dart';

abstract class IFactory {
  static final _uuid = Uuid();

  static staticGenUuid({String space, String name}) =>
      _uuid.v5(space, name);

  String genUuid({String name}) {
    final namespace = this.runtimeType.toString();
    print(namespace);
    return staticGenUuid(space: namespace, name: name);
  }
}

