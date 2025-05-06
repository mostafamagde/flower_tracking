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

import '../../features/auth/forget_password/data/data_sources/contract/forget_password_data_source_contract.dart'
    as _i356;
import '../../features/auth/forget_password/data/data_sources/impl/forget_password_data_source_impl.dart'
    as _i277;
import '../../features/auth/forget_password/data/repositories/forget_password_repo_impl.dart'
    as _i55;
import '../../features/auth/forget_password/domain/repositories/forget_password_repo.dart'
    as _i924;
import '../../features/auth/forget_password/domain/use_cases/forget_password_use_case.dart'
    as _i913;
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
    gh.factory<_i356.ForgetPasswordDataSourceContract>(
      () =>
          _i277.ForgetPasswordDataSourceImpl(apiClient: gh<_i266.RestClient>()),
    );
    gh.factory<_i924.ForgetPasswordRepo>(
      () => _i55.ForgetPasswordRepoImpl(
        dataSource: gh<_i356.ForgetPasswordDataSourceContract>(),
      ),
    );
    gh.factory<_i913.ForgetPasswordUseCase>(
      () => _i913.ForgetPasswordUseCase(repo: gh<_i924.ForgetPasswordRepo>()),
    );
    return this;
  }
}

class _$DioInjection extends _i285.DioInjection {}
