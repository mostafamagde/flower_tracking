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

import '../../features/auth/login/data/data_source_contract/login_data_source_contract.dart'
    as _i230;
import '../../features/auth/login/data/data_source_impl/login_data_source_impl.dart'
    as _i1;
import '../../features/auth/login/data/repository_impl/login_repository_impl.dart'
    as _i768;
import '../../features/auth/login/domain/repository_contract/login_repository_contract.dart'
    as _i689;
import '../../features/auth/login/domain/use_case/login_use_case.dart' as _i630;
import '../../features/auth/login/presentation/cubit/login_cubit.dart' as _i126;
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
    gh.factory<_i230.LoginDataSourceContract>(
      () => _i1.LoginDataSourceImpl(gh<_i266.RestClient>()),
    );
    gh.factory<_i689.LoginRepositoryContract>(
      () => _i768.LoginRepositoryImpl(gh<_i230.LoginDataSourceContract>()),
    );
    gh.factory<_i630.LoginUseCase>(
      () => _i630.LoginUseCase(gh<_i689.LoginRepositoryContract>()),
    );
    gh.factory<_i126.LoginCubit>(
      () => _i126.LoginCubit(gh<_i630.LoginUseCase>()),
    );
    return this;
  }
}

class _$DioInjection extends _i285.DioInjection {}
