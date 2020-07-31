## [1.0.0] - 2020/7/31
* add : LiveData, LiveModel
* add : "IGetArchPackage.interfaceImplRegisterStatus"
* feat(liva_data): add "ControlledLiveData", Allows data to be refreshed by the instance
* feat(get_arch_core): export 'package:meta/meta.dart'; dartz.right;dartz.left;
* feat(i_entity): Added generics to the IEntity
* feat : get_arch_core export Unit
* feat : StmUseCase rename to ObservableUseCase
* feat : get_arch_core.dart export "EnvConfig"
* remove : flutter sdk dependencies
* refactor: replace "flutter_test" package with "test" package
* deprecated : "printBoolStateWithRegTypeName" please use "IGetArchPackage.interfaceImplRegisterStatus"

## [0.6.1] - 2020/7/4  - fix bug
* Fixed a bug where the GetArchApplication.run() mockDI parameter was null
* remove: IVerifiable
* remove: injectable package

## [0.6.0] - 2020/7/3  - critical bug
* move some unimportant file to GetArchQuickStart pacakge

## [0.5.1] - 2020/7/3
* update(GetArchUniverse.png);
* fix(value_validators.dart): vStrLength logical error
* add(error.dart): class "ValidateError"

## [0.5.0] - 2020/7/2
* remove(value_objects);
* rename(i_common.dart): from common_interface.dart;
* rename(i_dto.dart): from i_common_interface.dart;
* feat(get_arch_core): export verify.dart;
* add(GetArch.png): GetArch structure
* feat(GetArchApplication): run() can add mockDI param for unit testing.
* refactor: beautify output info
* add: Getting Started

## [0.4.0] - 2020/6/30
* refactor(get_arch_application): hide GetArchApplication.endInfo;
* feat(IGetArchPackage): init() add try..catch
* feat(IGetArchPackage): boolConfigFieldsFormatPrint(),help to get the EnvConfig describe String.
* feat: use IDialog.toast instead of IDialog.text
* remove:
(get_arch_application.iconfig.dart): Other projects may import this "$initGetIt()" incorrectly
(IDialogHelper): use IDialog instead of IDialogHelper
* export :
add(get_arch_core.dart): export freezed_annotation,
add(get_arch_core.dart): export injectable

## [0.3.0] - 2020/6/25
* feat: move dartz.Either to get_arch_core.dart
* feat: GetArchApplication.run() can catch exception now
* feat: GetArch package can profile package EnvConfig
* add(EnvConfig): new Constructor "EnvConfig.sign()"for experience developer
* refactor(EnvConfig): change String envSign to EnvSign envSign
* refactor(extension.dart): rename hex to hexVal
* add(get_arch_application.dart): printConfig field add value "true"

## [0.2.1] - 2020/6/24
* add(i_dialog): rename from IDialogHelper
* format all files with flutter format

## [0.2.0] - 2020/6/18
* GetArchApplication add printPackageConfigInfo()
* ProfileModule rename to ProfileGetArchCore
* ISocketController remove: generics,add decodedStream
* IDialogHelper  err() add dynamic tag param
* INetConfig extends Equatable


## [0.1.2] - 2020/6/17

* refactor(ISocketController): add new data method,addJson(),addRaw()

## [0.1.1] - 2020/6/17

* add New ability to retrieve EnvConfig using DI

## [0.1.0] - 2020/6/17

* add GetArchApplication.run()
* add IGetArchPackage

## [0.0.3] - 2020/6/16

* add(IHttp): put(),delete(),head(),patch()
* rename(IWsController): ISocketController

## [0.0.2] - 2020/6/15

* add export package

## [0.0.1] - 2020/6/15

* first version
