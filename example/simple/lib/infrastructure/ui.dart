import 'package:flutter/material.dart';
import 'package:get_arch_core/get_arch_core.dart';
import 'package:simple/application.dart';
import 'package:simple/domain.dart';

/// <9> UI
/// UI是人与计算机的接口, 本质上跟网络API,数据库与计算机的接口没有什么区别

///
/// <9.1> Page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.of(context).push(
                    PageRouteBuilder(pageBuilder: (c, _, __) => CartPage())),
                child: Text('Go Item Page'),
              ),
            ],
          ),
        ),
      );
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  IItemRepo _repo;
  Stream<Either<Failure, List<Item>>> _itemsStm;

  @override
  void initState() {
    _repo = GetIt.I<IItemRepo>();
    _itemsStm = _repo.observeAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: StreamBuilder<Either<Failure, int>>(
                    stream: _itemsStm
                        .doOnListen(
                          // 重点:　在这里调用[readAll]方法刷新stream元素
                          // (与该方法的返回值无关,是数据data_source_impl中向stream控制器添加了信息)
                          () => Future.delayed(Duration(seconds: 1))
                              .then((value) => _repo.readAll()),
                        )
                        .map(
                          // 在这里转换为需要的返回值
                          (event) => event.fold(
                              (l) => left(l), (r) => right(r.length)),
                        ),
                    builder: (context, snapshot) =>
                        snapshot.data?.fold(
                            (l) => Container(child: Text('error: ${l.msg}')),
                            (r) => Center(
                                    child: Text(
                                  '$r',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ))) ??
                        Container(
                          child: CircularProgressIndicator(),
                        ))),
          ],
        ),
        body: StreamBuilder<Either<Failure, List<Item>>>(
            stream: _itemsStm.doOnListen(() => _repo.readAll()),
            builder: (context, snapshot) => Center(
                  child: snapshot.data?.fold(
                          (l) => Container(
                                child: Text('error: ${l.msg}'),
                              ),
                          (r) => ListView(
                                children: r
                                    .map((item) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ItemCard(item: item),
                                        ))
                                    .toList(),
                              )) ??
                      CircularProgressIndicator(),
                )),
      );
}

///
/// <9.2> View

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard({this.item});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 100,
            child: Center(child: Text('${item.name}')),
          ),
          ItemCardCounter(item: item),
        ],
      );
}

class ItemCardCounter extends StatelessWidget {
  final Item item;
  final UpdateItem _updateItem;
  ItemCardCounter({this.item}) : _updateItem = GetIt.I<UpdateItem>();

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          getItemButton(item, false),
          Text(
            '${item.count}',
          ),
          getItemButton(item, true),
        ],
      );

  Widget getItemButton(Item item, bool isIncrementing) {
    if (isIncrementing) {
      return getButton(
        true,
        Icons.arrow_right,
        () => _updateItem(Item(item.id, item.name, item.count + 1)),
      );
    }
    return getButton(
      item.count > 0,
      Icons.arrow_left,
      () => _updateItem(Item(item.id, item.name, item.count - 1)),
    );
  }

  Widget getButton(bool canUpdate, IconData iconData, VoidCallback callback) =>
      IconButton(
        icon: Icon(iconData),
        onPressed: canUpdate ? () => callback() : null,
      );
}
