import 'package:flower_tracking/core/api_manager/api_execute.dart';
import 'package:flower_tracking/core/models/result.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api_manager/api_manager.dart';
import '../../domain/entity/login_request_entity.dart';
import '../../domain/entity/login_response_entity.dart';
import '../data_source_contract/login_data_source_contract.dart';
import '../mapper/login_mapper.dart';

@Injectable(as: LoginDataSourceContract)
class LoginDataSourceImpl implements LoginDataSourceContract {
  final RestClient _restClient;

  @factoryMethod
  LoginDataSourceImpl(this._restClient);

  @override
  Future<Result<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    return await ApiExecute.executeApi(() async {
      var response = await _restClient.login(LoginMapper.toDto(request));
      return LoginMapper.toEntity(response);
    });
  }
}


