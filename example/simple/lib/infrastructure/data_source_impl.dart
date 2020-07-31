// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/7/26
// Time  : 18:01

import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:simple/domain.dart';
import 'package:simple/interface.dart';

///
/// <8> DataSourceImpl
/// 数据源的实现, 这里实现 interface中的数据源接口
/// 数据源内部不推荐使用try..catch, 异常统一在Repo中处理

///
/// 模拟的Item本地存储实现
/// 8.1 注意加上注解
@LazySingleton(as: IItemLocalSource)
class MockItemLocalImpl extends IItemLocalSource {
  Map<String, Item> _fakeStorage; // <id, entity>

  // 监听单个元素变化的流
  Map<String, StreamController<Item>> _stmMap;
  // 监听任意元素变化的流
  StreamController<List<Item>> _stmAll;

  MockItemLocalImpl() {
    _fakeStorage = {
      '11': Item('11', 'name', 2),
      '12': Item('12', 'asdf', 4),
      '13': Item('13', 'asdf', 6),
      '14': Item('14', 'amqe', 9),
      '15': Item('15', 'nxze', 1),
    };
    _stmMap = Map<String, StreamController<Item>>();
  }

  StreamController<Item> getCtrlByKey(String key, {bool noCreate: false}) =>
      noCreate
          ? _stmMap[key]
          : _stmMap[key] ??= StreamController<Item>.broadcast(
              onCancel: () => _stmMap.remove(key));

  ///
  /// 刷新 _stmAll的数据
  _stmAllRefresh() {
    _stmAll ??= StreamController.broadcast();
    _stmAll.add(_fakeStorage.values.toList());
  }

  @override
  Item getItem(String k) => _fakeStorage[k];

  @override
  Stream<Item> obsItem(String k) => getCtrlByKey(k).stream;

  @override
  void saveItem(Item i, {String id}) {
    final k = id ?? i.id;
    _fakeStorage[k] = i;
    getCtrlByKey(k, noCreate: true)?.add(i);
    _stmAllRefresh();
  }

  @override
  Stream<List<Item>> osbAll() =>
      (_stmAll ??= StreamController.broadcast()).stream;

  @override
  Future<List<Item>> getAll() async {
    // 读取数据的同时, 也向 [obsAll]发出事件
    _stmAllRefresh();
    return _fakeStorage.values.toList();
  }
}
