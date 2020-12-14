// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:simple/application.dart';
import 'package:simple/infrastructure/data_source_impl.dart';
import 'package:simple/interface.dart';

import '../domain.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

void $initGetIt(GetIt g, {String environment}) {
  final gh = GetItHelper(g, environment);
  gh.lazySingleton<IItemLocalSource>(() => MockItemLocalImpl());
  gh.lazySingleton<IItemRepo>(() => ItemRepoImpl(g<IItemLocalSource>()));
  gh.lazySingleton<ObsItem>(() => ObsItem(g<IItemRepo>()));
  gh.lazySingleton<UpdateItem>(() => UpdateItem(g<IItemRepo>()));
  gh.lazySingleton<DeleteItem>(() => DeleteItem(g<IItemRepo>()));
  gh.lazySingleton<GetItem>(() => GetItem(g<IItemRepo>()));
}
