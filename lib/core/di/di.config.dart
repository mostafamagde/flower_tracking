// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/apply_screen/data/datasources/contract/apply_contract_datasource.dart'
    as _i954;
import '../../features/auth/apply_screen/data/datasources/remote/apply_remote_datasource.dart'
    as _i894;
import '../../features/auth/apply_screen/data/repositories/apply_repo_impl.dart'
    as _i18;
import '../../features/auth/apply_screen/domain/repositories/apply_driver_repo.dart'
    as _i763;
import '../../features/auth/apply_screen/domain/usecases/apply_driver_use_case.dart'
    as _i510;
import '../../features/auth/apply_screen/presentation/cubit/apply_screen_cubit.dart'
    as _i936;
import '../api_manager/api_di.dart' as _i285;
import '../api_manager/api_manager.dart' as _i266;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioInjection = _$DioInjection();
    gh.singleton<_i361.Dio>(() => dioInjection.injectDio());
    gh.singleton<_i266.RestClient>(
      () => dioInjection.injectRestClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i954.ApplyContractDatasource>(
      () => _i894.ApplyRemoteDatasourceImpl(gh<_i266.RestClient>()),
    );
    gh.factory<_i763.ApplyRepository>(
      () => _i18.ApplyRepoImpl(gh<_i954.ApplyContractDatasource>()),
    );
    gh.factory<_i510.ApplyDriverUseCase>(
      () => _i510.ApplyDriverUseCase(gh<_i763.ApplyRepository>()),
    );
    gh.factory<_i936.ApplyScreenCubit>(
      () => _i936.ApplyScreenCubit(gh<_i510.ApplyDriverUseCase>()),
    );
    return this;
  }
}

class _$DioInjection extends _i285.DioInjection {}
