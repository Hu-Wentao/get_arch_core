# simple
一个使用GetArchCore框架编写的简单购物车App, 仅用于演示架构组成. GetArchCore适用于业务逻辑较复杂的App

## Getting Started
* 本例只是做简单的架构文件结构示例, 更多使用细节(例如json与实体类的转换, 网络请求等, 可以参考其他GetArchPackage示例)

* 软件分为4层, Domain层, Application层, Interface层, Infrastructure层, 外加Profile代码, 上层不需要了解下层实现.
各层可以根据代码量来选择一层代码是用一个包管理, 还是用一个文件管理, 如果代码够少, 当然也可以将所有代码放在同一个文件中


### yaml
0. 配置yaml文件

* 实际开发中, 强烈推荐使用 "get_arch_qick_start" package,能够减少大部分工作量
确保 "dev_dependencies" 添加了
  injectable_generator: ^1.0.2
  build_runner: ^1.10.0
* dev依赖必须手动添加, GetArchQuickStart无法提供


### Domain层
1. (Entity) 编写App所需的实体类
    实体类就是面向对象中最重要的对象
2. (Failure) 编写可能发生的错误 Failure类 ("get_arch_qick_start"中已经预定义了一些Failure)
       Failure是对Error及其StackTrace的包装,
### Application层
3. (IRepo) 编写Entity对应的Repository接口
       Repository负责实体类的CRUD, 让业务逻辑不再关心实体类"从哪来, 到哪去"的问题.
4. (UseCase) 编写业务逻辑
    (如果应用比较简单, 比如仅仅是对CRUD的简单包装, 可以考虑直接调用Repo的CRUD方法, 不再编写用例)


### Interface层
5. (IDataSource) 编写DataSource接口
    (如果应用比较简单, 实际上也无需编写数据源接口, 可以直接在Repository实现类中编写数据的CRUD逻辑)
    数据源可以是本地存储, 后端API, 蓝牙设备等等, Repo实现类可以通过引用不同的数据源, 来实现数据缓存等功能.
    让用例(业务逻辑)不再关心数据读写的实现问题

6. (RepoImpl) 编写Repository实现类
    在Application层, 已经定义了相关实体类的Repo接口, 在这里通过之前定义的数据源, 来实现Repo接口中的CRUD操作.
    *注意* Repo只应当出现CRUD逻辑, 业务逻辑请移动到 UseCase(推荐) 或者放入ViewModel(不推荐)

7. (ViewModel) 编写ViewModel(MVVM)/ Presenters(MVP)/ State-Events(BLoC)/ Provder...
    推荐使用"GetState", "BLoC", "Provider"等包管理状态.
    不使用任何状态管理方案当然也是可行的, 本例就是直接将状态存储在data_source和UI中,
    通过监听data_source获得的stream来刷新UI.
    这样的做法仅适用于逻辑较简单的App;

### Infrastructure层
8. (DataSourceImpl) 编写DataSource的实现类
   (如果应用比较简单, 数据源实现类中的代码, 可以直接放到Repo实现类中)

9. (UI) 编写UI页面, 这里分为 Page 与 View

### Profile

10. (XxxPackage) 配置项目Package以及依赖注入代码生成
    注意,在更改注解之后, 务必在控制台中输入 flutter pub run build_runner build, 来刷新生成的代码.


### 配置main.dart

11. (main.dart) 初始化项目代码
    在这里也可以放入MyApp的代码, 以便测试.
    当然也可以将MyApp移动到 infrastructure/ui路径下