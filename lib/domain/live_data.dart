// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/7/17
// Time  : 17:59

import 'dart:async';

import 'package:get_arch_core/get_arch_core.dart';
import 'package:meta/meta.dart';

///
/// 提供可观察的数据
///
/// [LiveData]<T> 是对数据<T>的包装, 将数据包装为数据流, 让UI及时随数据变化而刷新
/// 特性:
///   与安卓的LiveData不同的是, 这里无法直接通过方法修改[T]值, 只能通过 UseCase/Repo 修改
///   UseCase/Repo调用相关方法, 驱动 [_obsData]的StreamController,来刷新值
///
/// 注意:
///   请将 [LiveData] / [LiveModel]放在ViewModel中使用
///
abstract class LiveData<T> {
  ///
  /// [obsData] 得到可观察的数据
  /// [getData] 请求获取最新的数据的方法
  /// [getDataCanRefreshObsData]
  ///   如果[getData]方法在调用并获取到最新的结果后,[obsData]不会主动推送最新的值,则将该值设为false
  factory LiveData({
    Future<T> Function() getData,
    @required Stream<T> obsData,
    bool getDataCanRefreshObsData = true,
  }) =>
      getDataCanRefreshObsData
          ? _LiveDataImpl<T>(getData, obsData)
          : _LiveDataAidedOsbRefreshImpl<T>(getData, obsData);

  ///
  /// 从数据源获取最新的数据
  ///
  /// 注意, 调用[_getData]方法成功后, [_obsData]也应当同步刷新最新的值,
  /// 如果无法做到, 则应当
  Future<T> get getData;

  ///
  /// 观察数据
  /// 在首次观察时,即返回一次最新的数据
  Stream<T> get obsData;

  ///
  /// 直接返回缓存的快照数据
  T get snapshot;

  ///
  /// 获取已缓存的最新的数据
  /// 如果此时数据没有初始化,则自动调用获取数据的方法
  Future<T> get cachedData;
}

///
/// 标准实现,
/// 请确保, 当[getData]方法调用时, [obsData]会主动推送最新数据
class _LiveDataImpl<T> implements LiveData<T> {
  final Future<T> Function() _getData;
  final Stream<T> _obsData;

  T _latestData;

  ///
  /// [obsData] 得到可观察的数据
  /// [getData] 请求获取最新的数据的方法
  /// [getDataCanRefreshObsData]
  ///   如果[getData]方法在调用并获取到最新的结果后,[obsData]不会主动推送最新的值,则将该值设为false
  _LiveDataImpl(
    Future<T> Function() getData,
    Stream<T> obsData,
  )   : _getData = getData,
        _obsData = obsData.isBroadcast ? obsData : obsData.asBroadcastStream() {
    obsData.listen((event) => _latestData = event);
  }

  ///
  /// 从数据源获取最新的数据
  ///
  /// 注意, 调用[_getData]方法成功后, [_obsData]也应当同步刷新最新的值,
  /// 如果无法做到, 则应当使用 [_LiveDataAidedOsbRefreshImpl]
  Future<T> get getData => _getData();

  ///
  /// 观察数据
  /// 在首次观察时,即返回一次最新的数据
  Stream<T> get obsData async* {
    yield await cachedData;
    yield* _obsData;
  }

  ///
  /// 直接返回缓存的快照数据
  T get snapshot => _latestData;

  ///
  /// 获取已缓存的最新的数据
  /// 如果此时数据没有初始化,则自动调用获取数据的方法
  Future<T> get cachedData async => _latestData ??= await getData;
}

///
/// 主动刷新实现
/// 仅当 [getData]方法调用时, [obsData]不会主动推送最新数据的情况下才使用本实现
/// todo 拆分为一个新的类, 可以命名为 "AidedLiveData", 该类自己持有一个StreamController, 其功能更加接近与安卓的LiveData
class _LiveDataAidedOsbRefreshImpl<T> implements LiveData<T> {
  final Future<T> Function() _getData;
  final Stream<T> _obsData;
  final bool getDataCanRefreshObsData = true;

  T _latestData;

  ///
  /// [obsData] 得到可观察的数据
  /// [getData] 请求获取最新的数据的方法
  /// [getDataCanRefreshObsData]
  ///   如果[getData]方法在调用并获取到最新的结果后,[obsData]不会主动推送最新的值,则将该值设为false
  _LiveDataAidedOsbRefreshImpl(
    Future<T> Function() getData,
    Stream<T> obsData,
  )   : _getData = getData,
        _obsData = obsData.isBroadcast ? obsData : obsData.asBroadcastStream() {
    obsData.listen((event) => _latestData = event);
  }

  ///
  /// 从数据源获取最新的数据
  ///
  /// 注意, 调用[_getData]方法成功后, [_obsData]也应当同步刷新最新的值,
  /// 如果无法做到, 则应当
  Future<T> get getData {
    if (getDataCanRefreshObsData) {
      _getData();
    } else {
      // fixme
//      _obsData.
    }
  }

  ///
  /// 观察数据
  /// 在首次观察时,即返回一次最新的数据
  Stream<T> get obsData async* {
    yield await cachedData;
    yield* _obsData;
  }

  ///
  /// 直接返回缓存的快照数据
  T get snapshot => _latestData;

  ///
  /// 获取已缓存的最新的数据
  /// 如果此时数据没有初始化,则自动调用获取数据的方法
  Future<T> get cachedData async => _latestData ??= await getData;
}

///
/// 配合[ObservableUseCase]或[UseCase]使用
abstract class LiveModel<T> extends LiveData<Either<Failure, T>> {
  factory LiveModel({
    @required Future<Either<Failure, T>> Function() getData,
    @required Stream<Either<Failure, T>> obsData,
    bool getDataCanRefreshObsData = true,
  }) =>
      LiveData(
          getData: getData,
          obsData: obsData,
          getDataCanRefreshObsData: getDataCanRefreshObsData);
//      getDataCanRefreshObsData
//          ? _LiveDataImpl<Either<Failure, T>>(obsData, getData)
//          : _LiveDataAidedOsbRefreshImpl<Either<Failure, T>>(obsData, getData);
  ///
  /// 本方法是对 [snapshot].fold() 的包装
  ///
  /// [onNull] 当[snapshot]为null时, 将会调用改函数, 一般是由于[snapshot]尚未获取初始值导致的
  ///   该值可以为null, 此时会调用 [onData], 传入参数为 null
  /// [onFailure] 当LiveModel值为Failure时被调用
  /// [onData] 当LiveModel值正常时被调用
  snapFold<R>({
    R Function() onNull,
    @required R Function(Failure f) onFailure,
    @required R Function(T data) onData,
  }) =>
      snapshot?.fold(onFailure, onData) ?? (onNull ?? onData(null));
}
