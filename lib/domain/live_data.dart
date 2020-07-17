// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/7/17
// Time  : 17:59


import 'package:get_arch_core/get_arch_core.dart';

///
/// [LiveData] 是对数据的包装, 将数据包装为数据流
/// [obsData] 可观察的数据
/// [getData] 请求获取最新的数据
/// 特性:
///   与安卓的LiveData不同的是, 这里无法直接通过方法修改[T]值, 只能通过 UseCase/Repo 修改
///   UseCase/Repo调用相关方法, 驱动 [obsData]的StreamController,来刷新值
///
/// 注意:
///   请将 [LiveData] / [LiveModel]放在ViewModel中使用
///
class LiveData<T> {
  T _latestData;
  final Stream<T> _obsData;
  final Future<T> Function() getData;
  LiveData(Stream<T> obsData, this.getData)
      : _obsData = obsData.isBroadcast ? obsData : obsData.asBroadcastStream() {
    _obsData.listen((event) => _latestData = event);
  }

  T get syncData => _latestData;

  Future<T> get asyncData async {
    _latestData ??= await getData();
    return _latestData;
  }

  /// 在首次监听时, 将会收到最新的data
  Future<void> listen(void onData(T event)) async {
    onData(await asyncData);
    _obsData.listen(onData);
  }
}

///
/// 配合[ObservableUseCase], [UseCase]使用
class LiveModel<T> extends LiveData<Either<Failure, T>> {
  LiveModel(
    Stream<Either<Failure, T>> obsData,
    Future<Either<Failure, T>> Function() getData,
  ) : super(obsData, getData);
}
