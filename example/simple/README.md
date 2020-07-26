# simple
一个使用GetArchCore框架编写的简单购物车App, 仅用于演示架构组成. GetArchCore适用于业务逻辑较复杂的App

## Getting Started

### yaml
0. 配置yaml文件
    实际开发中, 强烈推荐使用 "get_arch_qick_start" package,能够减少大部分工作量

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
     在Application层, 已经定义了相关实体类的Repo接口, 在这里通过定义的数据源, 来实现Repo接口中的CRUD操作.

7. (ViewModel) 编写ViewModel/ Presenters/ State-Events/ Provder
    这里以"get_state"为例, 使用MVVM模式来控制解耦视图与业务逻辑
   其实还可以不使用任何状态管理方案, 使用LiveData/LiveModel, 直接将状态放在Repo中管理.

### Infrastructure层
8. (DataSourceImpl) 编写DataSource的实现类
   (如果应用比较简单, 数据源实现类中的代码, 可以直接放到Repo实现类中)

9. (View) 编写UI页面
