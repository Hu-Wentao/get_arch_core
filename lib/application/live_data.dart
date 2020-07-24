// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/7/17
// Time  : 17:59

import 'dart:async';

import 'package:get_arch_core/get_arch_core.dart';

///
/// 提供可观察的数据
///
/// [LiveData]<T> 是对数据<T>的包装, 将数据包装为数据流, 让UI及时随数据变化而刷新
/// 特性:
///   与安卓的LiveData不同的是, 这里无法直接通过方法修改[T]值, 只能通过 UseCase/Repo 修改
///   UseCase/Repo调用相关方法, 驱动 [_obsData]的StreamController,来刷新值
///
/// 注意:
///   请将 [LiveData] / [ControlledLiveModel]放在ViewModel中使用
///
/// 请确保, 当[getData]方法调用时, [obsData]会主动推送最新数据
class LiveData<T> {
  final Future<T> Function() _getData;
  final Stream<T> _obsData;

  T _latestData;

  LiveData({
    Future<T> Function() getData,
    Stream<T> obsData,
  })  : _getData = getData,
        _obsData = obsData == null
            ? null
            : obsData.isBroadcast ? obsData : obsData.asBroadcastStream() {
    obsData?.listen((event) => _latestData = event);
  }

  ///
  /// 从数据源获取最新的数据
  ///
  /// 注意, 调用[getData]方法成功后, [obsData]也应当同步刷新最新的值,
  /// 如果无法做到, 应使用[ControlledLiveData]
  Future<T> get getData => _getData == null ? _latestData : _getData();

  ///
  /// 观察数据
  /// 在首次观察时,即返回一次最新的数据
  Stream<T> get obsData => _obsData;

  ///
  /// 直接返回缓存的快照数据
  T get snapshot => _latestData;

  ///
  /// 获取已缓存的最新的数据
  /// 如果此时数据没有初始化,则自动调用获取数据的方法
  Future<T> get cachedData async => _latestData ?? await getData;
}

///
/// [ControlledLiveDataMix] 持有[StreamController], 拥有向[obsData]添加数据的能力
mixin ControlledLiveDataMix<T> on LiveData<T> {
  StreamController<T> _ctrl = StreamController.broadcast();

  void postData(T data) => _ctrl.add(data);

  @override
  Stream<T> get obsData => _ctrl.stream;
}

///
/// 主动刷新实现
/// 仅当 [getData]方法调用时, [obsData]不会主动推送最新数据的情况下才使用本实现
class ControlledLiveData<T> extends LiveData<T> with ControlledLiveDataMix<T> {
  ControlledLiveData({Future<T> Function() getData}) : super(getData: getData);
}

/// 包装LiveData<Either<Failure, T>>
mixin LiveModelMix<T> on LiveData<Either<Failure, T>> {
  ///
  /// 本方法是对 [snapshot].fold() 的包装
  ///
  /// [onNull] 当[snapshot]为null时, 将会调用改函数, 一般是由于[snapshot]尚未获取初始值导致的
  ///   当[snapshot]和[onNull]均为null时, 会调用 [onData], 传入参数为 null
  /// [onFailure] 当LiveModel值为Failure时被调用
  /// [onData] 当LiveModel值正常时被调用
  snapFold<R>({
    R Function() onNull,
    @required R Function(Failure f) onFailure,
    @required R Function(T data) onData,
  }) =>
      snapshot?.fold(onFailure, onData) ?? (onNull ?? onData(null));
}

///
/// 配合[ObservableUseCase]或[UseCase]使用
class LiveModel<T> extends LiveData<Either<Failure, T>> with LiveModelMix<T> {
  LiveModel({
    Future<Either<Failure, T>> Function() getData,
    Stream<Either<Failure, T>> obsData,
  }) : super(getData: getData, obsData: obsData);
}

///
/// [ControlledLiveModel] 持有[StreamController], 拥有向[obsData]添加数据的能力
class ControlledLiveModel<T> extends LiveModel<T>
    with LiveModelMix<T>, ControlledLiveDataMix<Either<Failure, T>> {
  ControlledLiveModel({Future<Either<Failure, T>> Function() getData})
      : super(getData: getData);

  void postRight(T data) => this.postData(right(data));

  void postLeft(Failure failure) => this.postData(left(failure));
}
