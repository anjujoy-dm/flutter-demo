// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;

import '../features/menu/data/menu_remote_data_source.dart' as _i101;
import '../features/menu/data/menu_repository_impl.dart' as _i777;
import '../features/menu/domain/menu_repository.dart' as _i457;
import '../features/menu/presentation/menu_bloc.dart' as _i45;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i519.Client>(() => registerModule.httpClient);
    gh.factory<_i101.MenuRemoteDataSource>(
      () => _i101.MenuRemoteDataSource(gh<_i519.Client>()),
    );
    gh.lazySingleton<_i457.MenuRepository>(
      () => _i777.MenuRepositoryImpl(gh<_i101.MenuRemoteDataSource>()),
    );
    gh.factory<_i45.MenuBloc>(() => _i45.MenuBloc(gh<_i457.MenuRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
