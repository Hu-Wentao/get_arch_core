import 'package:get_arch_core/application/live_data.dart';
import 'package:simple/domain.dart';
import 'package:simple/interface.dart';

///
/// <8> DataSourceImpl
/// 数据源的实现, 这里实现 interface中的数据源接口

class FakeItemLocalImpl extends IItemLocalource {
  static const _item_id_prefix = '_item_id_prefix';

  Map _fakeStorage;

  Map<String, LiveModel<Item>> _obsMap; // <id, entity>
  FakeItemLocalImpl() {
    _fakeStorage = {
      '${_item_id_prefix}11': Item('11', 'name', 2),
      '${_item_id_prefix}12': Item('12', 'asdf', 4),
      '${_item_id_prefix}13': Item('13', 'asdf', 6),
      '${_item_id_prefix}14': Item('14', 'amqe', 9),
      '${_item_id_prefix}15': Item('15', 'nxze', 1),
    };
    _obsMap = Map<String, LiveModel<Item>>();
  }
  @override
  Item getItem(String k) {
    return _fakeStorage[k];
  }

  @override
  LiveModel<Item> obsItem(String k) {
    final lv = _obsMap[k] ??= ControlledLiveModel<Item>(
//      getData: () => getItem(k),
    );
  }

  @override
  void saveItem(Item i, {String k}) {
    // TODO: implement saveItem
  }
}
